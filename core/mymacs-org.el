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


(use-package org-roam
      :straight t
      :custom
      (org-roam-directory (file-truename "~/org/roam"))
      ;; :bind (("C-c n l" . org-roam-buffer-toggle)
      ;;        ("C-c n f" . org-roam-node-find)
      ;;        ("C-c n g" . org-roam-graph)
      ;;        ("C-c n i" . org-roam-node-insert)
      ;;        ("C-c n c" . org-roam-capture)
      ;;        ;; Dailies
      ;;        ("C-c n j" . org-roam-dailies-capture-today))
      :init
      (setq org-roam-v2-ack t)
      :config
      (sa/leader-key-def
        "r" '(:ignore t :which-key "roam")
        "rl" 'org-roam-buffer-toggle
        "rf" 'org-roam-node-find
        "rg" 'org-roam-graph
        "ri" 'org-roam-node-insert
        "rc" 'org-roam-capture
        "rd" '(:ignore t :which-key "dailies")
        "rdt" 'org-roam-dailies-capture-today)

      (org-roam-setup)
      ;; disable v1->v2 migration warning
      ;; If using org-roam-protocol
      (require 'org-roam-protocol))

;;(use-package org-web-tools
;;  :straight t)


(provide 'mymacs-org)
