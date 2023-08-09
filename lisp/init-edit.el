;;; tab-width
(setq tab-width 4)


;;; show whitespace
(use-package whitespace
  :ensure nil
  :hook ((text-mode prog-mode markdown-mode conf-mode) . whitespace-mode)
  :config
  (setq whitespace-style '(face trailing)))


;;; for rainbow parenthses
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


;;; pair edits
(setq electric-pair-preserve-balance t
      electric-pair-delete-adjacent-pairs t
      electric-pair-open-newline-between-pairs t
      electric-pair-skip-whitespace t
      electric-pair-pairs '((?\( . ?\))
			    (?\[ . ?\])
			    (?\{ . ?\})
			    (?\" . ?\")))
(electric-pair-mode t)



(add-hook 'prog-mode-hook 'hs-minor-mode)



(provide 'init-edit)
