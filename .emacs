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
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-c h o") 'helm-occur))

(use-package ido
  :config
  (ido-mode t))

(use-package google-this
  :config
  (google-this-mode 1)
  (global-set-key (kbd "C-x g") 'google-this-mode-submap))

(use-package bool-flip
  :config
  (global-set-key (kbd "C-c b") 'bool-flip-do-flip))

(use-package yasnippet
  :config
  (yas-global-mode t))

(electric-pair-mode t)
(show-paren-mode 1)
(setq inhibit-startup-message t)
(column-number-mode t)
(setq vc-follow-symlinks t)
(setq blink-cursor-mode nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq create-lockfiles nil)

(load-theme 'tango-dark t)


(if window-system
    (tool-bar-mode 0))

(if window-system
    (scroll-bar-mode -1))

(add-hook 'after-init-hook 'global-company-mode)
;; (add-to-list 'company-backends 'company-elm)

(use-package smart-tabs-mode
  :config
  (setq-default indent-tabs-mode nil)
  (smart-tabs-insinuate 'c 'javascript))

(provide '.emacs)
