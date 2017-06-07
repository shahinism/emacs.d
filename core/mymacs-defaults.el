;; store backups and autosaves into /tmp/ directory
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

;; save place
(save-place-mode 1)

(provide 'mymacs-defaults)
