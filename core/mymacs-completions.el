;; smart tab behaviour
(setq tab-always-indent 'complete)

;; company
; http://company-mode.github.io/
(use-package company
  :config
  (setq
   company-minimum-prefix-length 0
   company-idle-delay 0)
  (global-company-mode +1))

;; smart-parens
; https://github.com/Fuco1/smartparens
(use-package smartparens
  :config
  (smartparens-global-mode 1)
  (require 'smartparens-config))

;; helm
(use-package helm
  :demand t
  :init
  (setq helm-candidate-number-limit 50)
  :config
  (require 'helm-config))

(provide 'mymacs-completions)
