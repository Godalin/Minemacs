;;;; basic config



;;; files
(setq warning-minimum-level :emergency)


;;; always use y-or-n-p
(defalias 'yes-or-no-p 'y-or-n-p)


;;; use other files
(add-to-list 'load-path "/home/godalin/.emacs.d/lisp/")


;;; self-created files
(require 'init-packages)
(require 'init-evil)
(require 'init-ui)
(require 'init-edit)
(require 'init-files)
(require 'init-langs)
(require 'init-org)
(require 'init-keymaps)


;;; cool completion system helm
;; (use-package helm
;;   :config
;;   (setq completion-styles '(flex))
;;   (helm-mode 1))

(use-package ivy
  :config
  (setq ivy-use-selectable-prompt t)
  (setq ivy-re-builders-alist
	'((read-file-name-internal . ivy--regex-fuzzy)
	  (t . ivy--regex-fuzzy)))
  (ivy-mode))

(use-package counsel
  :config
  (counsel-mode))


;;; file tree sidebar
(use-package treemacs)
(use-package treemacs-evil
  :after (treemacs evil))


;;; vterm
(use-package vterm)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(projectile vterm evil-collection doom-modeline sly tree-sitter-langs treemacs-evil counsel general winum org-evil rainbow-delimiters which-key atom-one-dark-theme auto-package-update evil-commentary all-the-icons lispyville company-quickhelp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
