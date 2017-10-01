;; avy
; http://emacsredux.com/blog/2015/07/19/ace-jump-mode-is-dead-long-live-avy/
(use-package avy
  :config
  (evil-leader/set-key
    "<SPC>" 'avy-goto-word-or-subword-1))

;; neotree
; https://github.com/syl20bnr/mymacs/blob/bd7ef98e4c35fd87538dd2a81356cc83f5fd02f3/layers/%2Bmymacs/mymacs-ui-visual/funcs.el#L52
(defun mymacs/neotree-collapse ()
  "Collapse a neotree node."
  (interactive)
  (let ((node (neo-buffer--get-filename-current-line)))
    (when node
      (when (file-directory-p node)
        (neo-buffer--set-expand node nil)
        (neo-buffer--refresh t))
      (when neo-auto-indent-point
        (neo-point-auto-indent)))))

(defun mymacs/neotree-collapse-or-up ()
  "Collapse an expanded directory node or go to the parent node."
  (interactive)
  (let ((node (neo-buffer--get-filename-current-line)))
    (when node
      (if (file-directory-p node)
          (if (neo-buffer--expanded-node-p node)
              (mymacs/neotree-collapse)
            (neotree-select-up-node))
        (neotree-select-up-node)))))

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
    "ft" 'neotree-toggle)

  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "l") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "h") 'mymacs/neotree-collapse-or-up))

;; beacon
(use-package beacon
  :config
  (beacon-mode +1))

;; iedit
(use-package iedit
  :config
  (which-key-declare-prefixes "SPC s" "Search")
  (evil-leader/set-key "se" 'iedit-mode))

(use-package evil-iedit-state
  :after iedit)

;; evil-matchit
(use-package evil-matchit
  :config
  (global-evil-matchit-mode 1))

;; gtags
;; from https://github.com/tuhdo/spacemacs/blob/fc8cd1d45bba0601c67601e5e6712b1763ed455b/contrib/gtags/packages.el
(defun mymacs/gtags-define-keys-for-mode (mode)
  "Define key bindings for specific MODE"
  (when (fboundp mode)

    (let ((hook (intern (concat (symbol-name mode) "-hook"))))
      (message "hook is %s" hook)
      (add-hook hook 'helm-gtags-mode)
      (unless (member mode '(c-mode
                             c++-mode
                             lisp-mode
                             emacs-lisp-mode
                             python-mode
                             ruby-mode))
        (add-hook hook (lambda ()
                         (ggtags-mode 1)
                         (eldoc-mode 1)
                         (setq-local eldoc-documentation-function #'ggtags-eldoc-function)))))

    (evil-leader/set-key-for-mode mode
      "mgc" 'helm-gtags-create-tags
      "mgd" 'helm-gtags-find-tag
      "mgf" 'helm-gtags-select-path
      "mgg" 'helm-gtags-dwim
      "mgi" 'helm-gtags-tags-in-this-function
      "mgl" 'helm-gtags-parse-file
      "mgn" 'helm-gtags-next-history
      "mgp" 'helm-gtags-previous-history
      "mgr" 'helm-gtags-find-rtag
      "mgR" 'helm-gtags-resume
      "mgs" 'helm-gtags-select
      "mgS" 'helm-gtags-show-stack
      "mgu" 'helm-gtags-update-tags)))

(use-package ggtags
  :defer t)

(use-package helm-gtags
  :after ggtags
  :config
  (setq helm-gtags-ignore-case t
        helm-gtags-auto-update t
        helm-gtags-use-input-at-cursor t
        helm-gtags-pulse-at-cursor t)

  (progn
    ;; if anyone uses helm-gtags, they would want to use these key bindings
    (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-dwim)
    (define-key helm-gtags-mode-map (kbd "C-x 4 .") 'helm-gtags-find-tag-other-window)
    (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
    (define-key helm-gtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack))
  :init
  (add-hook 'dired-mode-hook 'helm-gtags-mode)
  (add-hook 'eshell-mode-hook 'helm-gtags-mode)
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)
  ;; modes that do not have a layer, define here
  (mymacs/gtags-define-keys-for-mode 'tcl-mode)
  (mymacs/gtags-define-keys-for-mode 'java-mode)
  (mymacs/gtags-define-keys-for-mode 'vhdl-mode)
  (mymacs/gtags-define-keys-for-mode 'shell-script-mode)
  (mymacs/gtags-define-keys-for-mode 'awk-mode)
  (mymacs/gtags-define-keys-for-mode 'asm-mode)
  (mymacs/gtags-define-keys-for-mode 'dired-mode))

(provide 'mymacs-navigation)
