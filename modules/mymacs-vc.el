;; magit
; https://github.com/magit/magit/
(use-package magit)
; to make Magit and Evil play well together
; https://github.com/emacs-evil/evil-magit
(use-package evil-magit)

(provide 'mymacs-vc)

;; gitignore mode
(use-package gitignore-mode)
(use-package gitconfig-mode)

;; git-gutter
(use-package git-gutter
  :config
  (add-hook 'prog-mode-hook 'git-gutter-mode))
