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

(provide 'mymacs-programming)
