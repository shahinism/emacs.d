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
  :after ivy
  :config
  (evil-leader/set-key
    "pt" 'neotree-find-project-root)

  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :after
  counsel
  projectile)

(provide 'mymacs-programming)
