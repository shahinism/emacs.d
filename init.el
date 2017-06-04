(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("gnu" . "http://elpa.gnu.org/packages"))
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

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

;; default-keybindings
(defun kill-current-buffer ()
  "Kill current buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(evil-leader/set-key
  ;;"ff" 'find-file
  "fs" 'save-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wd" 'delete-window
  "bd" 'kill-current-buffer)

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
(global-linum-mode 1)

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
  (smartparens-global-mode 1)
  (require 'smartparens-config))

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
    "ff" 'counsel-find-file
    "fr" 'counsel-recentf))

;; neotree
(use-package all-the-icons)
(use-package neotree
  :after all-the-icons
  :config
  (setq
   neo-theme (if (display-graphic-p) 'icons 'arrow)
   neo-autorefresh nil
   neo-mode-line-type 'none
   neo-window-width 25
   neo-banner-message nil
   neo-show-hidden-files nil
   neo-keymap-style 'concise
   neo-hidden-regexp-list
        '(;; vcs folders
          "^\\.\\(git\\|hg\\|svn\\)$"
          ;; compiled files
          "\\.\\(pyc\\|o\\|elc\\|lock\\|css.map\\)$"
          ;; generated files, caches or local pkgs
          "^\\(node_modules\\|vendor\\|.\\(project\\|cask\\|yardoc\\|sass-cache\\)\\)$"
          ;; org-mode folders
          "^\\.\\(sync\\|export\\|attach\\)$"
          "~$"
          "^#.*#$"))
  (evil-leader/set-key
    "pt" 'neotree-toggle))

;; python
(defun python-mode-defaults ()
  "Default configuration for python mode"
  (subword-mode +1)
  (anaconda-mode 1)
  (eldoc-mode 1)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'python-mode-defaults))

(use-package company-anaconda
  :after anaconda-mode)

;; custom-set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-anaconda anaconda-mode smartparens-config all-the-icons neotree counsel ivy smartparens company evil-window ace-window avy evil-magit evil-leader magit use-package evil ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
