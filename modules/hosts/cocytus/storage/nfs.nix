{
  flake.modules.nixos.cocytus-nfs = {
    services.nfs.server = {
      enable = true;
      exports = ''/srv/nfs 100.119.80.18(ro,sync,fsid=0,crossmnt,no_subtree_check)'';
      # Formatting for nfs exports would be placed after /srv/nfs for any new folders in their respective .nix file
    };
  };
}
