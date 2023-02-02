;; (use-package org-evil)
(use-package org-roam
  :config

  )


(use-package org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
	org-roam-ui-follow t
	org-roam-ui-update-on-save t
	org-roam-ui-open-on-start t)
  )




(provide 'init-org)
