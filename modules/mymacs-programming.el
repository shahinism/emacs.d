;; Which function mode
; http://emacsredux.com/blog/2014/04/05/which-function-mode/
(use-package which-func
  :config
  (setq which-func-unknown "n/a")
  (which-function-mode))

;; exec-path-from-shell
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; projectile
(defun neotree-find-project-root ()
  (interactive)
  (if (neo-global--window-exists-p)
      (neotree-hide)
    (let ((origin-buffer-file-name (buffer-file-name)))
      (neotree-find (projectile-project-root))
      (neotree-find origin-buffer-file-name))))

(use-package projectile
  :after helm
  :config
  (setq projectile-completion-system 'helm)

  (evil-leader/set-key
    "pt" 'neotree-find-project-root))

(use-package helm-projectile
  :after
  helm
  projectile
  :config
  (evil-leader/set-key
    "fp" 'helm-projectile))

;; flycheck
(use-package flycheck
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-indication-mode 'right-fringe)
  (fringe-helper-define 'flycheck-fringe-bitmap-double-arrow 'center
                        "...X...."
                        "..XX...."
                        ".XXX...."
                        "XXXX...."
                        ".XXX...."
                        "..XX...."
                        "...X....")
  (add-hook 'prog-mode-hook 'flycheck-mode))

(use-package flycheck-pos-tip
  :after flycheck
  :config
  (setq flycheck-pos-tip-timeout 10
        flycheck-display-errors-delay 0.5)
  (flycheck-pos-tip-mode +1))

;; evil-nerd commenter
(use-package evil-nerd-commenter
  :config
  (global-evil-leader-mode)
  (define-key evil-normal-state-map "gc" 'evilnc-comment-operator))

;; rainbow delimiter
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; wakatime
;; TODO make cli-path configurable and activate this module only if api key is available
(use-package wakatime-mode
  :config
  (setq wakatime-api-key mymacs-wakatime-api)
  (setq wakatime-cli-path "/home/shahin/.pyenv/versions/3.6.1/bin/wakatime")
  (global-wakatime-mode))

;; https://github.com/pkmoore/strace-mode
(use-package strace-mode)

(provide 'mymacs-programming)
;;; mymacs-programming.el ends here
