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


(provide 'init-edit)
