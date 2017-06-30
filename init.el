;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

(org-babel-load-file "~/.emacs.d/configs.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Work/Dropbox/notes/org/journal.org")))
 '(package-selected-packages
   (quote
    (csv-mode pig-mode org-wiki flyspell-correct-helm flyspell-correct dot-mode graphviz-dot-mode htmlize ox-twbs helm-c-yasnippet clojure-mode ereader web-beautify flycheck-flow flycheck-mypy doom-themes esup zenburn-theme yapfify yaml-mode xref-js2 which-key web-mode volatile-highlights use-package toml-mode spaceline smartparens rjsx-mode rainbow-mode rainbow-delimiters racer pyvenv pyenv-mode py-isort pip-requirements pdf-tools org-plus-contrib org-bullets neotree json-mode helm-projectile helm-dash haml-mode gitignore-mode gitconfig-mode fringe-helper flycheck-rust flycheck-pos-tip flycheck-irony exec-path-from-shell evil-org evil-nerd-commenter evil-matchit evil-magit evil-leader evil-iedit-state emojify dockerfile-mode disaster company-web company-tern company-quickhelp company-irony company-auctex company-anaconda coffee-mode clang-format cargo beacon avy all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
