;;;; general config


;;; add exec path
;; (push "/home/godalin/.ghcup/bin" exec-path)
;; (setenv "PATH" (concat (getenv "PATH") ":/home/godalin/.ghcup/bin"))

;; (push "/home/godalin/.cabal/bin" exec-path)
;; (setenv "PATH" (concat (getenv "PATH") ":/home/godalin/.cabal/bin"))


;;; files
(setq warning-minimum-level :emergency)


;;; always use y-or-n-p
(defalias 'yes-or-no-p 'y-or-n-p)


;;; use other files
(add-to-list 'load-path "/home/godalin/.emacs.d/lisp/")


;;; self-created files
(require 'init-packages)
(require 'init-exwm)

(require 'init-ui)
(require 'init-basic)
(require 'init-evil)
(require 'init-edit)
(require 'init-files)
(require 'init-langs)

(require 'init-org)
(require 'init-keymaps)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(keycast keystrokes-mode keystrokes exec-path-from-shell format-all exwm-config evil-surround lsp-ivy flycheck sly treemacs-evil dap-mode counsel lsp-ui general org-roam-ui keypression undo-fu tree-sitter rainbow-delimiters which-key lsp-haskell atom-one-dark-theme projectile exwm evil-collection evil-commentary all-the-icons lispyville company-quickhelp vterm-toggle)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(message "Hello you Godalin to Minemacs")
