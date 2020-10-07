{ stdenv }:

stdenv.mkDerivation rec {
  pname = "ash-emacs-source";
  version = "2020-10-07";

  src = ../config;

  installPhase = ''
    install -D init.el $out/init.el
    cp -r elisp/ $out/elisp
  '';
}
