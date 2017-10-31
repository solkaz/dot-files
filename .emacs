(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless (package-installed-p 'use-package)
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
	:mode (("\\.js\\'" . js2-mode)))

(defun inferior-js-mode-hook-setup ()
  "Better output for js-comint."
  (add-hook 'comint-output-filter-functions 'js-comint-process-output))

(use-package js-comint
  :ensure t
  :config
  (add-hook 'inferior-js-mode-hook 'inferior-js-mode-hook-setup t)
  (add-hook 'js2-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
            (local-set-key (kbd "C-M-x") 'js-send-last-sexp-and-go)
            (local-set-key (kbd "C-c b") 'js-send-buffer)
            (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)
            (local-set-key (kbd "C-c l") 'js-load-file-and-go))))

(use-package slime
  :ensure t
  :config
  (setq slime-lisp-implementations '((sbcl ("sbcl" "--no-userinit" "--core" "/users/solkaz/sbcl.core-for-slime"))))
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package exec-path-from-shell
  :ensure t
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(use-package prettier-js
  :ensure t
  :config
  (add-hook 'j2-mode-hook 'prettier-js-mode)
  (setq prettier-js-args '(
                           "--single-quote"
                           "--trailing-comma" "es5")
        ))

(defun setup-tide-mode ()
  "Set up Tide mode."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save-mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package tide
  :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(use-package magit
	:ensure t)

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

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
(delete-selection-mode 1)
(global-subword-mode 1)
(setq dired-use-ls-dired nil)

(use-package web-mode
  :ensure t
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode))

(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))

(if window-system
    (tool-bar-mode 0))

(if window-system
    (scroll-bar-mode -1))

(setq backup-directory-alist `(("." . "~/.saves")))

(add-hook 'after-init-hook 'global-company-mode)
;; (add-to-list 'company-backends 'company-elm)

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(provide '.emacs)
