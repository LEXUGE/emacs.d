{
  description = "Harry Ying's emacs.d configuration";

  inputs = {
    nixos.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = { self, nixos, emacs-overlay, flake-utils }@inputs:
    let
      importer = overlays: system:
        (import nixos {
          system = system;
          overlays = overlays;
        });
    in ({
      overlay = with nixos.lib;
        let
          concatEmacsConfig = dir:
            foldl (a: b: a + b) "" (attrsets.mapAttrsToList
              (n: v: "${builtins.readFile (dir + "/${n}")}")
              (builtins.readDir dir));
        in (final: prev:
          (recursiveUpdate (builtins.listToAttrs (map (system:
            attrsets.nameValuePair ("ash-emacs-${system}")
            ((importer [ emacs-overlay.overlay ]
              system).emacsWithPackagesFromUsePackage {
                config = concatEmacsConfig ./config/elisp;
                # package = (importer [ emacs-overlay.overlay ] system).pkgs.emacsGcc;
                alwaysEnsure = true;
              })) flake-utils.lib.defaultSystems)) {
                ash-emacs-source =
                  (prev.callPackage ./pkgs/ash-emacs-source.nix { });
              }));
    } // (flake-utils.lib.eachDefaultSystem (system: rec {
      packages = {
        ash-emacs-source = (importer [ self.overlay ] system).ash-emacs-source;
        "ash-emacs" = (importer [ self.overlay ] system)."ash-emacs-${system}";
      };

      checks = packages;
    })));
}
