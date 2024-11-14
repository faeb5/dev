{
  description = "Generic Go development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShells.x86_64-linux.default = with pkgs;
      mkShellNoCC {
        packages = with pkgs; [go_1_23 gopls gotools golangci-lint golangci-lint-langserver];
        shellHook = ''echo "Welcome to the generic Go development environment"'';
      };
  };
}
