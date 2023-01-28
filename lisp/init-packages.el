;;;; init config for package manage, mainly use use-package


(require 'package)

;;; add source
;; (setq package-archives
;;       '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
;;         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("nongnu" . "http://mirrors.ustc.edu.cn/elpa/nongnu/")))

(package-initialize)



;;; refresh source
;; (when (not package-archive-contents)
;;   (package-refresh-contents))



;;; use use-package
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;;; use-package settings
(require 'use-package)
(setq use-package-always-ensure t
      use-package-check-before-init t)



;;; auto update packages
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-verson t
	auto-package-update-hide-result t)
  (auto-package-update-maybe))



(provide 'init-packages)
