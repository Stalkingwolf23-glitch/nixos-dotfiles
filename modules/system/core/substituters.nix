{
  nix.settings = {
    extra-substituters = [
      "https://attic.xuyh0120.win/lantian" # cachy kernel cache
      "https://niri-nix.cachix.org" # niri-nix cache
      "https://noctalia.cachix.org" # noctalia cache
    ];
    extra-trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };
}
