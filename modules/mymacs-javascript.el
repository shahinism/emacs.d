(defun javascript-doc ()
  "Dfine Javascript docs for helm-dash."
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript")))

;; js2-mode
(defun mymacs/js2-mode-hook ()
  (javascript-doc)
  (setq flycheck-checker 'javascript-standard))

(use-package js2-mode
  :mode "\\.js$"
  :interpreter "node"
  :config
  (which-key-declare-prefixes-for-mode 'js2-mode "SPC j" "JavaScript")

  (setq js2-skip-preprocessor-directives t
        js2-highlight-external-variables nil
        js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil)

  (setq-default js2-basic-offset 2)

  (add-hook 'js2-mode-hook 'mymacs/js2-mode-hook))

;; js2-refactor
;; https://github.com/magnars/js2-refactor.el
(use-package js2-refactor
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)

  (which-key-declare-prefixes-for-mode 'js2-mode "SPC ja" "arguments")
  (which-key-declare-prefixes-for-mode 'js2-mode "SPC je" "extract/expand")
  (which-key-declare-prefixes-for-mode 'js2-mode "SPC jf" "function")
  (which-key-declare-prefixes-for-mode 'js2-mode "SPC jp" "parameter")
  (which-key-declare-prefixes-for-mode 'js2-mode "SPC jt" "toggle")
  (which-key-declare-prefixes-for-mode 'js2-mode "SPC jv" "variable")
  (evil-leader/set-key-for-mode 'js2-mode
    "j3" 'js2r-ternary-to-if
    "jag" 'js2r-inject-global-in-iife
    "jao" 'js2r-arguments-to-object
    "jd" 'js2r-debug-this
    "jec" 'js2r-contract-node-at-point
    "jee" 'js2r-expand-node-at-point
    "jef" 'js2r-extract-function
    "jem" 'js2r-extract-method
    "jev" 'js2r-extract-var
    "jfb" 'js2r-forward-barf
    "jfs" 'js2r-forward-slurp
    "jfw" 'js2r-wrap-buffer-in-iife
    "jk" 'js2r-kill
    "jl" 'js2r-log-this
    "jpi" 'js2r-introduce-parameter
    "jpl" 'js2r-localize-parameter
    "js" 'js2r-split-string
    "jta" 'js2r-toggle-arrow-function-and-expression
    "jtf" 'js2r-toggle-function-expression-and-declaration
    "ju" 'js2r-unwrap
    "jvg" 'js2r-add-to-globals-annotation
    "jvi" 'js2r-inline-var
    "jvr" 'js2r-rename-var
    "jvs" 'js2r-split-var-declaration
    "jvt" 'js2r-var-to-this))

;; xref-js2
(use-package xref-js2
  :config
  (define-key js2-mode-map (kbd "M-s") 'xref-find-definitions)
  (define-key js2-mode-map (kbd "M-r") 'xref-find-references)

  (add-hook 'js2-mode-hook (lambda ()
                             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

;; Tern
(use-package tern
  :init (add-hook 'js2-mode-hook #'tern-mode)
  :config
  (setq tern-command (append tern-command '("--no-port-file"))))

(use-package company-tern
  :after
  tern
  company
  :config
  (add-to-list 'company-backends 'company-tern))

;; rjsx
(use-package rjsx-mode
  :mode "\\.jsx$"
  :mode "components/.+\\.js$")

;; coffee
(use-package coffee-mode
  :mode "\\.coffee$"
  :init (setq coffee-indent-like-python-mode t))

(provide 'mymacs-javascript)
