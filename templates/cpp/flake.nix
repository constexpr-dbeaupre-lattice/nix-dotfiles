{
  description = "C++ development shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        # Build-time tools; stdenv already provides gcc.
        packages = [
          pkgs.clang-tools
          pkgs.cmake
          pkgs.gdb
          pkgs.pkg-config
        ];

        # Libraries the project links against (e.g. pkgs.opencv).
        buildInputs = [ ];
      };
    };
}
