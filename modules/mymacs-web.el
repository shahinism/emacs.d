;; web-mode
(use-package web-mode
  :mode ("\\.p?html?$"
         "\\.\\(tpl\\|blade\\)\\(\\.php\\)?$"
         "\\.erb$"
         "\\.jsp$"
         "\\.as[cp]x$"
         "\\.mustache$"
         "\\.tsx$"
         "wp-content/themes/.+/.+\\.php$")
  :config
  (setq web-mode-markup-indent-offset 2))

;; company-web
(use-package company-web
  :after web-mode
  :config
  (add-to-list 'company-backends 'company-web))

;; rainbow
(use-package rainbow-mode
  :init
  (add-hook 'web-mode-hook 'rainbow-mode)
  (add-hook 'css-mode-hook 'rainbow-mode))

; make web-mode play nice with smartparens
; https://github.com/bbatsov/prelude/blob/master/modules/prelude-web.el
(setq web-mode-enable-auto-pairing nil)

(sp-with-modes '(web-mode)
  (sp-local-pair "%" "%"
                 :unless '(sp-in-string-p)
                 :post-handlers '(((lambda (&rest _ignored)
                                     (just-one-space)
                                     (save-excursion (insert " ")))
                                   "SPC" "=" "#")))
  (sp-local-tag "%" "<% "  " %>")
  (sp-local-tag "=" "<%= " " %>")
  (sp-local-tag "#" "<%# " " %>"))

;; haml-mode
(use-package haml-mode
  :mode "\\.haml$")

(provide 'mymacs-web)
