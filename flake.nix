{
  description = "Standalone Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      homeConfigurations.dbeaupre = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };

      templates = {
        cpp = {
          path = ./templates/cpp;
          description = "C++ + CMake development shell";
        };
        go = {
          path = ./templates/go;
          description = "Go development shell";
        };
        groovy = {
          path = ./templates/groovy;
          description = "Groovy + Gradle development shell";
        };
        python = {
          path = ./templates/python;
          description = "Python + uv development shell";
        };
        rust = {
          path = ./templates/rust;
          description = "Rust + Cargo development shell";
        };
      };
    };
}
