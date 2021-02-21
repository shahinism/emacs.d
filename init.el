(defvar mymacs-core-dir (expand-file-name "core" user-emacs-directory))
(defvar mymacs-savefile-dir (expand-file-name "savefile" user-emacs-directory))

(unless (file-directory-p mymacs-savefile-dir)
  (make-directory mymacs-savefile-dir))

(add-to-list 'load-path mymacs-core-dir)

(require 'mymacs-packages)
(require 'mymacs-keys)
(require 'mymacs-editor)
(require 'mymacs-ui)
(require 'mymacs-utils)
(require 'mymacs-programming)
(require 'mymacs-org)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "ea5822c1b2fb8bb6194a7ee61af3fe2cc7e2c7bab272cbb498a0234984e1b2d9" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
