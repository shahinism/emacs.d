(defun mm/insert-mode ()
  "Enable the insert mode."
  (interactive)
  (ryo-modal-mode 0))

(defun mm/normal-mode ()
  "Enable the normal mode."
  (interactive)
  (ryo-modal-mode))

(defun mm/kill-point-or-region (count)
  "Kill char at point or region."
  (interactive "p")
  (dotimes (_ count)
    (if mark-active
        (kill-region (region-beginning) (region-end))
      (kill-region (point) (+ (point) 1)))))

(defun mm/replace-char-at-point (replacement)
  "Replace the char at point by REPLACEMENT character"
  (interactive "cReplace with char: ")
  (delete-char 1)
  (insert replacement)
  (backward-char))

(defun mm/noop ()
  "Do nothing funciton."
  (interactive))

(defun mm/mark-line ()
  "Mark current line."
  (interactive)
  (end-of-line)
  (set-mark (line-beginning-position)))

(defun mm/kill-line-forward ()
  "Kill current line and the one after it."
  (interactive)
  (crux-kill-whole-line 2))

(defun mm/kill-line-backward ()
  "Kill current line and the one before it."
  (interactive)
  (previous-line 1)
  (crux-kill-whole-line 2))

(defun mm/split-vertically ()
  "Split frame vertically."
  (interactive)
  (split-window-right)
  (windmove-right))

(defun mm/split-horizontally ()
  "Split frame horizontally."
  (interactive)
  (split-window-below)
  (windmove-down))

(use-package guru-mode
  :straight t
  :config
  ;; Guide me to use more efficient keybindings
  (setq guru-warn-only nil)
  (guru-mode +1))

(use-package expand-region
  :straight t)

(use-package crux
  :straight t)

(use-package avy
  :straight t)

(use-package ryo-modal
  :straight t
  :after expand-region crux avy
  :commands ryo-modal-mode
  :bind (("<escape>" . mm/normal-mode))
  :config
  (ryo-modal-keys
   ("M-;" comment-line)
   ("RET" mm/noop)
   ("DEL" mm/noop)
   ("!" mm/noop)
   ("@" mm/noop)
   ("#" mm/noop)
   ("%" mm/noop)
   ("^" mm/noop)
   ("&" mm/noop)
   ("(" mm/noop)
   (")" mm/noop)
   ("-" mm/noop)
   ("+" mm/noop)
   ("\\" mm/noop)
   ("|" mm/noop)
   ("[" mm/noop)
   ("]" mm/noop)
   ("{" mm/noop)
   ("'" mm/noop)
   (";" mm/noop)
   (":" mm/noop)
   ;; ("/" mm/noop)
   ("." mm/noop)
   ("," mm/noop)
   (">" end-of-buffer)
   ("<" beginning-of-buffer)
   ("`" mm/noop)
   ("~" mm/noop)
   ("0" beginning-of-line)
   ("*" mm/noop)
   ("=" indent-region)
   ("$" end-of-line)
   ("A" move-end-of-line :exit t)
   ("B" mm/noop)
   ("C" mm/noop)
   ("D" mm/noop)
   ("E" mm/noop)
   ("F" mm/noop)
   ("G" mm/noop)
   ("H" mm/noop)
   ("I" mm/noop)
   ("J" mm/noop)
   ("K" mm/noop)
   ("L" mm/noop)
   ("M" mm/noop)
   ("N" mm/noop)
   ("O" crux-smart-open-line-above :exit t)
   ("P" mm/noop)
   ("Q" mm/noop)
   ("R" mm/noop)
   ("S" mm/noop)
   ("T" mm/noop)
   ("U" mm/noop)
   ("V" mm/noop)
   ("W" mm/noop)
   ("Y" mm/noop)
   ("Z" mm/noop)
   ("X" mm/noop)
   ("^" back-to-indentation)
   ("a" forward-char :exit t)    ;; TODO forward-char except end of line
   ("b" backward-word)
   ("c" mm/noop)
   ("d" (("d" crux-kill-whole-line)
         ("w" kill-word)
         ("$" kill-line)
         ("j" mm/kill-line-forward)
         ("k" mm/kill-line-backward)))
   ("e" mm/noop)
   ("f" (("c" avy-goto-char)
         ("f" avy-goto-char-in-line)
         ("s" avy-goto-char-timer)
         ("l" avy-goto-line)
         ("w" avy-goto-word-1)))
   ("g" mm/noop)
   ("h" backward-char)
   ("i" mm/insert-mode)
   ("j" next-line)
   ("k" previous-line)
   ("l" forward-char)
   ("m" mm/noop)
   ("n" mm/noop)
   ("o" crux-smart-open-line :exit t)
   ("p" yank)
   ("q" mm/noop)
   ("r" mm/replace-char-at-point)
   ("s" mm/noop)
   ("t" mm/noop)
   ("u" undo)
   ("v" mm/noop)
   ("w" forward-word)
   ("x" mm/kill-point-or-region)
   ("z" mm/noop)
   ("y" kill-ring-save)                  ;; TODO yank commands
   )

  (ryo-modal-keys
   ;; First argument to ryo-modal-keys may be a list of keywords.
   ;; These keywords will be applied to all keybindings.
   (:norepeat t)
   ;; ("0" "M-0")
   ("1" "M-1")
   ("2" "M-2")
   ("3" "M-3")
   ("4" "M-4")
   ("5" "M-5")
   ("6" "M-6")
   ("7" "M-7")
   ("8" "M-8")
   ("9" "M-9"))

  (ryo-modal-keys
   ("SPC"   (("SPC" set-mark-command)))
   ("SPC s" (("a" mark-page)
             ("e" er/expand-region)
             ("s" er/mark-symbol)
             ("b" er/mark-inside-pairs)
             ("l" mm/mark-line)
             ("'" er/mark-inside-quotes)
             ("." er/mark-text-sentence)
             ("p" er/mark-text-paragraph)
             ("w" er/mark-word)))
   ("SPC b" (("b" switch-to-buffer)
             ("d" crux-delete-file-and-buffer)
             ("r" crux-rename-file-and-buffer)
             ("c" crux-cleanup-buffer-or-region)))
   ("SPC f" (("i" crux-find-user-init-file)
             ("f" find-file)))
   
   )

  ;; TODO debug why setting these in the use-package construct wasn't
  ;; working properly.
  (add-hook 'text-mode-hook #'ryo-modal-mode)
  (add-hook 'prog-mode-hook #'ryo-modal-mode)

  )

(use-package ace-window
  :straight t
  :ryo
  ("SPC w" (("-" mm/split-horizontally)
            ("/" mm/split-vertically)
            ("h" windmove-left)
            ("j" windmove-down)
            ("k" windmove-up)
            ("l" windmove-right)
            ("f" ace-window)
            ("s" ace-swap-window)
            ("d" ace-delete-window)
            ("z" ace-maximize-window))))

(provide 'mymacs-keys)
