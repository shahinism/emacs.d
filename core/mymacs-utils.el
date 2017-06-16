;; fringe-helper
(use-package fringe-helper)

;; compiler
(defun mymacs-compile ()
  (interactive)
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


;; open-with
; http://emacsredux.com/blog/2013/03/27/open-file-in-external-program/
(defun mymacs-open-with (arg)
  (interactive "P")
  (when buffer-file-name
    (shell-command (concat
                    (cond
                     ((and (not arg) (eq system-type 'darwin)) "open")
                     ((and (not arg) (member system-type '(gnu gnu/linux gnu/kfreebsd))) "xdg-open")
                     (t (read-shell-command "Open current file with: ")))
                    " "
                    (shell-quote-argument buffer-file-name)))))

(evil-leader/set-key "xo" 'mymacs-open-with)

(provide 'mymacs-utils)
