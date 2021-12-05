let
  pkgs = import ./nix/nixpkgs.nix {};
  hls = pkgs.haskellPackages.callPackage ./nix/hls.nix {};
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
    hls
    pkgs.cabal-install
  ];
}
