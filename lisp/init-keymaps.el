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



(use-package ace-window
  :config
  (setq aw-minibuffer-flag t
	aw-dispatch-always t
	))


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



;;; insert mode key modify
(general-define-key
 :states '(insert emacs)
 "C-DEL" 'evil-delete-backward-word

 )


;;; global which-key
(which-key-add-key-based-replacements
  "SPC SPC" "execute"
  "SPC '" "terminal"
  "SPC :" "eval"
  "SPC a" "apps"
  "SPC b" "buffer"
  "SPC c" "code"
  "SPC d" "dired"
  "SPC f" "file"
  "SPC h" "help"
  "SPC k" "kill"
  "SPC m" "local"
  "SPC p" "project"
  "SPC q" "quit"
  "SPC s" "lsp-code"
  "SPC S" "lsp"
  "SPC t" "toggle")




;;; SPC: for global
(my-leader-def
  :states '(motion)
  :keymaps 'override

  ;; command line
  "SPC" 'execute-extended-command
  ":" 'eval-expression



  ;; vterm
  "'" 'vterm-other-window

  "," 'tab-line-switch-to-prev-tab
  "." 'tab-line-switch-to-next-tab
  "<" 'tab-bar-switch-to-prev-tab
  ">" 'tab-bar-switch-to-next-tab



  ;; quick move
  "<up>" 'evil-window-up
  "<down>" 'evil-window-down
  "<left>" 'evil-window-left
  "<right>" 'evil-window-right



  ;; buffer operation
  "bb" 'switch-to-buffer
  "bf" 'switch-to-buffer-other-frame
  "bt" 'switch-to-buffer-other-tab
  "bw" 'switch-to-buffer-other-window
  "bp" 'previous-buffer
  "bn" 'next-buffer
  "bd" 'kill-current-buffer
  "bs" 'scratch-buffer
  "br" 'rename-buffer
  "bq" 'read-only-mode
  "bl" 'list-buffers



  ;; SPC c: code operations
  "cc" 'hs-hide-block
  "cC" 'hs-show-block



  ;; file operations
  "fr" 'recentf-open
  "fs" 'save-buffer
  "fS" 'save-some-buffers
  "ff" 'find-file
  "fR" 'find-file-read-only
  "fw" 'write-file
  "fW" 'set-visited-file-name
  "f~" 'not-modified
  ;; treemacs
  "ft" 'treemacs
  "fe" 'treemacs-select-directory
  ;; "ft" 'neotree-toggle



  ;; SPC h: help functions
  "hw" 'hello
  "hk" 'describe-key
  "hf" 'describe-function
  "hF" 'describe-face
  "hs" 'info-lookup-symbol
  "hv" 'describe-variable



  ;; dired operations
  "dd" 'dired



  ;; new something
  "nb" 'tab-bar-new-tab
  "nl" 'tab-line-new-tab



  ;; project operations
  "p SPC" 'project-execute-extended-command
  "p'" 'projectile-run-vterm
  "p!" 'projectile-run-shell-command-in-root
  "p&" 'projectile-run-async-shell-command-in-root
  "pp" 'projectile-switch-project
  "pf" 'projectile-find-file
  "pa" 'projectile-add-known-project



  ;; SPC q: quit options
  "qq" 'kill-emacs
  "qr" 'restart-emacs
  "qQ" 'server-stop
  "qR" 'server-start



  ;; lsp operations
  "Ss" 'eglot
  "SS" 'eglot-reconnect
  "Sd" 'eglot-shutdown
  "SD" 'eglot-shutdown-all
  "So" 'eglot-events-buffer
  "Se" 'eglot-stderr-buffer



  ;; SPC s: lsp-code
  "sN" 'flymake-goto-prev-error
  "sn" 'flymake-goto-next-error
  "sF" 'format-all-buffer
  "sc" 'eglot-code-actions
  "se" 'eldoc-doc-buffer
  "sR" 'eglot-rename
  ;; find things
  "si" 'imenu
  ;; "ss" 'swiper-isearch
  "sr" 'ivy-resume
  "ss" 'swiper
  "sx" 'swiper-thing-at-point
  "sd" 'xref-find-definitions
  "sD" 'xref-find-references
  "sp" 'counsel-yank-pop



  ;; SPC t: toggles
  "tk" 'keycast-tab-bar-mode
  "tT" 'load-theme
  "tl" 'global-tab-line-mode
  "tb" 'tab-bar-mode



  ;; SPC w: window split
  "w" 'ace-window



  ;; SPC k: kill
  "ko" 'delete-other-windows
  "kb" 'tab-bar-close-tab
  "kl" 'kill-current-buffer)




;;; for quick movement
(my-move-leader-def
  :states '(motion insert emacs)
  :keymaps 'override

  "<up>" 'evil-window-up
  "<down>" 'evil-window-down
  "<left>" 'evil-window-left
  "<right>" 'evil-window-right

  )



;;; general ace-window
(general-define-key
 :status '(motion insert emacs)
 :keymaps 'override

 "<f3>" 'ace-window)



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



;;; for haskell
(general-define-key
 :states 'motion
 :keymaps 'haskell-mode-map
 "o" 'haskell-evil-open-below
 "O" 'haskell-evil-open-above
 [remap evil-open-below] 'haskell-evil-open-below
 [remap evil-open-above] 'haskell-evil-open-above
 )



;;; simple echo command
(defun hello ()
  (interactive)
  (message "hello evil"))



(provide 'init-keymaps)
