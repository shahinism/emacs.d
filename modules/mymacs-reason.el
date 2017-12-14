;; Arch linux installation:

;; # Official package's `opam init` failes, but opam-git from AUR works fine
;; pacaur -S ocaml opam-git
;; opam init
;; opam switch create 4.04.0
;; eval $(opam env)
;; opam install merlin
;; # Install `nvm` if you havent already: https://github.com/creationix/nvm#install-script
;; # Install latest version of node. There are installation problems witn node v8 and npm v4
;; # Install reason: https://reasonml.github.io/guide/editor-tools/global-installation
;; # Install bs-platform  (requires ocaml)
;; npm install -g bs-platform

(use-package reason-mode
  :quelpa (reason-mode :repo "reasonml-editor/reason-mode" :fetcher github :stable t)
  :config
  (defun shell-cmd (cmd))
  )

(provide 'mymacs-reason)
