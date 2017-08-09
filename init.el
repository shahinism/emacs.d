;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(defvar mymacs-core-dir (expand-file-name "core" user-emacs-directory)
    "The core directory of mymacs tools")

(defvar mymacs-modules-dir (expand-file-name "modules" user-emacs-directory)
    "Mymacs's modules directory")

(defvar mymacs-frame-font (list "Hack-10" (list "tahoma" '(#x600 . #x6ff)))
    "Default font to be used on mymacs frame")

;; add mymacs to load path
(add-to-list 'load-path mymacs-core-dir)
(add-to-list 'load-path mymacs-modules-dir)

;; load mymacs
(require 'mymacs-packages)
(require 'mymacs-evil)
(require 'mymacs-utils)
(require 'mymacs-defaults)
(require 'mymacs-ui)
(require 'mymacs-keybindings)
(require 'mymacs-completions)
(require 'mymacs-navigation)

;; load modules
(require 'mymacs-vc)
(require 'mymacs-programming)
(require 'mymacs-python)
(require 'mymacs-javascript)
(require 'mymacs-web)
(require 'mymacs-rust)
(require 'mymacs-c)
(require 'mymacs-docker)
(require 'mymacs-templates)
(require 'mymacs-latex)
(require 'mymacs-org)
(require 'mymacs-pdf)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-iedit-state zenburn-theme spaceline yapfify yaml-mode xref-js2 which-key web-mode web-beautify volatile-highlights use-package toml-mode telephone-line smartparens rjsx-mode rainbow-mode rainbow-delimiters racer pyvenv pyenv-mode py-isort pip-requirements pig-mode pdf-tools ox-twbs org-bullets nginx-mode neotree moe-theme mode-icons markdown-mode json-mode js2-refactor indium iedit htmlize helm-projectile helm-dash helm-c-yasnippet haml-mode graphviz-dot-mode gitignore-mode gitconfig-mode fringe-helper flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-irony exec-path-from-shell evil-org evil-nerd-commenter evil-matchit evil-magit evil-leader esup ereader emojify doom-themes dockerfile-mode disaster csv-mode company-web company-tern company-quickhelp company-irony company-auctex company-anaconda coffee-mode clojure-mode clang-format cargo beacon avy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
