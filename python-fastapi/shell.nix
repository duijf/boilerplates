let
  pkgs = import ./nix/nixpkgs.nix {};
  pythonEnv = pkgs.python39.withPackages (ps: [
    ps.black
    ps.flake8
    ps.asyncpg
    ps.uvicorn
    ps.funcy
    ps.hypothesis
    ps.typer
    ps.isort
    ps.mypy
    ps.pdoc
    ps.pytest
    ps.fastapi
  ]);
in
pkgs.mkShell {
  name = "fastapi-devenv";
  buildInputs = [
    pythonEnv
    pkgs.overmind
    pkgs.postgresql_13
  ];
}
