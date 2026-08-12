{ self, ... }:

{
  flake.modules.homeManager.kvantum =
    { pkgs, ... }:
    let
      kvantum = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "kvantum";
        rev = "71105d224fef95dd023691303477ce3eea487457";
        hash = "sha256-gcvCVZjVbj5fRZWaM+mZTwH/g158MH36JmMuMgCBuqQ=";
      };

      replace = builtins.readFile "${kvantum}/themes/catppuccin-mocha-blue/catppuccin-mocha-blue.kvconfig";

      blurConfig =
        builtins.replaceStrings
          [
            "translucent_windows=false"
            "blurring=false"
            "blur_translucent=false"
            "transparent_dolphin_view=false"
          ]
          [
            "translucent_windows=true"
            "blurring=true"
            "blur_translucent=true"
            "transparent_dolphin_view=true"
          ]
          replace;
    in
    {
      home.packages = with pkgs; [
        kdePackages.qtstyleplugin-kvantum
        libsForQt5.qtstyleplugin-kvantum
      ];

      home.file = {
        ".config/Kvantum/kvantum.kvconfig".text = ''
          [General]
          theme=catppuccin-mocha-blue
        '';

        ".config/Kvantum/catppuccin-mocha-blue/catppuccin-mocha-blue.svg".source =
          "${kvantum}/themes/catppuccin-mocha-blue/catppuccin-mocha-blue.svg";

        ".config/Kvantum/catppuccin-mocha-blue/catppuccin-mocha-blue.kvconfig".text = blurConfig;
      };
    };

  flake.modules.homeManager.style.imports = [ self.modules.homeManager.kvantum ];
}
