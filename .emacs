;;; package --- Summary
;;; Commentary:
(require 'package)

;;; Code:
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(require 'use-package)

(use-package js
  :config
  (define-key js-mode-map (kbd "C-c C-c") 'comment-region))

(use-package ido
  :config
  (ido-mode t))

(use-package google-this
  :config
  (google-this-mode 1)
  (global-set-key (kbd "C-x g") 'google-this-mode-submap))

(use-package elpy
  :config
  (elpy-enable))

(use-package js-comint
  :config
  (setq inferior-js-program-command "node")
  (setq inferior-js-program-arguments '("--interactive")))

(add-to-list 'default-frame-alist '(font . "Terminus-12"))
(set-face-attribute 'default t :font "Terminus-12")
(desktop-save-mode 1)
(delete-selection-mode 1)
(electric-pair-mode t)
(show-paren-mode 1)
(column-number-mode t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)

(setq c-default-style "stroustrup"
      c-basic-offset 4)

(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

(setq python-shell-interpreter "/usr/bin/python3")

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


(c-set-offset 'case-label '+)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 6
      version-control t)

(use-package flycheck
  :config
  (add-hook 'c++-mode-hook
	    (lambda () (setq flycheck-gcc-language-standard "c++11")))
  (add-hook 'after-init-hook #'global-flycheck-mode))

(add-hook 'c++-mode-hook #'subword-mode)

(defun open-init-file ()
  "Open the init file."
  (interactive)
  (find-file user-init-file))

(load-theme 'alect-black-alt t)
(provide '.emacs)
;;; .emacs ends here
