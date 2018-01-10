;; magit
; https://github.com/magit/magit/
(use-package magit
  :commands magit-get-top-dir)
; to make Magit and Evil play well together
; https://github.com/emacs-evil/evil-magit
(use-package evil-magit
  :after magit)

;; gitignore mode
(use-package gitignore-mode)
(use-package gitconfig-mode)

(provide 'mymacs-vc)
