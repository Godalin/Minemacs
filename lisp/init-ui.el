;;;; ui configel


;;; welcome message
(defun display-startup-echo-area-message()
  (message "Hello you to Minemacs by Godalin"))

;;; off the welcome page
(setq inhibit-splash-screen t)
;;; off tool bar
(tool-bar-mode -1)
;;; off scroll bar
(scroll-bar-mode -1)
;;; off menu bar
(menu-bar-mode -1)


;;; on line numbers, relative
(use-package display-line-numbers
  :config
  (setq display-line-numbers-width 3)
  :hook
  (((prog-mode text-mode) .
    (lambda ()
      (setq display-line-numbers-type 'relative)
      (display-line-numbers-mode t)))))


;;; on highlight focused line
(global-hl-line-mode 1)

;;; visual line mode
(global-visual-line-mode 1)

;;; on paren match operations
(setq show-paren-delay 0
      show-paren-style 'mixed)
(show-paren-mode 1)

(setq electric-pair-preserve-balance t
      electric-pair-delete-adjacent-pairs t
      electric-pair-open-newline-between-pairs t
      electric-pair-skip-whitespace t
      electric-pair-pairs '((?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    (?\" . ?\")))
(electric-pair-mode t)



;;; font settings
;;; Maple Mono SC NF 14
(set-face-attribute 'default nil
		    :family "Maple Mono SC NF" :height 140)


;;; theme
;; (use-package monokai-theme
;;   :config
;;   (load-theme 'monokai 1))

(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark 1))

(load-theme 'tsdh-dark 1)


;;; show pressed keys
(use-package keycast
  :after doom-modeline
  :config
  (setq keycast-mode-line-insert-after '(:eval (doom-modeline-format--main)))
  (add-to-list 'global-mode-string '("" keycast-mode-line " "))
  :hook
  ;; (doom-modeline-mode . keycast-mode-line-mode)
  )


;;; modebar
(use-package doom-modeline
  :config
  (setq doom-modeline-height 30
	doom-modeline-bar-width 8
	doom-modeline-hud nil

	;; icons
	doom-modeline-icon t
	doom-modeline-major-mode-icon t
	doom-modeline-major-mode-color-icon t
	doom-modeline-modal-icon nil
	doom-modeline-buffer-state-icon t
	doom-modeline-buffer-modification-icon t)

  (setq evil-normal-state-tag (propertize "[Normal]  " 'face '((:background "green" :foreground "black")))
	evil-emacs-state-tag (propertize "[Emacs]   " 'face '((:background "orange" :foreground "black")))
	evil-insert-state-tag (propertize "[Insert]  " 'face '((:background "red") :foreground "white"))
	evil-motion-state-tag (propertize "[Motion]  " 'face '((:background "blue") :foreground "white"))
	evil-visual-state-tag (propertize "[Visual]  " 'face '((:background "grey80" :foreground "black")))
	evil-operator-state-tag (propertize "[Operator]" 'face '((:background "purple"))))

  (doom-modeline-mode 1))


;;; for doom mode line
(use-package all-the-icons)


(provide 'init-ui)
