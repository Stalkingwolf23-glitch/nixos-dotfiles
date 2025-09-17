{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ firejail ];
  programs.firejail.enable = false;
  programs.firejail.wrappedBinaries = {
    steam = {
      executable = "${pkgs.steam}/bin/steam";
      profile = "${pkgs.firejail}/etc/firejail/steam.profile";
    };
    steam-run = {
      executable = "${pkgs.steam}/bin/steam-run";
      profile = "${pkgs.firejail}/etc/firejail/steam.profile";
    };
  };
}
