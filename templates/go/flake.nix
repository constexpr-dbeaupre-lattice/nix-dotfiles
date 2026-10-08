{
  description = "Go development shell";

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
          go
          gopls
          gotools
          golangci-lint
          govulncheck
          delve
        ];

        # Delve compiles cgo code without optimizations, which fortify warns about.
        hardeningDisable = [ "fortify" ];

        # Stick to the Go from Nix instead of downloading the one go.mod asks for.
        GOTOOLCHAIN = "local";

        shellHook = ''
          echo "Go dev shell:"
          echo "  - Go             ${pkgs.go.version}"
          echo "  - gopls          ${pkgs.gopls.version}"
          echo "  - golangci-lint  ${pkgs.golangci-lint.version}"
          echo "  - Delve          ${pkgs.delve.version}"
        '';
      };
    };
}
