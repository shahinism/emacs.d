;; default-keybindings
(defun kill-current-buffer ()
  "Kill current buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(which-key-declare-prefixes "SPC w" "Windows")
(which-key-declare-prefixes "SPC b" "Buffers")
(which-key-declare-prefixes "SPC t" "Text")
(which-key-declare-prefixes "SPC f" "Files")
(evil-leader/set-key
  "fs" 'save-buffer
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wd" 'delete-window
  "bd" 'kill-current-buffer
  "tr" 'align-regexp)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

(use-package which-key
  :config
  (which-key-mode +1))

(provide 'mymacs-keybindings)
