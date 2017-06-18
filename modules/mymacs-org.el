;; org-plus-contrib
;; (use-package org
;;   :ensure org-plus-contrib)

;; org-bullets
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook #'org-bullets-mode))

;; evil-org
; https://github.com/edwtjo/evil-org-mode
(use-package evil-org
  :config
  (add-hook 'org-mode-hook (lambda () (evil-org-mode +1))))

(provide 'mymacs-org)
