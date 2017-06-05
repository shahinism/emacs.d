;; python
(use-package python
  :init
  (setq python-indent-guess-indent-offset-verbose nil
        python-shell-interpreter "python"))

(defun python-mode-defaults ()
  "Default configuration for python mode"
  (subword-mode +1)
  (anaconda-mode 1)
  (eldoc-mode 1)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

;; anaconda
(use-package anaconda-mode
  :config
  (add-hook 'python-mode-hook 'python-mode-defaults))

(use-package company-anaconda
  :after
  anaconda-mode
  company
  :config
  (add-to-list 'company-backends 'company-anaconda))

;; pip-requirements
; https://github.com/Wilfred/pip-requirements.el
(use-package pip-requirements
  :mode ("/requirements.txt$" . pip-requirements-mode))

(provide 'mymacs-python)
