;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(defvar mymacs-core-dir (expand-file-name "core" user-emacs-directory)
  "The core directory of mymacs tools")

(defvar mymacs-modules-dir (expand-file-name "modules" user-emacs-directory)
  "Mymacs's modules directory")

;; add mymacs to load path
(add-to-list 'load-path mymacs-core-dir)
(add-to-list 'load-path mymacs-modules-dir)

;; load mymacs
(require 'mymacs-packages)
(require 'mymacs-evil)
(require 'mymacs-ui)
(require 'mymacs-keybindings)
(require 'mymacs-completions)
(require 'mymacs-navigation)

;; load modules
(require 'mymacs-vc)
(require 'mymacs-python)

;; custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-anaconda anaconda-mode smartparens-config all-the-icons neotree counsel ivy smartparens company evil-window ace-window avy evil-magit evil-leader magit use-package evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
