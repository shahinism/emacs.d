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

(provide 'mymacs-ui)
