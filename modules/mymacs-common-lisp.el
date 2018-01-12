(use-package slime-company
  :init
  (setq slime-company-completion 'fuzzy)
  :config
  (add-to-list 'company-backends 'company-slime))

(use-package slime
  :commands (slime-mode)
  :init
  (progn
    (setq slime-contribs '(slime-fancy
                           slime-indentation
                           slime-sbcl-exts
                           slime-company)
          inferior-lisp-program "sbcl"))
  :config
  (progn
    (slime-setup)))

(provide 'mymacs-common-lisp)
