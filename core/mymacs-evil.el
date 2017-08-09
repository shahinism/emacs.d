;; evil-leader
; https://github.com/cofi/evil-leader
(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

;; evil
; https://github.com/emacs-evil/evil
(use-package evil
  :config
  (evil-mode +1)
  (evil-leader/set-key
    "gs" 'magit-status
    "wh" 'evil-window-left
    "wj" 'evil-window-down
    "wl" 'evil-window-right
    "wk" 'evil-window-up))

;; which-key
(use-package which-key
  :config
  (which-key-mode +1))

(provide 'mymacs-evil)
