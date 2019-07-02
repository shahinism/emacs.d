;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(defvar mymacs-core-dir (expand-file-name "core" user-emacs-directory)
    "The core directory of mymacs tools.")

(defvar mymacs-modules-dir (expand-file-name "modules" user-emacs-directory)
    "Mymacs's modules directory.")

(defvar mymacs-frame-font (list "Hack-12" (list "tahoma" '(#x600 . #x6ff)))
    "Default font to be used on mymacs frame.")

(defvar mymacs-default-browser "/usr/bin/firefox-developer"
  "Default browser to be used when opening web pages.")

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
(require 'mymacs-goodies)
(require 'mymacs-org)

;; load modules
(require 'mymacs-lsp)
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
(require 'mymacs-dot)
(require 'mymacs-markups)
(require 'mymacs-pig)
(require 'mymacs-common-lisp)
(require 'mymacs-java)
(require 'mymacs-guix)
 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (lsp-mode yasnippet-snippets guix guix-emacs yapfify yaml-mode xref-js2 which-key web-mode web-beautify vi-tilde-fringe use-package toml-mode strace-mode spaceline smartparens slime-company rjsx-mode rainbow-mode rainbow-delimiters racer pyvenv python-pytest py-isort pip-requirements pig-mode ox-twbs org-bullets org-attach-screenshot neotree magit-todos json-mode js2-refactor imenu-list htmlize highlight-indent-guides helm-projectile helm-gtags helm-dash helm-c-yasnippet haml-mode graphviz-dot-mode gitignore-mode gitconfig-mode ggtags function-args fringe-helper flycheck-rust flycheck-pos-tip flycheck-irony fix-word exec-path-from-shell evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-leader evil-iedit-state evil-collection evil-anzu ereader emojify el-get dockerfile-mode disaster darktooth-theme csv-mode counsel company-web company-tern company-quickhelp company-irony company-emacs-eclim company-auctex company-anaconda coffee-mode clang-format cargo avy all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
