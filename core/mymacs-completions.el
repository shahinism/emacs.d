;; smart tab behaviour
(setq tab-always-indent 'complete)

;; company
                                        ; http://company-mode.github.io/
(use-package company
  :config
  (setq
   company-minimum-prefix-length 0
   company-idle-delay 0
   company-dabbrev-downcase nil
   company-dabbrev-ignore-case nil
   company-dabbrev-code-other-buffers t
   company-tooltip-flip-when-above t
   company-frontends '(company-pseudo-tooltip-frontend company-echo-metadata-frontend)
   company-backends '(company-capf)
   company-global-modes '(not eshell-mode comint-mode erc-mode message-mode help-mode))

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
  (setq helm-candidate-number-limit 50
        helm-display-header-line nil
        helm-ff-auto-update-initial-value nil
        helm-find-files-doc-header nil
        helm-split-window-in-side-p t
        helm-buffers-fuzzy-matching t
        helm-move-to-line-cycle-in-source t)

  :config
  (require 'helm-config)
  (helm-mode 1)

  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-h f") 'helm-apropos)
  (global-set-key (kbd "C-h r") 'helm-info-emacs)

  (which-key-declare-prefixes "SPC h" "Helm")
  (evil-leader/set-key
    "ff" 'helm-find-files
    "fr" 'helm-recentf
    ;; Needs ag (silver-searcher) to be installed
    "hp" 'helm-do-grep-ag
    "hf" 'helm-occur
    "hw" 'helm-wikipedia-suggest))

;; helm-dash
(use-package helm-dash
  :config
  (evil-leader/set-key "hd" 'helm-dash-at-point))

;; company-quickhelp
(use-package company-quickhelp
  :config
  (setq company-quickhelp-delay 0)
  (company-quickhelp-mode 1))

;; yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1)
  ;; Disabled it due to problems on company's normal work
  ;; (add-to-list 'company-backends '(company-yasnippet)))
  )

(use-package helm-c-yasnippet
  :config
  (global-set-key (kbd "C-c y") 'helm-yas-complete))



(provide 'mymacs-completions)
