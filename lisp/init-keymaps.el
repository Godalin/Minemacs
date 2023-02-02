;;; general
(use-package general)


;;; display key hint
(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  ;; abort key sequence with ESC
  (which-key-define-key-recursively
   global-map (kbd "ESC") 'keyboard-quit)
  )


;;; window move by number
;; (use-package winum
;;   :ensure t
;;   :config
;;   (winum-mode))

(use-package ace-window
  :config
  (setq aw-minibuffer-flag t))


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
;; (general-define-key
;;  :keymaps 'helm-map
;;  "ESC" 'helm-keyboard-quit
;;  "TAB" 'helm-execute-persistent-action
;;  "C-z" 'helm-select-action)


;;; company bindings
;; TAB to complete
;; keeps RET's behavior
(general-define-key
 :keymaps 'company-active-map

 "TAB" 'company-complete
 [tab] 'company-complete
 "RET" nil
 [return] nil

 "M-h" 'company-quickhelp-manual-begin

 )


;;; simple config
;; (general-define-key
;;  ;; "M-x" 'helm-M-x
;;  )


;;; insert mode key modify
(general-define-key
 :states '(insert emacs)
 "C-DEL" 'evil-delete-backward-word

 )


;;; global which-key
(which-key-add-key-based-replacements
  "SPC b" "ops - buffers"
  "SPC d" "ops - dired"
  "SPC f" "ops - files"
  "SPC p" "ops - projects"
  "SPC m" "ops - local"
  "SPC h" "helps"
  "SPC C-f" "ops - search"
  "SPC s" "ops - lsp")


;;; for global
(my-leader-def
  :states '(motion)
  :keymaps 'override

  ;; command line
  ;; "SPC" 'helm-M-x
  "SPC" 'execute-extended-command

  ;; vterm
  "'" 'vterm-other-window

  ;; quick move
  "<up>" 'evil-window-up
  "<down>" 'evil-window-down
  "<left>" 'evil-window-left
  "<right>" 'evil-window-right

  ;; number window
  ;; "#" 'winum-select-window-by-number

  ;; buffer operation
  "bb" 'switch-to-buffer
  "bf" 'switch-to-buffer-other-frame
  "bt" 'switch-to-buffer-other-tab
  "bw" 'switch-to-buffer-other-window
  "b<left>" 'previous-buffer
  "bp" 'previous-buffer
  "b<right>" 'next-buffer
  "bn" 'next-buffer
  "bd" 'kill-buffer
  "bs" 'scratch-buffer
  "br" 'rename-buffer
  "bu" 'rename-uniquely
  "bq" 'read-only-mode
  "bl" 'list-buffers

  ;; eval elisp expressions
  "ei" 'eval-expression

  ;; help functions
  "hw" 'hello
  "hk" 'describe-key
  "hf" 'describe-function
  "hs" 'info-lookup-symbol
  "hv" 'describe-variable

  ;; dired operations
  "dd" 'dired

  ;; file operations
  "fr" 'recentf-open
  "fs" 'save-buffer
  "fS" 'save-some-buffers
  "ff" 'find-file
  "fR" 'find-file-read-only
  "fw" 'write-file
  "fW" 'set-visited-file-name
  "f~" 'not-modified
  ;; "ft" 'treemacs
  ;; "fe" 'treemacs-select-directory
  "ft" 'neotree-toggle

  ;; find things
  "C-f s" 'swiper-isearch
  "C-f f" 'swiper
  "C-f p" 'swiper-thing-at-point

  ;; project operations
  "p SPC" 'project-execute-extended-command
  "p'" 'projectile-run-vterm
  "p!" 'project-shell-command
  "p&" 'project-async-shell-command
  "pp" 'project-switch-project
  "pf" 'project-find-file
  "pg" 'project-find-regexp

  ;; resume
  "rr" 'ivy-resume

  ;; lsp operations
  "ss" 'eglot
  "sS" 'eglot-reconnect
  "sd" 'eglot-shutdown
  "sD" 'eglot-shutdown-all
  "sF" 'eglot-format
  "sf" 'eglot-format-buffer
  "sr" 'eglot-rename
  "sto" 'eglot-events-buffer
  "ste" 'eglot-stderr-buffer

  ;; themes
  "tt" 'load-theme

  ;; window split
  ;; "w|" 'split-window-horizontally
  ;; "w-" 'split-window-vertically
  ;; "wo" 'delete-other-windows
  "w" 'ace-window

  "ko" 'delete-other-windows)



;;; for quick movement
(my-move-leader-def
  :states '(motion insert emacs)
  :keymaps 'override

  "<up>" 'evil-window-up
  "<down>" 'evil-window-down
  "<left>" 'evil-window-left
  "<right>" 'evil-window-right

  ;; "1" '(winum-select-window-1 :wk "winum 1")
  ;; "2" '(winum-select-window-2 :wk "winum 2")
  ;; "3" '(winum-select-window-3 :wk "winum 3")
  ;; "4" '(winum-select-window-4 :wk "winum 4")
  ;; "5" '(winum-select-window-5 :wk "winum 5")
  ;; "6" '(winum-select-window-6 :wk "winum 6")
  ;; "7" '(winum-select-window-7 :wk "winum 7")
  ;; "8" '(winum-select-window-8 :wk "winum 8")
  ;; "9" '(winum-select-window-9 :wk "winum 9")

  )


(general-define-key
 :status '(motion insert emacs)
 :keymaps 'override

 "C-w" 'ace-window)



;;; for sly
(my-local-leader-def
  :states '(motion)
  :keymaps 'sly-mode-map

  "'" 'sly
  ":" 'sly-interactive-eval
  "`" 'next-error
  ;; "TAB" 'my-sly-eval-whole

  "cc" 'sly-compile-defun
  "ck" 'sly-compile-and-load-file
  "cK" 'sly-compile-file
  "cl" 'sly-load-file
  "cr" 'sly-compile-region

  "ee" 'sly-eval-last-expression
  "ef" 'sly-eval-defun
  "eP" 'sly-eval-print-last-expression
  "ep" 'sly-pprint-eval-last-expression
  "er" 'sly-eval-region

  "mo" 'sly-macroexpand-1
  "ma" 'sly-macroexpand-all
  "mio" 'sly-macroexpand-1-inplace
  "mia" 'sly-macroexpand-all-inplace
  "mco" 'sly-compiler-macroexpand-1
  "mca" 'sly-compiler-macroexpand
  "ms" 'sly-format-string-expand
  "mu" 'sly-macroexpand-undo
  "q" 'sly-temp-buffer-quit

  "xE" 'sly-edit-value
  "xU" 'sly-undefine-function

  "nn" 'sly-next-note
  "nN" 'sly-previous-note
  "nd" 'sly-remove-notes

  "ha" 'sly-arglist
  "hT" 'sly-autodoc-mode
  "hd" 'sly-describe-symbol
  "hf" 'sly-describe-function
  "ha" 'sly-apropos
  "hz" 'sly-apropos-all
  "hp" 'sly-apropos-package
  "hh" 'hyperspec-lookup
  "h~" 'hyperspec-lookup-format
  "h#" 'hyperspec-lookup-reader-macro

  "g." 'sly-edit-definition

  )



;;; for evil normal state
(general-define-key
 :states 'normal
 "C-p" 'counsel-yank-pop)



;;; for lispy mode and other auto parens
;;; for direct insert mode
(general-define-key
 :states '(insert emacs)
 :keymaps '(prog-mode-map text-mode-map)
 ;; this config uses electric pair, use these to insert single
 ;; do not auto pair with Meta

 ;; delete single char
 "M-DEL" 'delete-backward-char

 ;; ordinary pairs
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
 "M-/" (lambda () "single /" (interactive) (insert-char ?\/))

 )



;;; fix lispyville bugs in additional movements
(general-define-key
 :states 'normal
 :keymaps 'lispyville-mode-map
 "[" 'lispyville-previous-opening
 "]" 'lispyville-next-closing)



;;; for ivy
(general-map-key
 :keymaps 'ivy-mode)



;;; simple echo command
(defun hello ()
  (interactive)
  (message "hello evil"))



(provide 'init-keymaps)
