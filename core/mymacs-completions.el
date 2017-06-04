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

;; ivy completion
(use-package ivy
  :config
  (setq ;; https://github.com/abo-abo/swiper
        ivy-use-virtual-buffers t
	enable-recursive-minibuffers t
	;; https://github.com/hlissner/.emacs.d/blob/master/modules/completion/ivy/config.el
        ivy-height 12
	ivy-do-completion-in-region nil
	ivy-wrap t
	ivy-fixed-height-minibuffer t
	;; Don't use ^ as initial input
        ivy-initial-inputs-alist nil
        ;; highlight til EOL
        ivy-format-function #'ivy-format-function-line
        ;; disable magic slash on non-match
        ivy-magic-slash-non-match-action nil)
  (ivy-mode +1))

(use-package counsel
  :after ivy
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (evil-leader/set-key
    "ff" 'counsel-find-file
    "fr" 'counsel-recentf))

(provide 'mymacs-completions)
