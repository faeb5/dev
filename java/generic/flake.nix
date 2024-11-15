{
  description = "Generic Java development environment";

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
        packages = with pkgs; [jdk jdt-language-server maven gradle];
        shellHook = ''echo "Welcome to the generic Java development environment"'';
      };
  };
}
