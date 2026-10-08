{
  description = "Groovy + Gradle development shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
          groovy-language-server
          npm-groovy-lint
        ];

        JAVA_HOME = "${pkgs.jdk21}/lib/openjdk";

        shellHook = ''
          # The JDK hook puts groovy-language-server's jar (bundling Groovy 4) on CLASSPATH.
          unset CLASSPATH

          echo "Groovy dev shell:"
          echo "  - JDK              ${pkgs.jdk21.version}"
          echo "  - Groovy           ${pkgs.groovy.version}"
          echo "  - Gradle           ${pkgs.gradle.version}"
          echo "  - npm-groovy-lint  ${pkgs.npm-groovy-lint.version}"
        '';
      };
    };
}
