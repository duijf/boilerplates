let
  rev = "56cbe42f1668338d05febfbb866e32f2c865609a";
  pkgsTarball = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    sha256 = "sha256:0m9q6g1yk9vq58ffzy17c46n4nfkjqncbn2mr9r9bp3i4j1sp7w9";
  };
in
  import pkgsTarball
