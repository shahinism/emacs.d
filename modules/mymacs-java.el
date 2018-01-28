;; Credits to: http://www.goldsborough.me/emacs,/java/2016/02/24/22-54-16-setting_up_emacs_for_java_development/
(use-package eclim
  :config
  (add-hook 'java-mode-hook 'eclim-mode))

(use-package company-emacs-eclim
  :config
  (company-emacs-eclim-setup))

;; smaller indentation
(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2)))

(provide 'mymacs-java)
