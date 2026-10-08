{
  description = "Rust + Cargo development shell";

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
          rustc
          cargo
          clippy
          rustfmt
          rust-analyzer
          cargo-audit
          pkg-config
        ];

        buildInputs = with pkgs; [
          openssl
        ];

        # Let rust-analyzer find the standard library sources.
        RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";

        shellHook = ''
          echo "Rust dev shell:"
          echo "  - rustc          ${pkgs.rustc.version}"
          echo "  - cargo          ${pkgs.cargo.version}"
          echo "  - rust-analyzer  ${pkgs.rust-analyzer.version}"
        '';
      };
    };
}
