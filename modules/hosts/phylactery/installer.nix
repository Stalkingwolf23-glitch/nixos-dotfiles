{
  flake.modules.nixos.phylactery-installer = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      btop
      pciutils
      usbutils
      curl
      wget
      (pkgs.writeShellApplication
        {
          name = "nix-installer";
          runtimeInputs = with pkgs; [
            # Installer
            coreutils
            git
            gum
            util-linux
            networkmanager
            util-linux
          ];
          text = ''
            repo="$HOME/nixos"
            repo_url="https://github.com/Stalkingwolf23-glitch/nixos-dotfiles"
            # Wait for NetworkManager to establish a connection.
            while true; do
              if nm-online -q -t 5; then
                break
              fi
              if ! gum confirm "Network is not connected. Retry?"; then
                echo "Installation cancelled."
                exit 1
              fi
            done
            # Verify external HTTPS access.
            while true; do
              if curl \
                --fail \
                --silent \
                --show-error \
                --connect-timeout 5 \
                --max-time 15 \
                https://github.com/ >/dev/null
              then
                break
              fi
              if ! gum confirm "GitHub is unreachable. Retry?"; then
                echo "Installation cancelled."
                exit 1
              fi
            done
            # Clone the configuration repository if necessary.
            if [ ! -d "$repo/.git" ]; then
              if [ -e "$repo" ]; then
                echo "ERROR: $repo exists but is not a Git repository"
                exit 1
              fi
              echo "Cloning NixOS configuration..."
              git clone "$repo_url" "$repo"
            fi
            # Select the target host.
            TARGET_HOST="$(
              printf '%s\n' cocytus naraka |
                gum choose --header="Select the host to install"
            )"
            [ -n "$TARGET_HOST" ] || exit 0
            # Read the selected host's preservation setting.
            if ! persistence="$(
              nix \
                --extra-experimental-features "nix-command flakes" \
                eval \
                --json \
                --no-write-lock-file \
                "$repo#nixosConfigurations.$TARGET_HOST.config.preservation.enable" \
                2>/dev/null
            )"; then
              persistence=false
              fi
              case "$persistence" in
                true|false)
                  ;;
                *)
                  echo "ERROR: invalid preservation value: $persistence"
                  exit 1
                  ;;
              esac
              echo "Persistence enabled: $persistence"
              # List disks and select Disko's main device.
              disk_options="$(
                lsblk -dpno NAME,SIZE,MODEL,TYPE |
                  grep ' disk$' || true
              )"
              if [ -z "$disk_options" ]; then
                echo "ERROR: no disks found"
                exit 1
              fi
              disk_choice="$(
                printf '%s\n' "$disk_options" |
                  gum choose --header="Select the disk for Disko's main device"
              )"
              [ -n "$disk_choice" ] || exit 0
              read -r target_disk _ <<< "$disk_choice"
              # Refuse to continue if the selected path is not a block device.
              if [ ! -b "$target_disk" ]; then
                echo "ERROR: selected path is not a block device: $target_disk"
                ls -l "$target_disk"
                exit 1
              fi
              lsblk "$target_disk"
              # Disko will erase the selected disk.
              if ! gum confirm \
                --default=false \
                "Disko will erase only $target_disk. Continue?"
              then
                exit 0
              fi
              # Shared Disko layout used for the storage phase.
              layout="$repo/modules/system/disko/_zfs.nix"
              if [ ! -f "$layout" ]; then
                echo "ERROR: shared Disko layout not found: $layout"
                exit 1
              fi
              # Phase 1: partition, format, encrypt, and mount the target disk.
              echo "Partitioning and mounting $target_disk..."
              disko_log="/tmp/disko-install.log"
              set +e
              sudo nix \
                --extra-experimental-features "nix-command flakes" \
                run github:nix-community/disko/latest -- \
                --mode destroy,format,mount \
                --argstr device "$target_disk" \
                --arg persistence "$persistence" \
                "$layout" 2>&1 |
                tee "$disko_log"
              disko_status="''${PIPESTATUS[0]}"
              set -e
              if [ "$disko_status" -ne 0 ]; then
                echo
                echo "ERROR: Disko failed with exit status $disko_status"
                echo "Disko log saved to: $disko_log"
                echo
                gum confirm "Open a shell for troubleshooting?" || exit "$disko_status"
                exec bash
              fi
              # Verify that the target root and Nix store are mounted.
              if ! mountpoint -q /mnt; then
                echo "ERROR: target root is not mounted at /mnt"
                exit 1
              fi
              if ! mountpoint -q /mnt/nix; then
                echo "ERROR: target /nix is not mounted"
                exit 1
              fi
              # Verify /persist only when enabled by the selected host.
              if [ "$persistence" = true ] &&
                 ! mountpoint -q /mnt/persist
              then
                echo "ERROR: /mnt/persist is not mounted"
                exit 1
              fi
              echo "Target mounts:"
              findmnt -T /mnt
              findmnt -T /mnt/nix
              if [ "$persistence" = true ]; then
                findmnt -T /mnt/persist
              fi
              echo "Target storage:"
              df -h /mnt /mnt/nix
              if [ "$persistence" = true ]; then
                df -h /mnt/persist
              fi
              # Phase 2: build into the mounted target store and install.
              if ! gum confirm "Continue installing $TARGET_HOST?"; then
                exit 0
              fi
              echo "Installing $TARGET_HOST..."
              sudo nixos-install \
                --flake "$repo#$TARGET_HOST" \
                --no-channel-copy
          '';
        })
    ];

    environment.etc."xdg/autostart/nixos-install.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=NixOS Installer
      Exec=${pkgs.kdePackages.konsole}/bin/konsole -e nix-installer
      X-KDE-autostart-after=panel
    '';

    environment.etc."xdg/baloofilerc".text = ''
      [Basic Settings]
      Indexing-Enabled=false
    '';
  };
}
