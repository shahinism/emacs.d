;; cc-mode
(use-package cc-mode
  :commands (c-mode c++-mode objc-mode java-mode)
  :mode ("\\.mm" . objc-mode))

;; irony
(use-package irony
  :after cc-mode
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony
  :after irony
  :after company
  :config
  (add-to-list 'company-backends 'company-irony))

;; flycheck-irony
(use-package flycheck-irony
  :after irony
  :after flycheck
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; disaster
(use-package disaster
  :config
  (evil-leader/set-key-for-mode 'c-mode
    "cd" 'disaster))

;; clang-format
(use-package clang-format
  :config
  (evil-leader/set-key-for-mode 'c-mode
    "=" 'clang-format-buffer))

(provide 'mymacs-c)