;;;; for basic packages


(use-package undo-fu)


;;; cool completion system helm
;; (use-package helm
;;   :config
;;   (setq completion-styles '(flex))
;;   (helm-mode 1))



;;; i use ivy instead
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
;; (use-package neotree
;;   :config
;;   (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;;; vterm
(use-package vterm)
(use-package vterm-toggle)


(provide 'init-basic)
