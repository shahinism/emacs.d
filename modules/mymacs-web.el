;; web-mode
(use-package web-mode
  :mode ("\\.p?html?$"
         "\\.\\(tpl\\|blade\\)\\(\\.php\\)?$"
         "\\.erb$"
         "\\.jsp$"
         "\\.as[cp]x$"
         "\\.xml$"
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

;; web-beautify
(use-package web-beautify
  :config
  (evil-leader/set-key-for-mode 'js2-mode "=" 'web-beautify-js)
  (evil-leader/set-key-for-mode 'web-mode "=" 'web-beautify-html)
  (evil-leader/set-key-for-mode 'css-mode "=" 'web-beautify-css))
;; yarn global add js-beautify
;; It is configurable using .jsbeautifyrc file with following content
;; {
;;   "indent_size": 2,
;;   "indent_char": " ",
;;   "indent_with_tabs": false,
;;   "editorconfig": true,
;;   "eol": "\n",
;;   "end_with_newline": false,
;;   "indent_level": 0,
;;   "preserve_newlines": true,
;;   "max_preserve_newlines": 10,
;;   "space_in_paren": false,
;;   "space_in_empty_paren": false,
;;   "jslint_happy": false,
;;   "space_after_anon_function": false,
;;   "space_after_named_function": false,
;;   "brace_style": "collapse",
;;   "unindent_chained_methods": false,
;;   "break_chained_methods": false,
;;   "keep_array_indentation": false,
;;   "unescape_strings": false,
;;   "wrap_line_length": 0,
;;   "e4x": false,
;;   "comma_first": false,
;;   "operator_position": "before-newline",
;;   "indent_empty_lines": false,
;;   "templating": [
;;     "auto"
;;   ]
;; }



(provide 'mymacs-web)
