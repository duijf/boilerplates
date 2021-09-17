let
  pkgs = import ./nix/nixpkgs.nix {};
in
pkgs.mkShell {
  name = "phoenix-devenv";
  buildInputs = [
    pkgs.elixir_1_12    # Language runtime
    pkgs.inotify-tools  # Filesystem watcher (phoenix dep)
    pkgs.overmind       # Process runner
    pkgs.postgresql_13  # Database
    pkgs.rebar3         # Erlang package manager
  ];

  shellHook = ''
    export MIX_REBAR3="$(which rebar3)"
  '';
}
