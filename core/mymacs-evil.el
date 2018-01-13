;; evil
; https://github.com/emacs-evil/evil
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration nil)
  :config
  (evil-mode 1)
  (evil-leader/set-key
    "gs" 'magit-status
    "wh" 'evil-window-left
    "wj" 'evil-window-down
    "wl" 'evil-window-right
    "wk" 'evil-window-up))

;; https://github.com/jojojames/evil-collection
(use-package evil-collection
  :after evil
  :ensure t
  :init
  (progn
    (setq evil-collection-mode-list '(info)))
  :config
  (evil-collection-init))

;; evil-leader
; https://github.com/cofi/evil-leader
(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

;; which-key
(use-package which-key
  :config
  (which-key-mode +1))

(provide 'mymacs-evil)
