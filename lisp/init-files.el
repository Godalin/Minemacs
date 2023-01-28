;;;; basic setting for files


;;; *scratch* buffer settings
(setq initial-scratch-message
      ";; Welcome to Minemacs\n;; Start here!\n\n")


;;; file settings
(setq make-backup-files nil
      auto-save-default t)


;;; auto enter last position
(save-place-mode)


;;; projects
(use-package projectile
  :config
  (projectile-mode 1))


;;; recent files
(use-package recentf
  :config
  (recentf-mode t)
  :bind (("C-x C-r" . 'recentf-open-files)))


(provide 'init-files)
