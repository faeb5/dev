{
  description = "Flake templates for various development environments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    formatter.x86_64-linux = pkgs.alejandra;
    templates = {
      go-dev = {
        path = ./golang/generic;
        description = "Generic Go development environment";
      };
      java-dev = {
        path = ./java/generic;
        description = "Generic Java development environment";
      };
    };
  };
}
