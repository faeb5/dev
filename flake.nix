{
  description = "Flake templates for various development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    formatter.x86_64-linux = pkgs.alejandra;
    templates = {
      go = {
        path = ./templates/golang/generic;
        description = "Generic Go development environment";
      };
      java = {
        path = ./templates/java/generic;
        description = "Generic Java development environment";
      };
      lua = {
        path = ./templates/lua/generic;
        description = "Generic Lua development environment";
      };
    };
  };
}
