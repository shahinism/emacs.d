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

  (setq org-todo-keywords '((sequence "[ ](t)" "[w](w)" "|" "[x](d)" "[-](c)")))
  (require 'org-protocol))

(use-package org-roam
  :straight t
  :ryo
  ("SPC n" (("d" org-roam-dailies-capture-today :name "Capture Daily Note")))
  :config
  (setq org-roam-directory "~/org/roam"
        org-roam-dailies-directory "~/org/daily")

  (add-hook 'after-init-hook 'org-roam-mode)
  
  (when (not (file-directory-p org-roam-directory))
    (make-directory org-roam-directory))

  (setq org-roam-dailies-capture-templates
      '(("p" "Personal" entry
         #'org-roam-capture--get-point
         "* %?"
         :file-name "~/org/daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n"
         :olp ("Personal"))

        ("t" "Technical" entry
         #'org-roam-capture--get-point
         "* %?"
         :file-name "~/org/daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n"
         :olp ("Technical"))))
  )


(provide 'mymacs-org)
