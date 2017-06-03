(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; evil-leader
(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

;; default-keybindings
(evil-leader/set-key
  "ff" 'find-file
  "fs" 'save-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wd" 'delete-window)

;; avy
; http://emacsredux.com/blog/2015/07/19/ace-jump-mode-is-dead-long-live-avy/
(use-package avy
  :config
  (evil-leader/set-key
    "<SPC>" 'avy-goto-word-or-subword-1))

;; evil
(use-package evil
  :config
  (evil-mode +1)
  (evil-leader/set-key
    "gs" 'magit-status
    "wh" 'evil-window-left
    "wj" 'evil-window-down
    "wl" 'evil-window-right
    "wk" 'evil-window-up))

;; magit
(use-package magit)
; to make Magit and Evil play well together
(use-package evil-magit)

;; custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-window ace-window avy evil-magit evil-leader magit use-package evil ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
