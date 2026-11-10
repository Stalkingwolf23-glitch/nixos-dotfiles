{
  self,
  inputs,
  user,
  ...
}: {
  flake.modules.nixos.user = {
    imports = [inputs.home-manager.nixosModules.default];

    users.users.${user}.isNormalUser = true;

    home-manager = {
      useUserPackages = true;
      extraSpecialArgs = {inherit inputs user;};

      users.${user} = {
        imports = [self.modules.homeManager.terminal];

        home = {
          username = user;
          homeDirectory = "/home/${user}";
        };
      };
    };
  };
}
