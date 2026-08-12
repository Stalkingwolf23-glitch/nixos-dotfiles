{ self, ... }:

{
  flake.modules.homeManager.applications-env = {
    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      NIXOS_XDG_OPEN_USE_PORTAL = "1";
      APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
    };
  };

  flake.modules.homeManager.applications.imports = [ self.modules.homeManager.applications-env ];
}
