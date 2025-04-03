{
  description = "Generic Lua development environment";

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
    devShells.x86_64-linux.default = with pkgs;
      mkShellNoCC {
        buildInputs = with pkgs; [lua];
        packages = with pkgs; [lua-language-server stylua];
        shellHook = ''echo "Welcome to the generic Lua development environment"'';
      };
  };
}
