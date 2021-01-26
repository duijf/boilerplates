# LaTeX doc

LaTeX article. Features:

 - TeXlive via Nix. Starts with scheme-small, but allows for customozation
   with any package from CTAN. See shell.nix for details.
 - Build with latexrun and xelatex

## Setup

```
# Start the development shell
$ nix-shell --command $SHELL

# Build all PDFs
$ make

# Build doc.tex, open in mupdf, rebuild on file change.
# This automatically works for new .tex files you add to
# this directory.
$ make watch-doc
```
