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
(global-hl-line-mode 1)

;; enable undo-tree globally
(global-undo-tree-mode)

;; Colorize current changes
(use-package volatile-highlights
  :config
  (volatile-highlights-mode t))

(provide 'mymacs-ui)
