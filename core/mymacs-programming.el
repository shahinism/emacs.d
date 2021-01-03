(use-package dumb-jump
  :straight t
  :after counsel
  :ryo
  ("SPC j" (("j" dumb-jump-go         :name "Go to Definition")
            ("l" dumb-jump-quick-look :name "Lookup Definitions")
            ("b" dumb-jump-back       :name "Go Back")))
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
  ("SPC g" (("g" magit-status :name "Git Status")) :name "Git"))

;; LSP
;; TODO use ryo for key maps
(setq lsp-keymap-prefix "C-l")
(use-package lsp-mode
  :straight t
  :hook
  (scala-mode . lsp)
  (elixir-mode . lsp)
  (python-mode . lsp)
  (typescript-mode . lsp)
  (lsp-mode . lsp-lens-mode)
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :straight t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :straight t
  :commands lsp-ivy-workspace-symbol)

(use-package company-lsp
  :straight t)

(use-package posframe
  :straight t)

(use-package dap-mode
  :straight t
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode))

;; lsp-scala
(use-package lsp-metals
  :straight t
  :config
  (setq lsp-metals-treeview-show-when-views-received nil))

(use-package scala-mode
  :straight t
  :mode "^\w+\\.s\\(cala\\|bt\\)$"
  :interpreter
    ("scala" . scala-mode))

;; Enable sbt mode for executing sbt commands
(use-package sbt-mode
  :straight t
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
   ;; sbt-supershell kills sbt-mode:  https://github.com/hvesalai/emacs-sbt-mode/issues/152
   (setq sbt:program-options '("-Dsbt.supershell=false"))
)

;; TODO split
(use-package markdown-mode
  :straight t)

(use-package pip-requirements
  :straight t
  :mode ("/requirements.txt$" . pip-requirements-mode))

(use-package terraform-mode
  :straight t)

(use-package company-terraform
  :after company
  :straight t
  :config
  (require 'company-terraform)
  (company-terraform-init))

(provide 'mymacs-programming)
