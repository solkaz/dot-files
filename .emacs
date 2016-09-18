(setq c-default-style "stroustrup"
      c-basic-offset 4)
(require 'ido)
(ido-mode t)
(delete-selection-mode 1)
(electric-pair-mode t)
(show-paren-mode 1)
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq python-shell-interpreter "/usr/bin/python3")
(setq column-number-mode t)
(c-set-offset 'case-label '+)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 6
      version-control t)
(require 'google-this)
(google-this-mode 1)
(desktop-save-mode 1)
(add-hook 'minibuffer-setup-hook #'subword-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(package-initialize)
(elpy-enable)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (alect-black-alt)))
 '(custom-safe-themes
   (quote
    ("7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
