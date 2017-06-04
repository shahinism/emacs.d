;; avy
; http://emacsredux.com/blog/2015/07/19/ace-jump-mode-is-dead-long-live-avy/
(use-package avy
  :config
  (evil-leader/set-key
    "<SPC>" 'avy-goto-word-or-subword-1))

;; neotree
(use-package all-the-icons)
(use-package neotree
  :after all-the-icons
  :config
  (setq
   neo-theme (if (display-graphic-p) 'icons 'arrow)
   neo-autorefresh nil
   neo-mode-line-type 'none
   neo-window-width 25
   neo-banner-message nil
   neo-show-hidden-files nil
   neo-keymap-style 'concise
   neo-hidden-regexp-list
        '(;; vcs folders
          "^\\.\\(git\\|hg\\|svn\\)$"
          ;; compiled files
          "\\.\\(pyc\\|o\\|elc\\|lock\\|css.map\\)$"
          ;; generated files, caches or local pkgs
          "^\\(node_modules\\|vendor\\|.\\(project\\|cask\\|yardoc\\|sass-cache\\)\\)$"
          ;; org-mode folders
          "^\\.\\(sync\\|export\\|attach\\)$"
          "~$"
          "^#.*#$"))
  (evil-leader/set-key
    "pt" 'neotree-toggle))

(provide 'mymacs-navigation)
