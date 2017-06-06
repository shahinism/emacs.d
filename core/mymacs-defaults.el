;; store backups and autosaves into /tmp/ directory
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

;; smooth scrolling
; scroll one line at a time (less "jumpy" than defaults)
; https://www.emacswiki.org/emacs/SmoothScrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)) ;; one line at a time
      mouse-wheel-progressive-speed nil            ;; don't accelerate scrolling
      mouse-wheel-follow-mouse 't                  ;; scroll window under mouse
      scroll-step 1)                               ;; keyboard scroll one line at a time

;; save place
(save-place-local-mode 1)

(provide 'mymacs-defaults)
