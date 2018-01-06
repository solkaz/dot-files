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

(use-package js2-mode
  :ensure t
	:mode (("\\.js\\'" . js2-mode)
         ("\\.jsx\\'" . js2-jsx-mode)))

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
  :disabled
  :no-require t
  :config
  (setq slime-lisp-implementations '((sbcl ("sbcl" "--no-userinit" "--core" "/users/solkaz/sbcl.core-for-slime"))))
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
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
	:ensure t
  :bind ("C-x g" . magit-status))

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))

(use-package sicp
  :ensure t)

(use-package indent-info
  :ensure t
  :config (global-indent-info-mode +1))

(use-package easy-kill
  :ensure t
  :config
  (global-set-key [remap kill-ring-save] 'easy-kill))

(use-package fireplace
  :ensure t)

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
(setq ring-bell-function 'ignore)
(setq scroll-conservatively 100)


(defun solkaz/generate-md-buffer ()
  "Generate a scratch buffer in gfm-mode."
  (interactive)
  (switch-to-buffer (generate-new-buffer "*md-scratch*"))
  (gfm-mode))

(defun solkaz/surround (begin end char)
  "Put CHAR at START and END of the region."
  (interactive  "r\nsChar to Insert: ")
  (save-excursion
    (goto-char end)
    (insert char)
    (goto-char begin)
    (insert char)))

(defun solkaz/open-dotfiles ()
  "Open my dotfiles directory in dired."
  (interactive)
  (dired "~/dotfiles"))

;; Keybinds
(global-unset-key (kbd "s-t"))
(global-unset-key (kbd "s-q"))
(global-unset-key (kbd "<C-down-mouse-1>"))
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "M-m") 'move-beginning-of-line)
(global-set-key (kbd "C-c r") 'query-replace)
(global-set-key (kbd "C-c R") 'query-replace-regexp)
(global-set-key (kbd "C-c s") 'solkaz/surround)
(global-set-key (kbd "C-c e") 'eshell)
(global-set-key (kbd "C-c d") 'solkaz/open-dotfiles)
(global-set-key (kbd "C-c l") 'list-packages)
(global-set-key (kbd "C-c p") 'pop-to-buffer)

(when window-system
  (progn
    (tool-bar-mode 0)
    (scroll-bar-mode -1)
    (horizontal-scroll-bar-mode -1)))

(setq backup-directory-alist `(("." . "~/.saves")))

(add-hook 'after-init-hook 'global-company-mode)
;; (add-to-list 'company-backends 'company-elm)

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(provide '.emacs)
