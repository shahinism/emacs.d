(use-package dumb-jump
  :straight t
  :after counsel
  :ryo
  ("SPC j" (("j" dumb-jump-go)
            ("l" dumb-jump-quick-look)
            ("b" dumb-jump-back)))
  :config
  (setq dumb-jump-selector 'ivy))

(use-package company
  :straight t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0
        company-minimum-prefix-length 2))

(use-package smartparens
  :straight t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))

(use-package projectile
  :straight t
  :config
  (projectile-mode +1)
  (setq projectile-enable-caching t))

(use-package counsel-projectile
  :after projectile
  :straight t
  :ryo
  ("SPC p" (("a" counsel-projectile-ag)
            ("b" counsel-projectile-switch-to-buffer)
            ("c" projectile-invalidate-cache)
            ("d" counsel-projectile-find-dir)
            ("f" counsel-projectile-find-file)
            ("K" projectile-kill-buffers)
            ("p" projectile-switch-project)
            ("r" projectile-recentf)
            ("s" projectile-save-project-buffers)))
  :config
  (setq projectile-completion-system 'ivy))

(use-package magit
  :straight t
  :ryo
  ("SPC g" (("g" magit-status))))

(provide 'mymacs-programming)
