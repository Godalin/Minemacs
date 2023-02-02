;;;; language config -*- lexical-binding: t; -*-


;;; tree-sitter
(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode))


;;; eglot for lsp
(use-package eglot
  :defer t
  :hook (
	 ;; haskell mode not activate automatically
	 ;; (haskell-mode . eglot)
	 (python-mode .eglot))
  :config

  )


;; (use-package lsp-mode)
;; (use-package lsp-ui)


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
  ;; (add-hook 'sly-mode-hook
  ;; 	    (lambda ()
  ;; 	      (unless (sly-connected-p)
  ;; 		(save-excursion (sly)))))
  (add-hook 'sly-db-hook 'evil-emacs-state)
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
(use-package haskell-mode
  :config
  (defun haskell-setup ()
    "Setup variables for editing Haskell files."
    ;; (setq whitespace-line-column 70)
    ;; (make-local-variable 'tab-stop-list)
    ;; (setq tab-stop-list (number-sequence 2 80 2))
    (haskell-indentation-mode 0)
    ;; (setq indent-line-function 'indent-relative)
    )
  :hook
  ;; ((haskell-mode . 'haskell-setup))
  )


;; (use-package lsp-haskell
;;   :config
;;   (setq lsp-haskell-server-path "/home/godalin/.ghcup/bin/haskell-language-server-wrapper"))


;;; some other f**king langs



(provide 'init-langs)
