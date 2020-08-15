(require 'org)

(org-babel-load-file (concat (file-name-as-directory user-emacs-directory) "README.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-jump-mode modus-operandi-theme smartparens hydra-examples ace-window evil-magit hydra use-package-hydra general evil-collection ivy-rich restart-emacs counsel ivy-hydra ivy doom-themes magit evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
