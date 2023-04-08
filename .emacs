;; Vishnu
;; Date: 2022-12-12
;; My .emacs

(setq inhibit-startup-message t)

;; disable bell sound
(setq ring-bell-function 'ignore)

;; always show line numbers
(global-linum-mode 1)

;; https://cestlaz.github.io/posts/using-emacs-1-setup/
;; Add repository.
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
	     :ensure t)

(use-package which-key
	     :ensure t
	     :config
	     (which-key-mode))

;; https://www.emacswiki.org/emacs/WindMove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; https://cestlaz.github.io/posts/using-emacs-4-buffers/
;; https://www.masteringemacs.org/article/introduction-to-ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default
;(defalias 'list-buffers 'ibuffer-other-window) ; make ibuffer default

;; display line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; To use ssh in windows os
(setq explicit-shell-file-name "/bin/bash")
(setq tramp-default-mode "ssh")

;; https://cestlaz.github.io/posts/using-emacs-2-org/
(use-package org-bullets
:ensure t
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; https://cestlaz.github.io/posts/using-emacs-3-elisp/
(tool-bar-mode -1)
