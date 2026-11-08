{self, ...}: {
  flake.modules.nixos.builder = {
    config,
    pkgs,
    inputs,
    ...
  }: let
    builder = pkgs.writeShellApplication {
      name = "nightly-build";
      runtimeInputs = [
        config.nix.package
        (pkgs.callPackage "${inputs.pnix}/package.nix" {})
        pkgs.nix-fast-build
        pkgs.wakeonlan
        pkgs.coreutils
        pkgs.git
        pkgs.rsync
        pkgs.openssh
        pkgs.curl
        pkgs.jq
        pkgs.bash
      ];
      text = ''
        	     	#!/usr/bin/env bash
        	      set -euo pipefail
        	      umask 077

        	      state=''${STATE_DIRECTORY:?Run through nightly-build.service}
        	      : "''${CREDENTIALS_DIRECTORY:?Missing service credentials}"
        	      : "''${GIT_SSH_COMMAND:?Missing Git SSH configuration}"
        	      [[ $state == /* && $state != / ]]
        	      [[ -r $CREDENTIALS_DIRECTORY/ssh ]]
        	      [[ -r $CREDENTIALS_DIRECTORY/discord_webapp ]]

        	      source_dir=$state/source
        	      results=$state/results.json
        	      started=$(date --iso-8601=seconds)
        	      stage=sync

        	      notify() {
        	        local rc=$1 outcome=SUCCESS failures=none message payload webhook
        	        if ((rc != 0)); then
        	          outcome=FAILED
        	        fi
        	        if [[ -s $results ]]; then
        	          failures=$(jq -r '[.results[] | select(.success == false) | .attr] | unique | join(", ")' "$results") || failures=unknown
        	          failures=''${failures:-none}
        	        fi

        	        message="Nightly builds: $outcome
        	      Stage: $stage
        	      Failed targets: ''${failures:0:600}
        	      Started: $started
        	      Finished: $(date --iso-8601=seconds)
        	      Logs on Naraka: journalctl -u nightly-build.service --since '$started'"
        	        payload=$(jq -cn --arg content "$message" \
        	          '{content: $content, allowed_mentions: {parse: []}}') || return 1
        	        webhook=$(< "$CREDENTIALS_DIRECTORY/discord_webapp")

        	        # shortcut: standard Discord webhook URLs only; extend if thread URLs are needed.
        	        if [[ ! $webhook =~ ^https://(discord\.com|discordapp\.com)/api/webhooks/[0-9]+/[A-Za-z0-9._-]+$ ]]; then
        	          printf 'Discord credential is not a standard webhook URL\n' >&2
        	          return 1
        	        fi

        	        # The URL goes through stdin, not process arguments or response logs.
        	        printf 'url = "%s"\n' "$webhook" |
        	          curl --config - --silent --fail --output /dev/null \
        	            --connect-timeout 10 --max-time 30 \
        	            --header 'Content-Type: application/json' --data-binary "$payload"
        	      }

        	      finish() {
        	        local rc=$?
        	        trap - EXIT
        	        printf 'Nightly build finished: stage=%s exit=%s\n' "$stage" "$rc"
        	        if ! notify "$rc"; then
        	          printf 'Discord delivery failed; original job exit status is %s\n' "$rc" >&2
        	        fi
        	        exit "$rc"
        	      }
        	      trap finish EXIT

        	      printf 'Nightly build started: %s\n' "$started"
        	      [[ ! -L $source_dir ]]
        	      mkdir -p "$source_dir"
        	      rm -f -- "$results"
               stage=wake
               wakeonlan -i 192.168.0.255 30:c5:99:7a:06:4e

               stage=wait-for-cocytus
               timeout 180 bash -c '
                 until ssh -n \
                   -o BatchMode=yes \
                   -o ConnectTimeout=5 \
                   -o ConnectionAttempts=1 \
                   stalkingwolf@cocytus true
                 do
                   sleep 5
                 done
               '

               stage=sync

        	      rsync -rlt --delete --safe-links --timeout=120 \
        	        -e 'ssh -o BatchMode=yes -o ConnectTimeout=15 -o ConnectionAttempts=1' \
        	        --exclude='.git/' --exclude='.direnv/' --exclude='.ssh/' \
        	        --exclude='.env' --exclude='.env.*' --exclude='node_modules/' \
        	        --exclude='/result*' \
        	        stalkingwolf@cocytus:/home/stalkingwolf/local/nixos/ "$source_dir/"

        	      stage=pin-refresh
        	      pnix --project "$source_dir" update --refresh

        	      stage=build
        	      # No --fail-fast: attempt both hosts. No output links: existing GC handles outputs.
        	      nix-fast-build \
        	        --nix "$(command -v nix)" --nix-build "$(command -v nix-build)" \
        	        --flake "path:$source_dir#nixosConfigurations" \
        	        --systems x86_64-linux --max-jobs 1 --eval-workers 1 \
        	        --no-nom --result-file "$results" \
        	        --select 'configs: builtins.mapAttrs (_: c: c.config.system.build.toplevel) { inherit (configs) cocytus naraka; }'

        	      stage=complete
      '';
    };
  in {
    systemd.services.nightly-build = {
      description = "Refresh pins and build hosts";
      wants = ["network-online.target"];
      after = [
        "network-online.target"
        "tailscaled.service"
      ];

      environment.GIT_SSH_COMMAND =
        "${pkgs.openssh}/bin/ssh"
        + " -i \"$CREDENTIALS_DIRECTORY/ssh\""
        + " -o IdentitiesOnly=yes"
        + " -o BatchMode=yes";

      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${builder}/bin/nightly-build";
        User = "stalkingwolf";
        Group = "users";
        StateDirectory = "nightly-builds";
        StateDirectoryMode = "0700";
        WorkingDirectory = "/var/lib/nightly-builds";
        UMask = "0077";
        TimeoutStartSec = "infinity";
        LoadCredential = [
          "ssh:${config.security.nix-secrets.secrets.ssh.path}"
          "discord_webapp:${config.security.nix-secrets.secrets.discord_webapp.path}"
        ];
      };
    };

    systemd.timers.nightly-build = {
      description = "Nightly builds at 05:00";
      wantedBy = ["timers.target"];

      timerConfig = {
        OnCalendar = "*-*-* 05:00:00 Asia/Singapore";
        AccuracySec = "1min";
        RandomizedDelaySec = 0;
        Persistent = false;
        Unit = "nightly-build.service";
      };
    };
    programs.ssh.knownHosts."github.com".publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl";
  };

  flake.modules.nixos.builder-secrets = {
    security.nix-secrets.secrets = {
      discord_webapp.recipients = ["naraka"];
      ssh.recipients = ["naraka"];
    };
  };

  flake.modules.nixos.naraka-secrets.imports = [self.modules.nixos.builder-secrets];
}
