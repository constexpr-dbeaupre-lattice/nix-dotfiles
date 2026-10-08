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

      # mypy only sees packages next to its own interpreter, so point it at the venv.
      mypy = pkgs.writeShellApplication {
        name = "mypy";
        text = ''
          if [[ -n "''${VIRTUAL_ENV:-}" && -x "$VIRTUAL_ENV/bin/python" ]]; then
            exec ${pkgs.lib.getExe pkgs.mypy} --python-executable "$VIRTUAL_ENV/bin/python" "$@"
          fi
          exec ${pkgs.lib.getExe pkgs.mypy} "$@"
        '';
      };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          python
          pkgs.uv
          pkgs.ruff
          pkgs.pyright
          mypy
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
          echo "  - mypy     ${pkgs.mypy.version}"
        '';
      };
    };
}
