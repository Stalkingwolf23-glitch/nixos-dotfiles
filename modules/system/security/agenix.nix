{ inputs, ... }:

{
  flake-file.inputs.agenix = {
    url = "github:ryantm/agenix";
    inputs.darwin.follows = "";
  };

  imports = [ inputs.agenix.nixosModules.default ];
}
