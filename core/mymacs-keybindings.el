;; default-keybindings
(defun kill-current-buffer ()
  "Kill current buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(evil-leader/set-key
  ;;"ff" 'find-file
  "fs" 'save-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wd" 'delete-window
  "bd" 'kill-current-buffer)

(provide 'mymacs-keybindings)
