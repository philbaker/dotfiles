(let ((local-settings "~/.emacs.local"))
  (if (file-exists-p local-settings)
  (load-file local-settings)))

;; .emacs.local
;; (setq user-emacs-directory "/path/to/.emacs.d") 
;; (setenv "HOME" "/home/me/")

(require 'package)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(set-face-attribute 'default nil :height 120)

(setq byte-compile-warnings '(cl-functions))
(winner-mode 1)

(use-package no-littering :ensure t)

(setq auto-save-file-name-transforms
  `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(use-package multi-term
  :ensure t)
(setq multi-term-program 
  (cond ((eq system-type 'gnu/linux)
		 "/bin/bash")
		((eq system-type 'darwin)
		 "/bin/zsh")))

(use-package org :ensure t)

(setq evil-want-keybinding nil)
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

(use-package evil-leader
  :ensure t
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key "cu" 'cider-pprint-eval-last-sexp-to-comment)
  (evil-leader/set-key "ou" 'delete-other-windows)
  (evil-leader/set-key "oh" 'winner-undo)
  (evil-leader/set-key "n" 'treemacs)
  (evil-leader/set-key "p" 'projectile-find-file)
  (evil-leader/set-key "a" 'helm-ag-project-root)
  (evil-leader/set-key "r" 'sh/term-send-line-or-region)
  (evil-leader/set-key "sd" 'skewer-eval-defun)
  (evil-leader/set-key "se" 'skewer-eval-defun-and-focus)
  (evil-leader/set-key "sr" 'skewer-eval-region)
  (evil-leader/set-key "sn" 'skewer-eval-region-and-focus)
  (evil-leader/set-key "sl" 'skewer-eval-last-expression)
  (evil-leader/set-key "sp" 'skewer-eval-print-last-expression))

(use-package evil-matchit :ensure t)
(global-evil-matchit-mode 1)

(use-package simple-httpd :ensure t)
(use-package js2-mode :ensure t)
(use-package skewer-mode :ensure t)
(use-package php-mode :ensure t)
(use-package web-mode :ensure t)
(use-package psysh :ensure t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))
(add-hook 'js2-mode-hook 'skewer-mode)
(add-hook 'css-mode-hook 'skewer-css-mode)
(add-hook 'html-mode-hook 'skewer-html-mode)

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil)
  :hook ((clojure-mode . lsp)
         (js2-mode . lsp)
         (css-mode . lsp)
         (web-mode . lsp)
         (html-mode . lsp)
         (php-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :ensure t :commands lsp-ui-mode)
(setq lsp-ui-doc-enable nil
      lsp-ui-sideline-enable nil)
      
(use-package helm-lsp :ensure t :commands helm-lsp-workspace-symbol)

(use-package lsp-tailwindcss
  :ensure t
  :custom
  (lsp-tailwindcss-add-on-mode t))

(use-package which-key
    :ensure t
    :config
    (which-key-mode))

(use-package prettier
  :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(defun sh/term ()
  "calls ansi term that behaves like shell mode"
  (interactive)
  (split-window-sensibly)
  (cond ((eq system-type 'gnu/linux)
		 (ansi-term "/bin/bash"))
		((eq system-type 'darwin)
		 (ansi-term "/bin/zsh")))
  (sh/term-toggle-mode)
  (other-window 1))

(require 'term)

(defun sh/term-toggle-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

;; send line or region to ansi-term
(defun sh/term-send-line-or-region (&optional step)
  "send the line or the region to a term buffer"
  (interactive)
  (let ((proc (get-process "*ansi-term*"))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (sh/term)
        (switch-to-buffer currbuff)
        (setq proc (get-process "*ansi-term*"))))
    (setq pbuff (process-buffer proc))
    (if (use-region-p)
        (setq min (region-beginning)
              max (region-end))
      (setq min (point-at-bol)
            max (point-at-eol)))
    (setq command (concat (buffer-substring min max) "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point))) ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step
      (goto-char max)
      (next-line))))

;; send command to shell
(defun sh/term-command (arg &optional step)
  (interactive
   (list
	(read-string "Enter the command to send: ")))
  (let ((proc (get-process "*ansi-term*"))
        pbuf min max command)
    (unless proc
      (let ((currbuff (current-buffer)))
        (sh/term)
        (switch-to-buffer currbuff)
        (setq proc (get-process "*ansi-term*"))))
    (setq pbuff (process-buffer proc))
	(setq command (concat arg "\n"))
    (with-current-buffer pbuff
      (goto-char (process-mark proc))
      (insert command)
      (move-marker (process-mark proc) (point))) ;;pop-to-buffer does not work with save-current-buffer -- bug?
    (process-send-string  proc command)
    (display-buffer (process-buffer proc) t)
    (when step
      (goto-char max)
      (next-line))))

(defun sh/term-send-line-or-region-and-step ()
  (interactive)
  (sh/term-send-line-or-region t))

(defun sh/term-switch-to-process-buffer ()
  (interactive)
  (pop-to-buffer (process-buffer (get-process "*ansi-term*")) t))

(defun skewer-eval-defun-and-focus ()
  "Execute function at point in browser and switch to REPL in insert state."
  (interactive)
  (skewer-eval-defun)
  (skewer-repl)
  (evil-insert-state))

(defun skewer-eval-region (beg end)
  "Execute the region as JavaScript code in the attached browser."
  (interactive "r")
  (skewer-eval (buffer-substring beg end) #'skewer-post-minibuffer))

(defun skewer-eval-region-and-focus (beg end)
  "Execute the region in browser and swith to REPL in insert state."
  (interactive "r")
  (skewer-eval-region beg end)
  (skewer-repl)
  (evil-insert-state))

(use-package undo-tree
  :ensure t
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

; Persistent undo
(use-package undo-fu :ensure t)
(use-package undo-fu-session :ensure t)
(global-undo-fu-session-mode)

(use-package workgroups
  :ensure t
  :config
  (workgroups-mode 1))

(use-package clojure-mode :ensure t)
(use-package cider :ensure t)

;; Remove initial buffer, set index file
(setq inhibit-startup-message t)

;; Hide Scroll bar,menu bar, tool bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Line numbering
(global-display-line-numbers-mode)

;; Keybindings
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package dracula-theme
   :config
   (load-theme 'dracula t)
   :ensure t)

(when (eq system-type 'darwin)
  (setq visible-bell nil)
  (setq ring-bell-function 'ignore)
  (set-face-attribute 'default nil :family "Fira Code")
  (set-face-attribute 'default nil :height 165)
  (set-fontset-font t 'hangul (font-spec :name "NanumGothicCoding")))

(use-package which-key
  :config 
    (setq which-key-idle-delay 0.3)
    (setq which-key-popup-type 'frame)
    (which-key-mode)
    (which-key-setup-minibuffer)
    (set-face-attribute 'which-key-local-map-description-face nil 
       :weight 'bold)
  :ensure t)

(use-package projectile
  :ensure t)

(use-package helm
  :init
    (require 'helm-config)
    (setq helm-split-window-in-side-p t
          helm-move-to-line-cycle-in-source t)
  :config 
    (helm-mode 1) ;; Most of Emacs prompts become helm-enabled
    (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
    (global-set-key (kbd "C-x b") 'helm-buffers-list) ;; List buffers ( Emacs way )
    (define-key evil-ex-map "b" 'helm-buffers-list) ;; List buffers ( Vim way )
    (global-set-key (kbd "C-x r b") 'helm-bookmarks) ;; Bookmarks menu
    (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
    (global-set-key (kbd "M-c") 'helm-calcul-expression) ;; Use Helm for calculations
    (global-set-key (kbd "C-s") 'helm-occur)  ;; Replaces the default isearch keybinding
    (global-set-key (kbd "C-h a") 'helm-apropos)  ;; Helmized apropos interface
    (global-set-key (kbd "M-x") 'helm-M-x)  ;; Improved M-x menu
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)  ;; Show kill ring, pick something to paste
  :ensure t)

(use-package helm-ag
  :ensure t)

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package magit :ensure t)
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") 'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-deferred-git-apply-delay   0.5
          treemacs-display-in-side-window     t
          treemacs-file-event-delay           5000
          treemacs-file-follow-delay          0.2
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-git-command-pipe           ""
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-max-git-entries            5000
          treemacs-no-png-images              nil
          treemacs-no-delete-other-windows    t
          treemacs-project-follow-cleanup     nil
          treemacs-persist-file               (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-cursor                nil
          treemacs-show-hidden-files          nil
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-space-between-root-nodes   t
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-position                   'right
          treemacs-width                      25)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package auto-complete
  :ensure t
  :config 
  (ac-config-default))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
  '(package-selected-packages
     '(lsp-mode markdown-mode emmet-mode auto-complete treemacs-projectile treemacs-evil treemacs elpy flycheck magit company helm which-key try dracula-theme cider clojure-mode psysh php-mode skewer-mode js2-mode simple-httpd evil-leader evil use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
