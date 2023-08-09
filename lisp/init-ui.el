;;;; ui configel -*- lexical-binding: t; -*-



;;; welcome message
(defun display-startup-echo-area-message ()
  (message "Hello you to Minemacs by Godalin"))


(add-to-list 'default-frame-alist
	     '(alpha-background . 90))


;;; theme
(use-package atom-one-dark-theme
  :config
  (load-theme 'atom-one-dark 1))
;; (use-package monokai-theme
;;   :config
;;   (load-theme 'monokai 1))



;;; font settings
(set-face-attribute 'default nil
		    :family "Maple Mono SC NF"
		    :height 140)




;;; off the welcome page
(setq inhibit-splash-screen t)

;;; off tool bar
(tool-bar-mode -1)

;;; off scroll bar
(scroll-bar-mode -1)

;;; off menu bar
(menu-bar-mode -1)



;;; tab bar mode
;;; tabs for the whole
(tab-bar-mode)
(setq tab-bar-new-button nil
      tab-bar-close-button nil)

(set-face-attribute 'tab-bar-tab nil
		    :background "gray25"
		    :box nil
		    ;; :box '(:line-width 1 :style pressed-button)
		    )
(set-face-attribute 'tab-bar nil
		    :box nil
		    ;; :box '(:line-width 1 :style released-button)
		    )



;;; tab line mode
;;; tabline for each window
(global-tab-line-mode)

(setq tab-line-new-button nil
      tab-line-close-button nil
      tab-line-separator " ")

(set-face-attribute 'tab-line nil
		    :family "Maple Mono"
		    :height 120
		    :background "#2c323C")

(set-face-attribute 'tab-line-tab nil
		    :box nil
		    :inherit 'tab-bar-tab)

(set-face-attribute 'tab-line-tab-current nil
		    :box 2
		    :foreground "SkyBlue1"
		    :background "gray25")

(set-face-attribute 'tab-line-tab-inactive nil
		    :box 2
		    :background "#2c323C")





;;; on line numbers, relative
(use-package display-line-numbers
  :config
  (setq display-line-numbers-width 3)
  :hook
  (((prog-mode text-mode) .
    (lambda ()
      (setq display-line-numbers-type 'relative)
      (display-line-numbers-mode t)))))



;;; for doom mode line
(use-package all-the-icons)



;;; modebar
(use-package doom-modeline
  :config
  (setq doom-modeline-height 30
	doom-modeline-bar-width 8
        doom-modeline-hud nil

	doom-modeline-icon t
	doom-modeline-major-mode-icon t
	doom-modeline-major-mode-color-icon t
	doom-modeline-modal t
	doom-modeline-modal-icon nil
	doom-modeline-buffer-state-icon t
	doom-modeline-buffer-modification-icon t

	doom-modeline-enable-word-count t
	doom-modeline-indent-info t

	doom-modeline-checker-simple-format nil
	)

  (doom-modeline-mode 1))

(set-face-attribute 'mode-line nil
		    :height 120)
(set-face-attribute 'mode-line-inactive nil
		    :height 120)



;;; on highlight focused line
(global-hl-line-mode 1)



;;; visual line mode
(global-visual-line-mode 1)



;;; on paren match operations
(setq show-paren-delay 0
      show-paren-style 'mixed)
(show-paren-mode 1)



;;; show pressed keys using keypression
;; (use-package keypression
;;   :config
;;   (setq keypression-frames-maxnum 2
;; 	keypression-use-child-frame nil
;; 	keypression-frame-justify 'keypression-left-justified
;; 	keypression-frame-gap 10

;; 	keypression-fade-out-fps 20
;; 	keypression-fade-out-delay 1.0
;; 	keypression-fade-out-seconds 1

;; 	keypression-concat-self-insert t
;; 	keypression-concat-digit-argument t
;; 	keypression-cast-command-name-format "%s\n%s"
;; 	keypression-cast-command-name t
;; 	keypression-combine-format "%s #x%d"
;; 	keypression-combine-same-keystrokes t

;; 	keypression-left-fringe 10
;; 	keypression-right-fringe 10

;; 	keypression-font-face-attribute '(:width normal :height 90 :weight bold)
;; 	keypression-frame-origin 'keypression-origin-bottom-right
;; 	keypression-x-offset 10
;; 	keypression-y-offset 100)

;;   (keypression-mode))



(use-package keycast
  :config
  (setq keycast-tab-bar-location 'tab-bar-format-align-right
	keycast-tab-bar-format "%R %k%c "
	keycast-tab-bar-minimal-width 0)
  (set-face-attribute 'keycast-key nil
		      :family "GoMono"
		      :height 140)
  (set-face-attribute 'keycast-command nil
		      :family "Maple Mono"
		      :height 100)
  (keycast-tab-bar-mode))





(provide 'init-ui)
