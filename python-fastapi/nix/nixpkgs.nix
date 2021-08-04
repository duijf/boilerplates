# Pinned version of Nixpkgs + default overlays.
let
  pkgsTarball = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/0747387223edf1aa5beaedf48983471315d95e16.tar.gz";
    sha256 = "sha256:19hpz87vfcr6icxcjdlp2mnk8v5db4l3x32adzc5ynmxvfayg3lr";
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
