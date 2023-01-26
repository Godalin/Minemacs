;;;; basic config


;;; files
(setq tab-width 4
      make-backup-files nil
      auto-save-default t)


;;; always use y-or-n-p
(defalias 'yes-or-no-p 'y-or-n-p)


;;; use other files
(add-to-list 'load-path "/home/godalin/.emacs.d/lisp/")


(require 'init-packages)
(require 'init-ui)
(require 'init-evil)
(require 'init-langs)
(require 'init-keymaps)



(use-package keycast
  :config
  (keycast-header-line-mode t))



(use-package recentf
  :config
  (recentf-mode t)
  :bind (("C-x C-r" . 'recentf-open-files)))




(use-package company
  :config
  (setq company-idle-delay 0.3)
  (global-company-mode t))


(use-package helm)


(use-package treemacs)
(use-package treemacs-evil
  :after (treemacs evil))





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-minibuffer-history-key "M-p")
 '(package-selected-packages
   '(lispyville winum which-key use-package treemacs-evil sly monokai-theme keycast helm general evil-commentary evil-collection evil-cleverparens company auto-package-update)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
