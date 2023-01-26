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
(setq-default display-line-numbers-type 'relative)
(setq-default display-line-numbers-width 3)
	      ;; display-line-numbers-major-tick 20
	      ;; display-line-numbers-minor-tick 10)
(global-display-line-numbers-mode 1)


;;; on highlight focused line
(global-hl-line-mode 1)

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
		    

;; theme
(use-package monokai-theme
  :config
  (load-theme 'monokai 1))


(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-ui)
