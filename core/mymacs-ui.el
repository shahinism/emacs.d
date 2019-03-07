;; default variables
(setq-default fill-column 80
              visible-bell t
              initial-scratch-message ""
              inhibit-startup-message t
              ; http://ergoemacs.org/emacs/emacs_tabs_space_indentation_setup.html
              indent-tabs-mode nil
              tab-width 4)

;; smooth scrolling
; scroll one line at a time (less "jumpy" than defaults)
; https://www.emacswiki.org/emacs/SmoothScrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
      mouse-wheel-progressive-speed nil            ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't                  ;; scroll window under mouse
      scroll-step 1                                ;; keyboard scroll one line at a time
      ;; nice scrolling
      scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; strip emacs
; https://emacs-doctor.com/emacs-strip-tease.html
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-hl-line-mode 1)

;;; Editing
(setq show-paren-delay 0)
(show-paren-mode 1)

;; y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; enable undo-tree globally
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t))) 

(global-undo-tree-mode)
(global-subword-mode 1)

;; mode-line
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; Theme
;; (use-package zenburn-theme
;;   :config
;;   (load-theme 'zenburn t))

;; (use-package moe-theme
;;   :config
;;   (moe-dark))

(use-package darktooth-theme)

;; set font
(defun mymacs/check-font-exists (font)
  "Check if FONT is installed on the system."
  (if (find-font (font-spec :name font))
      t
    nil))

(defun mymacs/set-font (font &optional range)
  "Set FONT if it is installed or message otherwise."
  (when window-system
    (if (mymacs/check-font-exists font)
        (if range
            (set-fontset-font "fontset-default" range font)
          (set-frame-font font)) 
      (message "Font %s doesn't exists" font))))

(defun mymacs-set-user-fonts ()
  "Set user defined fonts from mymacs-frame-font."
  (interactive)

  (dolist (font mymacs-frame-font)
    (if (stringp font)
        (mymacs/set-font font))
    (if (listp font)
        (mymacs/set-font (nth 0 font) (nth 1 font)))))

(mymacs-set-user-fonts)

;; emojis
(use-package emojify
  :config
  (add-hook 'after-init-hook #'global-emojify-mode))

;; nlinum
;; (use-package nlinum
;;   :config
;;   (global-nlinum-mode -1))

;; show indent
;; https://github.com/DarthFennec/highlight-indent-guides
(use-package highlight-indent-guides
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character))

;; https://github.com/syl20bnr/vi-tilde-fringe
(use-package vi-tilde-fringe
  :config
  (add-hook 'prog-mode-hook 'vi-tilde-fringe-mode))

;; https://github.com/TheBB/spaceline
(use-package spaceline
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(provide 'mymacs-ui)
