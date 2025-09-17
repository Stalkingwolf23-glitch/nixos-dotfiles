{ pkgs, ...}:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}
