let
  pkgs = import ./nix/nixpkgs.nix {};
  haskellEnv = pkgs.haskellPackages.ghcWithPackages (ps: [
    ps.bytestring
    ps.directory
    ps.filepath
    ps.hspec
    ps.optparse-generic
    ps.text
  ]);
in
pkgs.mkShell {
  name = "haskell-cli-devenv";
  buildInputs = [
    haskellEnv
    pkgs.cabal-install
  ];
}
