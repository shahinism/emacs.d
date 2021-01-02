(defvar mymacs-core-dir (expand-file-name "core" user-emacs-directory))
(defvar mymacs-savefile-dir (expand-file-name "savefile" user-emacs-directory))

(unless (file-directory-p mymacs-savefile-dir)
  (make-directory mymacs-savefile-dir))

(add-to-list 'load-path mymacs-core-dir)

(require 'mymacs-packages)
(require 'mymacs-keys)
(require 'mymacs-editor)
(require 'mymacs-utils)
(require 'mymacs-programming)
