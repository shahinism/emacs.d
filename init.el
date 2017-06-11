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
(require 'mymacs-utils)
(require 'mymacs-evil)
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

;; custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-racer racer flycheck-rust rust-mode rainbow-delimiters evil-nerd-commenter zenburn-theme spaceline spaceline-config pyvenv pyenv-mode flycheck-pos-tip flycheck counsel-projectile projectile beacon smart-mode-line rainbow-mode haml-mode company-web web-mode exec-path-from-shell coffee-mode rjsx-mode rsjx-mode company-tern tern xref-js2 js2-mode pip-requirements gitconfig-mode gitignore-mode which-key volatile-highlights company-anaconda anaconda-mode smartparens-config all-the-icons neotree counsel ivy smartparens company evil-window ace-window avy evil-magit evil-leader magit use-package evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
