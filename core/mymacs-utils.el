(defun mymacs-compile ()
  (let ((targets (append (list (expand-file-name "init.el" user-emacs-directory))
                         (directory-files mymacs-core-dir t "^[^\.].+\.el$")
                         (directory-files mymacs-modules-dir t "^[^\.].+\.el$"))))
    (mapc (lambda (file)
            (let ((result (byte-compile-file file))
                  (short-name (file-relative-name file user-emacs-directory)))
              (cond ((eq result 'no-byte-compile)
                     (message "Ignored %s" short-name))
                    ((null result)
                     (message "Failed to compile %s" short-name))
                    (t
                     (message "Compiled %s" short-name))))) targets)))

(mymacs-compile)

(provide 'mymacs-utils)
