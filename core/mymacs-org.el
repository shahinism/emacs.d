(use-package org-bullets
  :straight t
  :config
  (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package org
  ;; :straight org-plus-contrib
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
  (setq org-use-speed-commands t
        org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-capture-inbox-file "~/org/inbox.org"
        org-agenda-files '("~/org/agenda.org"))

  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src sh"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("sc" . "src scheme"))
  (add-to-list 'org-structure-template-alist '("ts" . "src typescript"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("yaml" . "src yaml"))
  (add-to-list 'org-structure-template-alist '("json" . "src json"))

  (org-babel-do-load-languages 'org-babel-load-languages
                               '((shell . t)
                                 (python . t)
                                 (emacs-lisp . t)))

  (setq org-todo-keywords '((sequence "[ ](t)" "[w](w)" "|" "[x](d)" "[-](c)")))
  (require 'org-protocol))

(use-package doct
  :straight t
  :after org
  :config

  (setq org-capture-templates
        (doct `(
                ("🌎 Webpage As Entry"
                 :keys "w"
                 :type plain
                 :file "~/org/inbox.org"
                 :prepend t
                 :empty-lines-after 2
                 :headline "Bookmarks"
                 :template "** "
                 :hook ,(defun my/website-to-org-entry ()
                          "Convert clipboard's URL content to org entry."
                          (org-web-tools-insert-web-page-as-entry (org-get-x-clipboard 'PRIMARY)))
                 )))))

;;(use-package org-web-tools
;;  :straight t)


(provide 'mymacs-org)
