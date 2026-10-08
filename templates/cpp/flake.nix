{
  description = "C++ + CMake development shell";

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
          cmake
          ninja
          pkg-config
          clang-tools
          cppcheck
          gdb
          valgrind
        ];

        buildInputs = with pkgs; [
          gtest
        ];

        # Fortify warns when compiling without optimizations, as in Debug builds.
        hardeningDisable = [ "fortify" ];

        # Default generator and compile_commands.json for clangd and clang-tidy.
        CMAKE_GENERATOR = "Ninja";
        CMAKE_EXPORT_COMPILE_COMMANDS = "ON";

        shellHook = ''
          echo "C++ dev shell:"
          echo "  - GCC          ${pkgs.stdenv.cc.version}"
          echo "  - CMake        ${pkgs.cmake.version}"
          echo "  - clang-tools  ${pkgs.clang-tools.version}"
          echo "  - cppcheck     ${pkgs.cppcheck.version}"
          echo "  - GoogleTest   ${pkgs.gtest.version}"
        '';
      };
    };
}
