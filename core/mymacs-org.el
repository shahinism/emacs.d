(which-key-declare-prefixes "SPC o" "Org Mode")

(evil-leader/set-key
  "oa" 'org-agenda
  "ol" 'org-store-link
  "ob" 'org-iswitchb)

(org-babel-do-load-languages 'org-babel-load-languages
                             '((sh . t)
                               (dot . t)
                               (python . t)
                               (gnuplot . t)
                               (org . t)
                               (ditaa . t)
                               (latex . t)))

(setq org-confirm-babel-evaluate nil)

;; Some useful configs from http://ergoemacs.org/emacs/emacs_org_mode_customization.html
(progn
  ;; org-mode setup
  ;; when opening a org file, don't collapse headings
  ;; (setq org-startup-folded nil)
  ;; wrap long lines. don't let it disappear to the right
  (setq org-startup-truncated nil)
  ;; when in a url link, enter key should open it
  (setq org-return-follows-link t)
  ;; make org-mode” syntax color embedded source code
  (setq org-src-fontify-natively t))

;; org-bullets
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook #'org-bullets-mode))

;; evil-org
(use-package evil-org
  :config
  (add-hook 'org-mode-hook (lambda () (evil-org-mode +1))))

(use-package ox-twbs)

(use-package htmlize
  :defer t)    

(el-get-bundle org-wiki
               :url "https://raw.githubusercontent.com/caiorss/org-wiki/master/org-wiki.el"
               :description "Emacs' desktop wiki built with org-mode"
               :features org-wiki)

(setq org-wiki-location "~/Work/Wiki")
(setq org-wiki-server-host "127.0.0.1") ;; Listen only localhost 
(setq org-wiki-server-port "8181")
(require 'org-wiki)
(which-key-declare-prefixes "SPC ow" "Org Wiki")
(evil-leader/set-key
  "owh" 'org-wiki-help
  "owi" 'org-wiki-index
  "owo" 'org-wiki-helm
  "owb" 'org-wiki-switch
  "owx" 'org-wiki-close
  "owl" 'org-wiki-link
  "ows" 'org-wiki-server-toggle
  "owe" 'org-wiki-export-html-sync)

(provide 'mymacs-org)
