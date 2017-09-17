(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(when (require 'use-package nil 'noerror)
  (package-install 'use-package))

(desktop-save-mode 1)

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-c h o") 'helm-occur))

(use-package helm-dash
  :ensure t
  :config
  (setq helm-dash-browser-func 'eww))

(use-package ido
  :ensure t
  :config
  (ido-mode t))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode t))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md]]'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package smart-tabs-mode
  :config
  (setq-default indent-tabs-mode nil)
  (smart-tabs-insinuate 'c 'javascript))

(use-package flymd
  :ensure t)

(use-package nov
  :ensure t
  :config
  (push '("\\.epub\\'" . nov-mode) auto-mode-alist))

(use-package js2-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

(use-package prettier-js
  :ensure t
  :config
  (add-hook 'j2-mode-hook 'prettier-js-mode)
  (setq prettier-js-args '(
                           "--single-quote"
                           "--trailing-comma" "es5")
        ))

(electric-pair-mode t)
(show-paren-mode 1)
(setq inhibit-startup-message t)
(column-number-mode t)
(setq vc-follow-symlinks t)
(setq blink-cursor-mode nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(setq create-lockfiles nil)

(load-theme 'tango-dark t)

(if window-system
    (tool-bar-mode 0))

(if window-system
    (scroll-bar-mode -1))

(add-hook 'after-init-hook 'global-company-mode)
;; (add-to-list 'company-backends 'company-elm)

(provide '.emacs)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (js-comint helm-dash prettier-js npm-mode github-clone flycheck exec-path-from-shell nov flymd-flyit smart-tabs-mode flymd markdown-mode bool-flip yaml-mode use-package ng2-mode js2-refactor helm go-mode elm-mode company)))
 '(standard-indent 2)
 '(tab-always-indent nil)
 '(tab-stop-list (quote (0 2)))
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
