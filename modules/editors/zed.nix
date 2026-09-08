{
  flake.modules.homeManager.zed = { pkgs, ...}: {
    programs.zed-editor = {
      enable = true;
      defaultEditor = true;
      mutableUserSettings = true;
      mutableUserKeymaps = false;
      mutableUserTasks = false;
      extensions = [
        "nix"
        "catppuccin"
        "catppuccin-blur"
        "catppuccin-icons"
      ];
      extraPackages = with pkgs; [
        nixd
        alejandra
      ];
      userSettings = {
        languages.Nix = {
          language_servers = [ "nixd" ];
          formatter.external = {
            command = "${pkgs.alejandra}/bin/alejandra";
            arguments = [ "--quiet" "--" ];
          };
        };
        lsp.nixd = {
          binary.path = "${pkgs.nixd}/bin/nixd";
          settings.nixd = {
            nixpkgs.expr =
              "import (builtins.getFlake (toString ./../..)).inputs.nixpkgs { }";
            options.nixos.expr =
              "(builtins.getFlake (toString ./../..)).nixosConfigurations.cocytus.options";
            # Required for Home Manager option completion when HM is
            # integrated into the NixOS configuration.
            options.home-manager.expr =
              "(builtins.getFlake (toString ./../..)).nixosConfigurations.cocytus.options.home-manager.users.type.getSubOptions []";
          };
        };
      };
    };
  };
}