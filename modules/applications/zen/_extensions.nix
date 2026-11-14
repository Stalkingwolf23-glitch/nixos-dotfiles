{ pkgs, ... }: let
  pixiv-toolkit = pkgs.fetchurl {
    name = "pixiv-toolkit-5.5.3.xpi";
    url = "https://github.com/leoding86/webextension-pixiv-toolkit/releases/download/5.5.3/firefox.xpi";
    hash = "sha256-EUepGRYWBDigTM1ORzzhkyzzMttPHN6pvjAXnsVzw74=";
  };

  mkExtensionSettings = builtins.mapAttrs (
    _: pluginId: {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
      installation_mode = "force_installed";
    }
  );
in {
  programs.zen-browser.policies.ExtensionSettings =
    mkExtensionSettings {
      "{c2bb68c6-08f2-4fb9-9f4f-8f6cdedc2945}" = "fallen-london-item-search1";
      "{d7ff40a7-ef42-40e9-9529-78ad86dfc8be}" = "fallen-london-library";
      "{5f5950be-7601-4d7e-9971-a2e5c856ffdc}" = "fl-wiki-redirector";
      "{39cfa3ab-7970-43e4-8643-743d501b4486}" = "fl-1-click-wiki";
      "{4d38d9d9-d146-42e5-8349-c9676f55dc0e}" = "fl-time-keeper";
      "{c84d89d9-a826-4015-957b-affebd9eb603}" = "mal-sync";
      "uBlock0@raymondhill.net" = "ublock-origin";
      "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = "vimium-ff";
      "{1be309c5-3e4f-4b99-927d-bb500eb4fa88}" = "augmented-steam";
      "firefox-extension@steamdb.info" = "steam-database";
      "simple-translate@sienori" = "simple-translate";
      "{cb31ec5d-c49a-4e5a-b240-16c767444f62}" = "indie-wiki-buddy";
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
      "addon@darkreader.org" = "darkreader";
      "jid1-xUfzOsOFlzSOXg@jetpack" = "reddit-enhancement-suite";
      "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = "styl-us";
      "redirector@einaregilsson.com" = "redirector";
    }
    // {
      "{6706d386-2d33-4e1e-bbf1-51b9e1ce47e1}" = {
        install_url = "file://${pixiv-toolkit}";
        installation_mode = "force_installed";
        updates_disabled = true;
      };
    };
}
