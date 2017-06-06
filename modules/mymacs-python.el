;; python
(use-package python
  :init
  (setq python-indent-guess-indent-offset-verbose nil
        python-shell-interpreter "python"))

;; anaconda
(use-package anaconda-mode
  :after python
  :config
  ;; trim eldoc to fit the frame
  (setq anaconda-mode-eldoc-as-single-line t)
  (add-hook 'python-mode-hook #'anaconda-mode)
  (add-hook 'anaconda-mode-hook #'anaconda-eldoc-mode))

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
