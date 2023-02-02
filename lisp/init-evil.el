;;; evil config
(use-package evil
  :after undo-fu
  :init
  (setq evil-want-integration t
	evil-want-keybinding nil)

  :config
  (evil-mode 1)
  (setq evil-undo-system 'undo-fu
	evil-want-Y-yank-to-eol t
	evil-move-beyond-eol t)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'vterm-mode 'emacs)
  )


;;; evil-collection
;; maybe useless
;; (use-package evil-collection
;;   :after evil
;;   :config
;;   (evil-collection-init))


;;; lispyville for lispy
(use-package lispyville
  :after evil
  :hook
  ((emacs-lisp-mode lisp-mode) . lispyville-mode)
  :config
  (lispyville-set-key-theme
   '(lispy
     text-objects
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


;;; surround
(use-package evil-surround
  :config
  (global-evil-surround-mode 1))



(provide 'init-evil)
