;;;; general config


;;; add exec path
(push "/home/godalin/.ghcup/bin" exec-path)
(setenv "PATH" (concat (getenv "PATH") ":/home/godalin/.ghcup/bin"))


;;; files
(setq warning-minimum-level :emergency)


;;; always use y-or-n-p
(defalias 'yes-or-no-p 'y-or-n-p)


;;; use other files
(add-to-list 'load-path "/home/godalin/.emacs.d/lisp/")


;;; self-created files
(require 'init-packages)
(require 'init-basic)
(require 'init-evil)
(require 'init-ui)
(require 'init-edit)
(require 'init-files)
(require 'init-langs)

(require 'init-org)
(require 'init-keymaps)


(require 'init-exwm)



