;;; evil config
(use-package evil
  :init
  (setq evil-want-integration t
	evil-want-keybinding nil)

  :config
  (evil-mode 1)
  (setq evil-undo-system 'undo-redo
	evil-want-Y-yank-to-eol t
	evil-move-beyond-eol t)
  (evil-initial-state 'dired-mode 'emacs))


;;; evil-collection
;; maybe useless
(use-package evil-collection
  :after (evil sly)
  :config
  (evil-collection-init 'sly))


;;; lispyville
(use-package lispyville
  :after evil
  :hook
  ((emacs-lisp-mode lisp-mode) . lispyville-mode)
  :config
  (lispyville-set-key-theme
   '(lispy
     pretty
     commentary
     operators
     c-w
     additional-movement
     additional
     additional-insert
     additional-wrap
     slurp/barf-cp)))


;;; comment for evil
(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))


(provide 'init-evil)
