{
  description = "Groovy + Gradle development shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          jdk21
          groovy
          gradle
        ];

        JAVA_HOME = "${pkgs.jdk21}/lib/openjdk";

        shellHook = ''
          echo "Groovy dev shell:"
          echo "  - JDK     ${pkgs.jdk21.version}"
          echo "  - Groovy  ${pkgs.groovy.version}"
          echo "  - Gradle  ${pkgs.gradle.version}"
        '';
      };
    };
}
