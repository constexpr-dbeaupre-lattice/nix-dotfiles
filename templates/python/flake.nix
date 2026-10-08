{
  description = "Python + uv development shell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      python = pkgs.python3;
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          python
          pkgs.uv
          pkgs.ruff
          pkgs.pyright
        ];

        # Make uv use the Python from Nix instead of downloading its own.
        UV_PYTHON = python.interpreter;
        UV_PYTHON_DOWNLOADS = "never";

        # Trust the system certificate store, which includes TLS inspection CAs.
        UV_SYSTEM_CERTS = "1";

        # Prebuilt wheels with C++ extensions (matplotlib, grpcio, ...) expect these libraries.
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
          pkgs.stdenv.cc.cc.lib
          pkgs.zlib
        ];

        shellHook = ''
          # Keep the Nix interpreter's site-packages out of the virtual environment.
          unset PYTHONPATH
          export VIRTUAL_ENV="$PWD/.venv"
          export PATH="$VIRTUAL_ENV/bin:$PATH"

          echo "Python dev shell:"
          echo "  - Python   ${python.version}"
          echo "  - uv       ${pkgs.uv.version}"
          echo "  - ruff     ${pkgs.ruff.version}"
          echo "  - pyright  ${pkgs.pyright.version}"
        '';
      };
    };
}
