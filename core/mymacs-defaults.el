;; store backups and autosaves into /tmp/ directory
(setq backup-directory-alist
    `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
    `((".*" ,temporary-file-directory t)))

(provide 'mymacs-defaults)
