(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; use-package
; https://github.com/jwiegley/use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; evil-leader
; https://github.com/cofi/evil-leader
(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

;; default-keybindings
(evil-leader/set-key
  ;;"ff" 'find-file
  "fs" 'save-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wd" 'delete-window)

;; default variables
(setq-default
 fill-column 80
 visible-bell t
 initial-scratch-message ""
 inhibit-startup-message t
 ; http://ergoemacs.org/emacs/emacs_tabs_space_indentation_setup.html
 indent-tabs-mode nil
 tab-width 4)

; https://emacs-doctor.com/emacs-strip-tease.html
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

;; avy
; http://emacsredux.com/blog/2015/07/19/ace-jump-mode-is-dead-long-live-avy/
(use-package avy
  :config
  (evil-leader/set-key
    "<SPC>" 'avy-goto-word-or-subword-1))

;; evil
; https://github.com/emacs-evil/evil
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
; https://github.com/magit/magit/
(use-package magit)
; to make Magit and Evil play well together
; https://github.com/emacs-evil/evil-magit
(use-package evil-magit)

;; company
; http://company-mode.github.io/
(use-package company
  :config
  (setq
   company-minimum-prefix-length 0
   company-idle-delay 0)
  (global-company-mode +1))

;; smart-parens
; https://github.com/Fuco1/smartparens
(use-package smartparens
  :config
  (smartparens-global-mode 1))

;; ivy completion
(use-package ivy
  :config
  (setq ;; https://github.com/abo-abo/swiper
        ivy-use-virtual-buffers t
	enable-recursive-minibuffers t
	;; https://github.com/hlissner/.emacs.d/blob/master/modules/completion/ivy/config.el
        ivy-height 12
	ivy-do-completion-in-region nil
	ivy-wrap t
	ivy-fixed-height-minibuffer t
	;; Don't use ^ as initial input
        ivy-initial-inputs-alist nil
        ;; highlight til EOL
        ivy-format-function #'ivy-format-function-line
        ;; disable magic slash on non-match
        ivy-magic-slash-non-match-action nil)
  (ivy-mode +1))

(use-package counsel
  :after ivy
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (evil-leader/set-key
   "ff" 'counsel-find-file))

;; custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (counsel ivy smartparens company evil-window ace-window avy evil-magit evil-leader magit use-package evil ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
