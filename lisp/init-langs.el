;;;; language config -*- lexical-binding: t; -*-


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
