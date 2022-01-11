let
  pkgs = import ./nix/nixpkgs.nix {};

  common = [
    pkgs.beam.packages.erlangR24.elixir_1_13 # Language runtime
    pkgs.beam.packages.erlangR24.rebar3      # Erlang package manager
    pkgs.overmind       # Process runner
    pkgs.postgresql_14  # Database
    pkgs.esbuild        # Assets
  ];

  linuxExtra = [
    pkgs.inotify-tools  # File system watcher
  ];

  darwinExtra = [
    pkgs.terminal-notifier  # For ExUnit terminal notifications
    pkgs.darwin.apple_sdk.frameworks.CoreFoundation  # Support for C stuff.
    pkgs.darwin.apple_sdk.frameworks.CoreServices    # Support for C stuff.
  ];

in
  pkgs.mkShell {
    name = "phoenix-devenv";

    buildInputs = common ++
      pkgs.lib.optionals pkgs.stdenv.isLinux linuxExtra ++
      pkgs.lib.optionals pkgs.stdenv.isDarwin darwinExtra;
  }
