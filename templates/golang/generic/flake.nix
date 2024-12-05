{
  description = "Generic Go development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.my-module = with pkgs;
      buildGoModule rec {
        pname = "my-module";
        version = "0.0.1";
        src = ./.;
        vendorHash = null;
      };
    packages.x86_64-linux.default = self.packages.x86_64-linux.my-module;
    devShells.x86_64-linux.default = with pkgs;
      mkShellNoCC {
        packages = with pkgs; [go gopls gotools golangci-lint];
        shellHook = ''echo "Welcome to the generic Go development environment"'';
      };
  };
}
