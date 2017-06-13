(defun rust-doc ()
    "Dfine Rust docs for helm-dash."
  (interactive)
  (setq-local helm-dash-docsets '("Rust")))

;; rust-mode
(use-package rust-mode
  :mode "\\.rs$"
  :init
  (add-hook 'rust-mode-hook #'flycheck-mode)
  (evil-leader/set-key-for-mode 'rust-mode
    "=" 'rust-format-buffer))

;; flycheck-rust
(use-package flycheck-rust
  :after rust-mode
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; toml-mode
(use-package toml-mode
  :mode "/\\(Cargo.lock\\|\\.cargo/config\\)\\'")

;; cargo
(use-package cargo
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (evil-leader/set-key-for-mode 'rust-mode
        "c." 'cargo-process-repeat
        "cC" 'cargo-process-clean
        "cX" 'cargo-process-run-example
        "cc" 'cargo-process-build
        "cd" 'cargo-process-doc
        "ce" 'cargo-process-bench
        "cf" 'cargo-process-current-test
        "cf" 'cargo-process-fmt
        "ci" 'cargo-process-init
        "cn" 'cargo-process-new
        "co" 'cargo-process-current-file-tests
        "cs" 'cargo-process-search
        "cu" 'cargo-process-update
        "cx" 'cargo-process-run
        "t" 'cargo-process-test))

;; racer
(use-package racer
  :after rust-mode
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(provide 'mymacs-rust)
