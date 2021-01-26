with import ./nixpkgs.nix {};

let
  texEnv = texlive.combine {
    inherit (texlive)
      # Font, looks a bit like like Palatino
      crimson

      # Texlive small scheme
      scheme-small;
  };
in
  pkgs.mkShell {
    name = "tex-devenv";
    buildInputs = [
      entr
      latexrun
      mupdf
      procps
      texEnv
    ];

    FONTCOFNIG_FILE = makeFontsConf { fontDirectories = [ crimson lmodern ]; };
  }
