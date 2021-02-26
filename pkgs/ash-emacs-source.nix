{ stdenv }:

stdenv.mkDerivation rec {
  pname = "ash-emacs-source";
  version = "git";

  src = ../config;

  installPhase = ''
    install -D init.el $out/init.el
    cp -r elisp/ $out/elisp
  '';
}
