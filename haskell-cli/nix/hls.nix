# Custom Haskell Language server derivation because the default one
# from Nixpkgs is broken on macOS due to NixOS/nixpkgs#140774.
# Here, we work around the problem by removing the dependency on the
# Ormolu autoformatter and skipping the test suite. Hopefully this
# is a good stop-gap until HLS builds with Nixpkgs again.

{ mkDerivation, lib, aeson, aeson-pretty, async, base, base16-bytestring
, binary, bytestring, containers, cryptohash-sha1, data-default, deepseq
, directory, extra, filepath, ghc, ghc-boot-th, ghc-paths, ghcide, gitrev
, hashable, hie-bios, hiedb, hls-brittany-plugin, hls-call-hierarchy-plugin
, hls-class-plugin, hls-eval-plugin, hls-explicit-imports-plugin
, hls-floskell-plugin, hls-fourmolu-plugin, hls-graph
, hls-haddock-comments-plugin, hls-hlint-plugin, hls-module-name-plugin
, hls-plugin-api, hls-pragmas-plugin, hls-refine-imports-plugin
, hls-retrie-plugin, hls-splice-plugin, hls-stylish-haskell-plugin
, hls-tactics-plugin, hls-test-utils, hslogger, hspec-expectations, lens
, lsp, lsp-test, lsp-types, mtl, optparse-applicative, optparse-simple
, process, regex-tdfa, safe-exceptions, sqlite-simple, temporary, text
, transformers, unordered-containers
}:

mkDerivation {
 pname = "haskell-language-server";
 version = "1.5.0.0";
 sha256 = "1jzak20xdbbq4pdiwx7w6znp6hc3j0sbcfv5h7x7l4rwzsckjhv7";
 isLibrary = true;
 isExecutable = true;
 libraryHaskellDepends = [
   aeson-pretty async base base16-bytestring bytestring containers
   cryptohash-sha1 data-default directory extra filepath ghc ghcide
   gitrev hie-bios hiedb hls-graph hls-plugin-api hslogger lsp
   optparse-applicative optparse-simple process safe-exceptions
   sqlite-simple text unordered-containers
 ];
 executableHaskellDepends = [
   aeson async base base16-bytestring binary bytestring containers
   cryptohash-sha1 data-default deepseq directory extra filepath ghc
   ghc-boot-th ghc-paths ghcide gitrev hashable hie-bios hiedb
   hls-brittany-plugin hls-call-hierarchy-plugin hls-class-plugin
   hls-eval-plugin hls-explicit-imports-plugin hls-floskell-plugin
   hls-fourmolu-plugin hls-graph hls-haddock-comments-plugin
   hls-hlint-plugin hls-module-name-plugin hls-plugin-api
   hls-pragmas-plugin hls-refine-imports-plugin hls-retrie-plugin
   hls-splice-plugin hls-stylish-haskell-plugin hls-tactics-plugin
   hslogger lens lsp mtl optparse-applicative optparse-simple
   process regex-tdfa safe-exceptions sqlite-simple temporary text
   transformers unordered-containers
 ];
 testHaskellDepends = [
   aeson base bytestring containers data-default directory extra
   filepath ghcide hls-plugin-api hls-test-utils hspec-expectations
   lens lsp-test lsp-types process text unordered-containers
 ];
 testToolDepends = [ ghcide ];
 description = "LSP server for GHC";
 configureFlags = [
  "-f-ormolu"
 ];
 license = lib.licenses.asl20;
 maintainers = with lib.maintainers; [ maralorn ];
 doCheck = false;
}
