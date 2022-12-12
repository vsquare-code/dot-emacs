;; Vishnu
;; Date: 2022-12-12
;; My .emacs

;; Add repository.
(when (>= emacs-major-version 24)
  (progn
    ;; load emacs 24's package system. Add MELPA repository.
    (require 'package)
    (add-to-list
     'package-archives
     '("melpa" . "https://melpa.org/packages/")
     t))

  (when (< emacs-major-version 27) (package-initialize)))

;; https://www.emacswiki.org/emacs/WindMove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; https://www.masteringemacs.org/article/introduction-to-ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; display line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
