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

  (setq evil-normal-state-tag
	(propertize "[Nml]" 'face '((:background "green" :foreground "black")))

	evil-emacs-state-tag
	(propertize "[Ecs]" 'face '((:background "orange" :foreground "black")))

	evil-insert-state-tag
	(propertize "[Ins]" 'face '((:background "red") :foreground "white"))

	evil-motion-state-tag
	(propertize "[Mot]" 'face '((:background "blue") :foreground "white"))

	evil-visual-state-tag
	(propertize "[Vis]" 'face '((:background "grey80" :foreground "black")))

	evil-operator-state-tag
	(propertize "[Opr]" 'face '((:background "purple"))))


  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'vterm-mode 'emacs))



;;; evil-collection
;; maybe useless
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))



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
