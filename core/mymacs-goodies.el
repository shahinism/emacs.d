(use-package fringe-helper)

;; This function will byte-compile all the packages developed for configuration.
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

;; https://github.com/mrkkrp/fix-word
(use-package fix-word
  :config
  (global-set-key (kbd "M-u") #'fix-word-upcase)
  (global-set-key (kbd "M-l") #'fix-word-downcase)
  (global-set-key (kbd "M-c") #'fix-word-capitalize))

;; https://github.com/cofi/evil-numbers
(use-package evil-numbers
  :config
  (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "<kp-add>") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "<kp-subtract>") 'evil-numbers/dec-at-pt))

(provide 'mymacs-goodies)
