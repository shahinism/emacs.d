(setq-default indent-tabs-mode nil ;; don't use tabs
              tab-width 8          ;; maintain correct appearance
              visible-bell t       ;; enable to save ears
              initial-scratch-message ""
              inhibit-startup-message t
              )

(setq require-final-new-line t                                             ;; ensure a new line exists at the end of the file
      backup-directory-alist  `((".*" . ,temporary-file-directory))        ;; store backups in temp directory
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)) ;; do the same with autosaves
      tab-always-indent 'complete                                          ;; smart tab behavior
      whitespace-style '(tab-mark)                                         ;; show tabs
      )

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; Enable show paren mode and set it to show matching parens immediately
(show-paren-mode)
(setq show-paren-delay 0
      show-paren-style 'expression)

;; Enable ~y-or-no-p~
(fset 'yes-or-no-p 'y-or-n-p)

;; Strip UI
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; Show line number in the mode-line:
(line-number-mode t)

;; Show column number in the mode-line:
(column-number-mode t)

;; Show file size in the mode-line:
(size-indication-mode t)

;; Enable global font lock
(global-font-lock-mode)

;; Remeber where you left off
(setq save-place-file (expand-file-name "saveplace" mymacs-savefile-dir))
(save-place-mode 1)

;; Remeber minibuffer history
(use-package savehist
  :config
  (setq savehist-additional-variables
        ;; search entries
        '(search-ring regexp-search-ring)
        ;; save every minute
        savehist-autosave-interval 60
        ;; keep the home clean
        savehist-file (expand-file-name "savehist" mymacs-savefile-dir))
  (savehist-mode +1))

;; Remeber recent files
(use-package recentf
  :config
  (setq recentf-save-file (expand-file-name "recentf" mymacs-savefile-dir)
        recentf-max-saved-items 500
        recentf-max-menu-items 15
        ;; disable recentf-cleanup on Emacs start, because it can cause
        ;; problems with remote files
        recentf-auto-cleanup 'never)
  (recentf-mode +1))

;; Automatically save when the buffer loses focus
(use-package super-save
  :straight t
  :config
  (super-save-mode t))

(use-package flyspell
  :config
  (setq ispell-program-name "aspell" ; use aspell instead of ispell
        ispell-extra-args '("--sug-mode=ultra"))

  (when (executable-find ispell-program-name)
    (flyspell-mode +1)
    (message "aspell not found, disabling flyspell mode"))
  )

(provide 'mymacs-editor)
