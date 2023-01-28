;;;; language config -*- lexical-binding: t; -*-


;;; tree-sitter
(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode))

(use-package tree-sitter-langs)


;;; eglot for lsp
(use-package eglot
  :hook (haskell-mode . eglot))


;;; complete anything
(use-package company
  :config
  (setq company-idle-delay 0
	company-minimum-prefix-length 1)
  (global-company-mode t))

(use-package company-quickhelp
  :config
  (setq company-quickhelp-delay nil)
  (company-quickhelp-mode))


;;; common-lisp-sly
(use-package sly
  :after (evil)
  :init
  (setq inferior-lisp-program "sbcl")
  (setq evil-move-beyond-eol t)
  :config
  (evil-initial-state 'sly-db 'emacs)
  (evil-initial-state 'sly-mrepl 'emacs)
  (add-hook 'sly-db-hook 'evil-emacs-state)
  (add-hook 'sly-mode-hook
	    (lambda ()
	      (unless (sly-connected-p)
		(save-excursion (sly)))))
  )


(defun my-sly-eval-whole ()
  "sly eval the whole top level s-exp"
  (interactive)
  (let ((cp (point)))
    (evil-forward-WORD-end)
    (lispyville-end-of-defun)
    (forward-char)
    (sly-eval-last-expression)))


;;; python


;;; haskell


;;; some other f**king langs



(provide 'init-langs)
