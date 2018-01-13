;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(defvar mymacs-secrets-dir (expand-file-name "secret" user-emacs-directory)
    "The secret directory of mymacs (not available on git).")

(defvar mymacs-core-dir (expand-file-name "core" user-emacs-directory)
    "The core directory of mymacs tools.")

(defvar mymacs-modules-dir (expand-file-name "modules" user-emacs-directory)
    "Mymacs's modules directory.")

(defvar mymacs-frame-font (list "Hack-10" (list "tahoma" '(#x600 . #x6ff)))
    "Default font to be used on mymacs frame.")

(defvar mymacs-default-browser "/usr/bin/firefox-developer"
  "Default browser to be used when opening web pages.")

;; add mymacs to load path
(add-to-list 'load-path mymacs-secrets-dir)
(add-to-list 'load-path mymacs-core-dir)
(add-to-list 'load-path mymacs-modules-dir)

;; Secret variables
(require 'secret-variables)

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
