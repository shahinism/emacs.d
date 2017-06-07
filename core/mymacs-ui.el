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
(global-linum-mode 1)
(global-hl-line-mode 1)

;; mode line
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; enable undo-tree globally
(global-undo-tree-mode)

;; Colorize current changes
(use-package volatile-highlights
  :config
  (volatile-highlights-mode t))

;; spaceline
(use-package spaceline
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme))

(provide 'mymacs-ui)
