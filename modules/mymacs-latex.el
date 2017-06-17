;; auctex
; https://github.com/jwiegley/use-package/issues/379
(use-package tex
  :defer t
  :ensure auctex
  :config
  ;; Because tex-mode is built-in and AucTex has conflicting components, we need
  ;; to ensure that auctex gets loaded instead of tex-mode.
  ; https://github.com/hlissner/.emacs.d/blob/master/modules/lang/latex/config.el
  (load "auctex" nil t)
  (load "auctex-autoloads" nil t)
  (push '("\\.[tT]e[xX]\\'" . TeX-latex-mode) auto-mode-alist)

  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-save-query nil
        TeX-PDF-mode t
        TeX-source-correlate-start-server nil
        LaTeX-fill-break-at-separators nil
        LaTeX-section-hook
        '(LaTeX-section-heading
          LaTeX-section-title
          LaTeX-section-toc
          LaTeX-section-section
          LaTeX-section-label)))

;; company-auctex
(use-package company-auctex
  :after tex
  :after company
  :config
  (company-auctex-init))

;; reftex
(use-package reftex ; built-in
  :commands (turn-on-reftex reftex-mode)
  :init
  (setq reftex-plug-into-AUCTeX t
        reftex-toc-split-windows-fraction 0.2))

(provide 'mymacs-latex)
