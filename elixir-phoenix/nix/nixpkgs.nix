# Pinned version of Nixpkgs + default overlays.
let
  pkgsTarball = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/a39ee95a86b1fbdfa9edd65f3810b23d82457241.tar.gz";
    sha256 = "sha256:11sk5hz51189g6a5ahq3s1y65145ra8kcgzfjkmrjp1jzn7h68q8";
  };

  projectOverlay = import ./overlay.nix;
in

# Capture the arguments we pass to Nixpkgs when this file is imported.
# Ensure we add our own default nixpkgs overlay so we don't need to
# specify it at all call-sites.
args@{
  overlays ? [],
  ...
}:
  let
    newOverlays = [ projectOverlay ] ++ overlays;
    newArgs = args // { overlays = newOverlays; };
  in
    import pkgsTarball newArgs
