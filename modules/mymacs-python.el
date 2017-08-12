(defun python-doc ()
  "Dfine Python docs for helm-dash."
  (interactive)
  (setq-local helm-dash-docsets '("Python 3" "Python 2")))

;; python
(use-package python
  :init
  (add-hook 'python-mode-hook 'python-doc)
  (setq python-indent-guess-indent-offset-verbose nil
        python-shell-interpreter "python"))

;; anaconda
(use-package anaconda-mode
  :after python
  :config
  ;; trim eldoc to fit the frame

  (define-key python-mode-map (kbd "M-s") 'anaconda-mode-find-definitions)

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

;; pyvenv
(use-package pyvenv
  :config
  (which-key-declare-prefixes-for-mode 'python-mode "SPC p" "Python")
  (evil-leader/set-key-for-mode 'python-mode
    "pw" 'pyvenv-workon
    "pd" 'pyvenv-deactivate))

;; Auto-formatting
(defun python-format-buffer ()
  "Format python buffer using yapify and isort."
  (interactive)
  (yapfify-buffer (point-min) (point-max))
  (py-isort-buffer))

; yapfify
(use-package yapfify :defer t)

; py-isort
(use-package py-isort :defer t)

(evil-leader/set-key-for-mode 'python-mode
  "=" 'python-format-buffer)

;; flycheck-mypy
;; (use-package flycheck-mypy
;;   :config
;;   (require 'flycheck-mypy)
;;   (flycheck-add-next-checker 'python-flake8 'python-mypy))

(provide 'mymacs-python)
