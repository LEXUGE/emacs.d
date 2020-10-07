# emacs.d
My personal emacs config with nix flake support.
```
├───overlay: Nixpkgs overlay
└───packages
    ├───aarch64-linux
    │   ├───ash-emacs-aarch64-linux: package 'emacs-with-packages-27.1'
    │   └───ash-emacs-source: package 'ash-emacs-source-2020-10-07'
    ├───i686-linux
    │   ├───ash-emacs-i686-linux: package 'emacs-with-packages-27.1'
    │   └───ash-emacs-source: package 'ash-emacs-source-2020-10-07'
    ├───x86_64-darwin
    │   ├───ash-emacs-source: package 'ash-emacs-source-2020-10-07'
    │   └───ash-emacs-x86_64-darwin: package 'emacs-with-packages-27.1'
    └───x86_64-linux
        ├───ash-emacs-source: package 'ash-emacs-source-2020-10-07'
        └───ash-emacs-x86_64-linux: package 'emacs-with-packages-27.1'
```
The flake includes `ash-emacs` and `ash-emacs-source` packages. The first one is `emacs` package with all the dependencies pre-compiled. The second one is the source file for `~/.emacs.d`.
