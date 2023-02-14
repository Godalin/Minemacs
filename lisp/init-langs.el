;;;; language config -*- lexical-binding: t; -*-



;;; tree-sitter
(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode))


;;; eglot for lsp
(use-package eglot
  :config
  ;; (setcdr (assq 'haskell-mode eglot-server-programs)
  ;; 	  ("haskell-language-server-wrapper" "--lsp"
  ;; 	   :initializationOptions
  ;; 	   '("haskell"
  ;; 	     ("formattingProvider" "none"))))
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'haskell-mode-hook 'eglot-ensure)
  )


(use-package format-all
  :config
  (add-hook 'prog-mode-hook 'format-all-mode))


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
  :hook ((sly . follow-mode))
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
  :after evil
  :config
  (add-hook 'haskell-mode-hook 'haskell-doc-mode)

  (defun haskell-evil-open-above ()
    (interactive)
    ;; (evil-digit-argument-or-evil-beginning-of-line)
    (haskell-indentation-newline-and-indent)
    (evil-previous-line)
    (haskell-indentation-indent-line)
    (evil-append-line nil))

  (defun haskell-evil-open-below ()
    (interactive)
    (evil-append-line nil)
    (haskell-indentation-newline-and-indent)))


;;; some other f**king langs
(use-package markdown-mode)

(use-package prolog
  :config
  (setq prolog-electric-if-then-else-flag t))


(provide 'init-langs)
