;; default-keybindings
(defun kill-current-buffer ()
  "Kill current buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(evil-leader/set-key
  "fs" 'save-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wd" 'delete-window
  "bd" 'kill-current-buffer
  "ar" 'align-regexp)

(use-package which-key
  :config
  (which-key-mode +1))

(provide 'mymacs-keybindings)
