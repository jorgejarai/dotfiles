(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Keep customize settings in a separate file
(setq custom-file "~/.emacs.d/custom.el")

;; Personal information
(setq user-full-name "Jorge Jara"
      user-mail-address "jorgejarainostroza@gmail.com")

;; Remove toolbars and such
(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)

;; Show matching parentheses
(show-paren-mode 1)

;; Show line numbers
(global-display-line-numbers-mode)

;; Set font
(setq default-frame-alist '((font . "IBM Plex Mono-10")))

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; Theme
(load-theme 'tangotango t)

;; Emojify
(add-hook 'after-init-hook #'global-emojify-mode)

;; diff-hl
(global-diff-hl-mode)
(add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; Indentation
(setq-default c-basic-offset 4
	      c-default-style "java")
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Company
(require 'company)

(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
(company-tng-configure-default)
(setq company-global-modes '(not org-mode))

;; irony-mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode) ; I've never used Objective-C, but it doesn't hurt to have this

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'flycheck-mode-hook 'flycheck-irony-setup)
(add-hook 'irony-mode-hook 'irony-eldoc)

;; ido
(require 'ido)
(ido-mode t)
(ido-everywhere t)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; cmake-ide
(require 'rtags)
(cmake-ide-setup)

;; Flycheck
(global-flycheck-mode)

;; Multiple cursors
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

;; Emmet
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)

;; dumb-jump
(dumb-jump-mode)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)
(setq vc-follow-symlinks nil)

;; Neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Org
(require 'org)

(setq org-directory "~/org/")

(setq org-todo-keywords
      '((sequence "TODO" "WAIT" "|" "DONE" "WONT")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
	("WAIT" . "yellow")
	("DONE" . "green")
	("WONT" . "red")))

(setq org-archive-location (concat ".archive/archive-"
				   (format-time-string "%Y%m" (current-time))
				   ".org_archive::"))

(setq org-log-done 'time)

(add-hook 'org-mode-hook 'org-indent-mode)

;; Texfrag
(texfrag-global-mode)

;; Disable ThinkPad back and forward keys
(global-unset-key (kbd "<XF86Back>"))
(global-unset-key (kbd "<XF86Forward>"))

;; ws-butler (for deleting trailing whitespace)
(require 'ws-butler)
(add-hook 'prog-mode-hook #'ws-butler-mode)
