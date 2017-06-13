;; magit
; https://github.com/magit/magit/
(use-package magit)
; to make Magit and Evil play well together
; https://github.com/emacs-evil/evil-magit
(use-package evil-magit)

;; gitignore mode
(use-package gitignore-mode)
(use-package gitconfig-mode)

;; It slows down the navigation
;; git-gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode t)
  (git-gutter:linum-setup))

(provide 'mymacs-vc)
