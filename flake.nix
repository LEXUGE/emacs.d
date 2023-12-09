{
  description = "Harry Ying's emacs.d configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    typst2nix = {
      url = "github:LEXUGE/typst2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, emacs-overlay, utils, pre-commit-hooks, typst2nix }:
    with nixpkgs.lib;
    with builtins;
    with utils.lib;
    {
      overlays = {
        default =
          let
            concatEmacsConfig = dir:
              foldl (a: b: a + b) "" (map (p: readFile p) (filesystem.listFilesRecursive dir));

          in
          (final: prev: {
            ash-emacs = prev.emacsWithPackagesFromUsePackage {
              config = concatEmacsConfig ./config;
              package = prev.emacs-pgtk;
              alwaysEnsure = true;
              extraEmacsPackages = epkgs: with epkgs; [
                treesit-grammars.with-all-grammars
                # We have to supply our own packages as I dont know how to overrideScope the epkgs here
                # thus this error is normal:
                # trace: Emacs package typst-ts-mode, declared wanted with use-package, not found.
                (epkgs.overrideScope typst2nix.overlays.emacsTooling).typst-ts-mode
              ];
            };
            ash-emacs-source = (prev.callPackage ./pkgs/ash-emacs-source.nix { });
          });

        emacs-overlay = emacs-overlay.overlays.default;
      };
    } // (eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ emacs-overlay.overlays.default self.overlays.default ];
        };
      in
      rec {
        packages = {
          inherit (pkgs) ash-emacs ash-emacs-source;
        };

        # nix develop
        devShells.default = pkgs.mkShell {
          inherit (self.checks.${system}.pre-commit-check) shellHook;
        };

        checks = {
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixpkgs-fmt.enable = true;

              shellcheck.enable = true;
              shfmt.enable = true;
            };
          };
        } // packages;
      }));
}
