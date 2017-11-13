;; smart tab behaviour
(setq tab-always-indent 'complete)

;; company
                                        ; http://company-mode.github.io/
(use-package company
  :bind (("M-c" . company-complete))
  :config
  (setq
   company-minimum-prefix-length 2
   company-idle-delay 0
   company-dabbrev-downcase nil
   company-dabbrev-ignore-case nil
   company-dabbrev-code-other-buffers t
   company-tooltip-flip-when-above nil
   company-frontends '(company-pseudo-tooltip-frontend)
   company-backends '(company-capf)
   company-global-modes '(not eshell-mode comint-mode erc-mode message-mode help-mode))
  (global-company-mode +1))
;; smart-parens
                                        ; https://github.com/Fuco1/smartparens
(use-package smartparens
  :config
  (smartparens-global-mode 1)
  (require 'smartparens-config))

(use-package ivy
  :demand t
  ;; :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; full file names - useful when multiple files have same names
  (setq ivy-virtual-abbreviate 'full)
  ;; fuzzy everywhere except when searching for something
  (setq ivy-re-builders-alist
    '((swiper . ivy--regex-plus)
      (counsel-ag . ivy--regex-plus)
      (counsel-grep-or-swiper . ivy--regex-plus)
      (t . ivy--regex-plus)))
  )

(use-package counsel
  :after ivy
  :init
  (global-set-key (kbd "M-y") 'counsel-mark-ring)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-h f") 'counsel-apropos)

  (which-key-declare-prefixes "SPC h" "Ivy")
  (evil-leader/set-key
    "ff" 'counsel-find-file
    "fr" 'counsel-recentf
    ;; Needs ag (silver-searcher) to be installed
    "ia" 'counsel-ag
    "io" 'counsel-ag-occur))

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

  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-h r") 'helm-info-emacs)

  (which-key-declare-prefixes "SPC h" "Helm")
  (evil-leader/set-key
    "hw" 'helm-wikipedia-suggest))

;; helm-dash
(use-package helm-dash
  :config
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program mymacs-default-browser)
  (setq helm-dash-browser-func 'browse-url-generic)
  (evil-leader/set-key "hd" 'helm-dash-at-point))

;; company-quickhelp
(use-package company-quickhelp
  :config
  (setq company-quickhelp-delay 1)  ; Hoping to fix cursor jump while typing fast
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
