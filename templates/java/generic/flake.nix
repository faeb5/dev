{
  description = "Generic Java development environment";

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
        buildInputs = with pkgs; [jdk maven];
        packages = with pkgs; [jdt-language-server lombok google-java-format];
        LOMBOK_HOME = "${lombok}/share/java";
        JDTLS_HOME = "${jdt-language-server}/share/java/jdtls";
        shellHook = ''echo "Welcome to the generic Java development environment"'';
      };
  };
}
