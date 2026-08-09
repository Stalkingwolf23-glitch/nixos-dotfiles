{
  ...
}:

{
  flake-file.inputs.firefox-addons = {
    url = "gitlab:rycee/nur-expressions";
    dir = "pkgs/firefox-addons";
  };

  flake.modules.homeManager.zen = { inputs, pkgs, ... }:
    let
      system = pkgs.stdenv.hostPlatform.system;
      firefox-addons = inputs.firefox-addons.packages.${system};
      buildFirefoxXpiAddon = inputs.firefox-addons.lib.${system}.buildFirefoxXpiAddon;

      pixiv-toolkit = buildFirefoxXpiAddon {
        pname = "pixiv-toolkit";
        version = "5.5.3";
        addonId = "{6706d386-2d33-4e1e-bbf1-51b9e1ce47e1}";
        url = "https://github.com/leoding86/webextension-pixiv-toolkit/releases/download/5.5.3/firefox.xpi";
        sha256 = "sha256-EUepGRYWBDigTM1ORzzhkyzzMttPHN6pvjAXnsVzw74=";
        meta = with pkgs.lib; {
          homepage = "https://github.com/leoding86/webextension-pixiv-toolkit";
          description = "Pixiv Toolkit (self-distributed build, not the AMO-listed version)";
          platforms = platforms.all;
        };
      };

      mkExtensionSettings = builtins.mapAttrs (
        _: pluginId: {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
          installation_mode = "force_installed";
        }
      );
    in
    {
      programs.zen-browser.profiles."default".extensions.packages =
        (with firefox-addons; [
          ublock-origin
          vimium
          augmented-steam
          simple-translate
          indie-wiki-buddy
          bitwarden
          steam-database
          darkreader
          reddit-enhancement-suite
          stylus
          toxcancel
        ])
        ++ [ pixiv-toolkit ];

      programs.zen-browser.policies.ExtensionSettings = mkExtensionSettings {
        "{c2bb68c6-08f2-4fb9-9f4f-8f6cdedc2945}" = "fallen-london-item-search1";
        "{d7ff40a7-ef42-40e9-9529-78ad86dfc8be}" = "fallen-london-library";
        "{5f5950be-7601-4d7e-9971-a2e5c856ffdc}" = "fl-wiki-redirector";
        "{39cfa3ab-7970-43e4-8643-743d501b4486}" = "fl-1-click-wiki";
        "{4d38d9d9-d146-42e5-8349-c9676f55dc0e}" = "fl-time-keeper";
      };
    };
}
