(use-package iedit
  :straight t
  :ryo
  ("SPC r" (("o" iedit-mode                :name "Edit Occurrences")))
  :config
  (unbind-key (kbd "C-;")))

(use-package counsel
  :straight t
  :ryo
  ("/" (("b" swiper-isearch :name "Search Buffer")
        ("d" counsel-ag     :name "Search Directory")))
  :config
  (ivy-mode 1)
  (counsel-mode 1))

(use-package ivy-rich
  :straight t
  :config
  (ivy-rich-mode 1))

;; better sorting
(use-package ivy-prescient
  :straight t
  :config
  (ivy-prescient-mode))

(use-package exec-path-from-shell
  :straight t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package direnv
  :straight t
  :config
  (direnv-mode))

(use-package rainbow-delimiters
  :straight t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package which-key
  :straight t
  :config
  (push '((nil . "ryo:.*:") . (nil . "")) which-key-replacement-alist)
  (which-key-mode))

(use-package anzu
  :straight t
  :ryo
  ("SPC r" (("r" anzu-query-replace-regexp :name "Replace Regexp")
            ("s" anzu-query-replace        :name "Replace Text"))))

(provide 'mymacs-utils)
