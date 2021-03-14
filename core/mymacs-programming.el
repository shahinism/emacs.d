(use-package which-func
  :config
  ;; show the name of the current function
  (which-function-mode 1))

(use-package hl-todo
  :straight t
  :config
  ;; font-lock TODO annotations
  (global-hl-todo-mode 1))

(use-package flycheck
  :straight t
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode))

(use-package flycheck-pos-tip
  :after flycheck
  :straight t
  :config
  (setq flycheck-pos-tip-timeout 10
        flycheck-display-errors-delay 0.5)
  (flycheck-pos-tip-mode +1))

(use-package dumb-jump
  :straight t
  :after counsel
  ;; :ryo
  ;; ("SPC j" (("j" dumb-jump-go         :name "Go to Definition")
  ;;           ("l" dumb-jump-quick-look :name "Lookup Definitions")
  ;;           ("b" dumb-jump-back       :name "Go Back")))
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
  ;; https://emacs-lsp.github.io/lsp-mode/page/performance/
  (setq gc-cons-threshold 100000000) ;; 100mb
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 0.500)
  (setq lsp-log-io nil)
  (setq lsp-completion-provider :capf)  
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

(use-package markdown-toc
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

;; SQL
(use-package sqlformat
  :straight t
  :config
  (setq sqlformat-command 'pgformatter)
  (setq sqlformat-args '("-s2" "-g")))

(use-package python-black
  :demand t
  :straight t
  :after python)

(use-package yaml-mode
  :straight t)

(use-package json-mode
  :straight t)

(use-package web-beautify
  :straight t)

(provide 'mymacs-programming)
