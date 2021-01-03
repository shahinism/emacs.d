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

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " " (:eval (if (buffer-file-name)
                                          (abbreviate-file-name (buffer-file-name))
                                        "%b"))))

(set-frame-font (font-spec :family "Fira Code" :size 13) nil t)

(use-package modus-themes
  :straight t
  :bind
  (([f5] . modus-themes-toggle))
  :config
  (require 'modus-themes)
  (load-theme 'modus-operandi t))

(use-package doom-modeline
  :straight t
  :init
  (doom-modeline-mode 1))

(provide 'mymacs-ui)
