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
  (setq helm-candidate-number-limit 50
        helm-display-header-line nil
        helm-ff-auto-update-initial-value nil
        helm-find-files-doc-header nil
        helm-buffers-fuzzy-matching t
        helm-move-to-line-cycle-in-source t)

  :config
  (require 'helm-config)

  ;; https://www.reddit.com/r/emacs/comments/345vtl/make_helm_window_at_the_bottom_without_using_any/
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*helm" (* not-newline) "*" eos)
                 (display-buffer-in-side-window)
                 (inhibit-same-window . t)
                 (window-height . 0.4)))

  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-h f") 'helm-apropos)
  (global-set-key (kbd "C-h r") 'helm-info-emacs)

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

(provide 'mymacs-completions)
