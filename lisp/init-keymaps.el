;;; general
(use-package general)


;;; display key hint
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  
  ;; abort key sequence with ESC
  (which-key-define-key-recursively
   global-map (kbd "ESC") 'keyboard-quit)
  )


;;; window move by number
(use-package winum
  :ensure t
  :config
  (winum-mode))



;;; define leader keys
(defconst my-leader "SPC")
(defconst my-local-leader "SPC m")
(defconst my-move-leader "C-w")

(general-create-definer my-leader-def
  :prefix my-leader)
(general-create-definer my-local-leader-def
  :prefix my-local-leader)
(general-create-definer my-move-leader-def
  :prefix my-move-leader)


;;; helm-mode bindings
(general-define-key
 :keymaps 'helm-map
 "ESC" 'helm-keyboard-quit
 "TAB" 'helm-execute-persistent-action
 "C-z" 'helm-select-action)


;;; company bindings
;; TAB to complete
;; keeps RET's behavior
(general-define-key
 :keymaps 'company-active-map
 "TAB" 'company-complete
 [tab] 'company-complete)


;;; simple config
(general-define-key
 "M-x" 'helm-M-x)


;;; insert mode key modify
(general-define-key
 :states '(insert emacs)
 "C-DEL" 'evil-delete-backward-word)


;;; for global
(my-leader-def
  :states '(motion emacs)
  :keymaps 'override

  ;; command line
  "SPC" 'helm-M-x

  ;; quick move
  "<up>" 'evil-window-up
  "<down>" 'evil-window-down
  "<left>" 'evil-window-left
  "<right>" 'evil-window-right

  ;; number window
  "#" 'winum-select-window-by-number
  "0" '((lambda () (interactive)) (treemacs) :wk "treemacs")
  "1" '(winum-select-window-1 :wk "winum 1")
  "2" '(winum-select-window-2 :wk "winum 2")
  "3" '(winum-select-window-3 :wk "winum 3")
  "4" '(winum-select-window-4 :wk "winum 4")
  "5" '(winum-select-window-5 :wk "winum 5")
  "6" '(winum-select-window-6 :wk "winum 6")
  "7" '(winum-select-window-7 :wk "winum 7")
  "8" '(winum-select-window-8 :wk "winum 8")
  "9" '(winum-select-window-9 :wk "winum 9")

  ;; buffer operation
  "bb" 'helm-buffers-list
  "bd" 'evil-delete-buffer
  
  ;; eval elisp expressions
  "ei" 'eval-expression

  ;; help functions
  "hw" 'hello
  "hk" 'describe-key
  "hf" 'describe-function
  "hs" 'describe-symbol
  "hv" 'describe-variable

  ;; file operations
  "fr" 'helm-recentf
  "ff" 'helm-find-files
  "ft" 'treemacs
  
  "ko" 'delete-other-windows)



;;; for quick movement
(my-move-leader-def
  :states '(motion insert emacs)
  :keymaps 'override
  "<up>" 'evil-window-up
  "<down>" 'evil-window-down
  "<left>" 'evil-window-left
  "<right>" 'evil-window-right)


;;; for sly
(my-local-leader-def
  :states '(motion emacs)
  :keymaps 'sly-mode-map

  "'" 'sly
  ":" 'sly-interactive-eval
  "TAB" 'my-sly-eval-whole

  "cc" 'sly-compile-defun
  "cf" 'sly-compile-file
  "cr" 'sly-compile-region
  
  "ee" 'sly-eval-last-expression
  "ep" 'sly-eval-print-last-expression)


;;; for lispy mode and other auto parens
(general-define-key
 :states '(insert emacs)

 ;; this config uses electric pair, use these to insert single
 ;; do not auto pair with Meta
 "M-DEL" 'delete-backward-char

 "M-(" (lambda () "single (" (interactive) (insert-char ?\())
 "M-[" (lambda () "single [" (interactive) (insert-char ?\[))
 "M-{" (lambda () "single {" (interactive) (insert-char ?\{))
 "M-)" (lambda () "single )" (interactive) (insert-char ?\)))
 "M-]" (lambda () "single ]" (interactive) (insert-char ?\]))
 "M-}" (lambda () "single }" (interactive) (insert-char ?\}))
 "M-\"" (lambda () "single \"" (interactive) (insert-char ?\"))
 "M-'" (lambda () "single '" (interactive) (insert-char ?\'))

 ;; may be used in html mode
 "M-<" (lambda () "single <" (interactive) (insert-char ?\<))
 "M->" (lambda () "single >" (interactive) (insert-char ?\>))

 ;; may be used in markdown, org, regex
 "M-*" (lambda () "single *" (interactive) (insert-char ?\*))
 "M-~" (lambda () "single ~" (interactive) (insert-char ?\~))
 "M-=" (lambda () "single =" (interactive) (insert-char ?\=))
 "M-$" (lambda () "single $" (interactive) (insert-char ?\$))
 "M-`" (lambda () "single `" (interactive) (insert-char ?\`))
 "M-/" (lambda () "single /" (interactive) (insert-char ?\/)))


;;; fix lispyville bugs in additional movements
(general-define-key
 :states 'normal
 :keymaps 'lispyville-mode-map
 "[" 'lispyville-previous-opening
 "]" 'lispyville-next-closing)


;;; simple echo command
(defun hello ()
  (interactive)
  (message "hello evil"))


(provide 'init-keymaps)
