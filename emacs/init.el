;; Initial setup
(let ((local-settings "~/.emacs.local"))
  (if (file-exists-p local-settings)
    (load-file local-settings)))
; .emacs.local
; (setq user-emacs-directory "/path/to/.emacs.d")
; (setenv "HOME" "/home/me/")
; (setq custom-file (concat user-emacs-directory "/custom.el"))

(require 'package)
(setq use-package-always-ensure t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

; Remove initial buffer, set index file
(setq inhibit-startup-message t)

; Disable sound
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; Visual tweaks
(blink-cursor-mode 0)

; Fonts
(set-face-attribute 'fixed-pitch nil :font "Fira Code" :height 120)
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 115 :weight 'regular)
(when (eq system-type 'gnu/linux)
  (set-face-attribute 'default nil :height 150 :family "Fira Code"))
(when (eq system-type 'darwin)
  (set-face-attribute 'fixed-pitch nil :family "Fira Code" :height 165)
  (set-face-attribute 'variable-pitch nil :font "Cantarell" :height 165 :weight 'regular)
  (set-face-attribute 'default nil :height 165))
(setq-default line-spacing 0.4)

; Stop showing % in terminal session
(setq term-suppress-hard-newline t)

; Ensure git branch in mode line is up to date
(setq auto-revert-check-vc-info t)

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

; Line numbering
(global-display-line-numbers-mode)

; Hide Scroll bar, menu bar and tool bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Windows
; Remember window layout to enable :only
(winner-mode 1)

; Don't add temp files to project directory
(use-package no-littering)

(setq auto-save-file-name-transforms
  `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

;; Evil mode
(setq evil-want-keybinding nil)
(setq evil-want-C-i-jump nil)

(use-package evil
  :config
  (evil-mode 1))

; Vim keybindings
(use-package evil-leader
  :after evil
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key "cu" 'cider-pprint-eval-defun-to-comment)
  (evil-leader/set-key "cd" 'cider-pprint-eval-last-sexp-to-comment)
  (evil-leader/set-key "ce" 'cider-eval-last-sexp)
  (evil-leader/set-key "ou" 'delete-other-windows)
  (evil-leader/set-key "oh" 'winner-undo)
  (evil-leader/set-key "n" 'treemacs)
  (evil-leader/set-key "t" 'projectile-find-file)
  (evil-leader/set-key "a" 'helm-ag-project-root)
  (evil-leader/set-key "r" 'sh/term-send-line-or-region)
  (evil-leader/set-key "or" 'scroll-repl-top)
  (evil-leader/set-key "hd" 'skewer-eval-defun)
  (evil-leader/set-key "he" 'skewer-eval-defun-and-focus)
  (evil-leader/set-key "hr" 'skewer-eval-region)
  (evil-leader/set-key "hn" 'skewer-eval-region-and-focus)
  (evil-leader/set-key "hl" 'skewer-eval-last-expression)
  (evil-leader/set-key "hp" 'skewer-eval-print-last-expression)
  (evil-leader/set-key "s" 'save-buffer)
  (evil-leader/set-key "u" 'evil-switch-to-windows-last-buffer)
  (evil-leader/set-key "." 'helm-buffers-list)
  (evil-leader/set-key "ii" (lambda () (interactive) (find-file "~/dotfiles/emacs/init.el")))
  (evil-leader/set-key "it" (lambda () (interactive) (find-file "~/notes/tasks.org"))))

(use-package evil-matchit)

(global-evil-matchit-mode 1)

; Make escape more vim-like
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; Vim-commentary
(use-package evil-commentary)
(evil-commentary-mode)
(fset 'scroll-repl-top
   (kmacro-lambda-form [?\C-w ?l ?G ?z ?t ?\C-w ?h] 0 "%d"))

;; Language config
(use-package clojure-mode)
(use-package cider)
(use-package editorconfig
  :config
  (editorconfig-mode 1))
(use-package smartparens)
(require 'smartparens-config)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(use-package evil-cleverparens)
(add-hook 'clojure-mode-hook #'evil-cleverparens-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-cleverparens-mode)
(global-display-fill-column-indicator-mode)
(set-face-foreground 'fill-column-indicator "#373844")

;; Syntax
(use-package web-mode
  :commands (web-mode)
  :init
  (add-to-list 'auto-mode-alist '("\\.blade.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  :config
  (setq web-mode-engines-alist
    '(("php"    . "\\.phtml\\'")
       ("blade"  . "\\.blade\\."))))

;; LSP config
(use-package lsp-mode
  :commands lsp
  :diminish lsp-mode
  :hook ((clojure-mode . lsp)
          (lsp-mode . lsp-enable-which-key-integration))
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui
  :commands lsp-ui-mode)
(setq lsp-ui-doc-enable nil
  lsp-ui-sideline-enable nil)
(use-package helm-lsp
  :commands helm-lsp-workspace-symbol)

;; REPL config
(use-package simple-httpd)

(require 'term)
(defun sh/term-toggle-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
    (term-char-mode)
    (term-line-mode)))

(defun skewer-eval-defun-and-focus ()
  "Execute function at point in browser and switch to REPL in insert state"
  (interactive)
  (skewer-eval-defun)
  (skewer-repl)
  (evil-insert-state))

(defun skewer-eval-region (beg end)
  "Execute the region as JavaScript code in the attached browser"
  (interactive "r")
  (skewer-eval (buffer-substring beg end) #'skewer-post-minibuffer))

(defun skewer-eval-region-and-focus (beg end)
  "Execute the region in browser and swith to REPL in insert state."
  (interactive "r")
  (skewer-eval-region beg end)
  (skewer-repl)
  (evil-insert-state))

(use-package undo-tree
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

; Persistent undo
(use-package undo-fu)
(use-package undo-fu-session)
(global-undo-fu-session-mode)

;; Menus and completion
(use-package which-key
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 0.3))
(use-package which-key
  :config 
  (setq which-key-idle-delay 0.3)
  (setq which-key-popup-type 'frame)
  (which-key-mode)
  (which-key-setup-minibuffer)
  (set-face-attribute 'which-key-local-map-description-face nil 
    :weight 'bold))
(use-package helm
  :init
  (require 'helm-config)
  (setq helm-split-window-in-side-p t
    helm-move-to-line-cycle-in-source t)
  :config 
  (helm-mode 1) ; Most of Emacs prompts become helm-enabled
  (helm-autoresize-mode 1) ; Helm resizes according to the number of candidates
  (global-set-key (kbd "C-x b") 'helm-buffers-list) ; List buffers (Emacs way)
  (define-key evil-ex-map "b" 'helm-buffers-list) ; List buffers (Vim way)
  (global-set-key (kbd "C-x r b") 'helm-bookmarks) ; Bookmarks menu
  (global-set-key (kbd "C-x C-f") 'helm-find-files) ; Finding files with Helm
  (global-set-key (kbd "M-c") 'helm-calcul-expression) ; Use Helm for calculations
  (global-set-key (kbd "C-s") 'helm-occur)  ; Replaces the default isearch keybinding
  (global-set-key (kbd "C-h a") 'helm-apropos) ; Helmized apropos interface
  (global-set-key (kbd "M-x") 'helm-M-x) ; Improved M-x menu
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)) ; Show kill ring, pick something to paste

; Similar to vim-vinegar
(define-key evil-normal-state-map (kbd "-") 'find-file)

(use-package helm-ag)
(use-package projectile)
(setq projectile-git-submodule-command "")
(use-package flycheck
  :init
  (global-flycheck-mode t))
(use-package company
  :config
  (global-company-mode))

;; Version control
(use-package magit)

;; Navigation
(use-package treemacs
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
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-space-between-root-nodes   t
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-position                   'right
          treemacs-width                      35)

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
  :after treemacs evil)
(use-package treemacs-projectile
  :after treemacs projectile)

;; Help
(use-package helpful)
(global-set-key (kbd "C-h f") #'helpful-callable)
(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)
(global-set-key (kbd "C-c C-d") #'helpful-at-point)
(global-set-key (kbd "C-h F") #'helpful-function)
(global-set-key (kbd "C-h C") #'helpful-command)

;; Org mode

(use-package org
  :config
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-files '("~/notes/tasks.org" "~/notes/ob.org" "~/notes/bd.org" "~/orgfiles/tasks.org"))
  (setq org-todo-keywords
    '((sequence "REPEAT(r)" "TODO(t)" "NEXT(n)" "ACTIVE(a)" "C REVIEW(o)" "S REVIEW(e)" "REVIEW(l)" "WAITING(w@/!)" "SOMEDAY(s)" "PROJ(p)" "|" "DONE(d)" "CANCELLED(c@)")))
  (setq org-todo-keyword-faces
    '(("REPEAT" . "white") 
       ("TODO" . "white")
       ("NEXT" . "pink")
       ("ACTIVE" . "yellow")
       ("C REVIEW" . "orange")
       ("S REVIEW" . "orange")
       ("REVIEW" . "orange")
       ("WAITING" . "orange")
       ("SOMEDAY" . "salmon")
       ("PROJ" . "teal")
       ("DONE" . "green")
       ("CANCELLED" . "red")))
  (setq org-refile-targets
    '(("archive.org" :maxlevel . 1)
       ("tasks.org" :maxlevel . 1)))

  ;; Configure custom agenda views
  (setq org-agenda-custom-commands
    '(("d" "Dashboard"
        ((agenda "" ((org-deadline-warning-days 7)))
          (todo "NEXT"
            ((org-agenda-overriding-header "Next Tasks")))
          (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))
       ("n" "Next Tasks"
         ((todo "NEXT"
            ((org-agenda-overriding-header "Next Tasks")))))
       ("W" "Work Tasks" tags-todo "+work-email")
       ;; Low-effort next actions
       ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
         ((org-agenda-overriding-header "Low Effort Tasks")
           (org-agenda-max-todos 20)
           (org-agenda-files org-agenda-files)))
       ("w" "Workflow Status"
         ((todo "WAITING"
            ((org-agenda-overriding-header "Waiting on External")
              (org-agenda-files org-agenda-files)))
           (todo "ACTIVE"
             ((org-agenda-overriding-header "Active Projects")
               (org-agenda-files org-agenda-files)))
           (todo "REVIEW"
             ((org-agenda-overriding-header "Waiting for code review")
               (org-agenda-files org-agenda-files)))
           (todo "COMPLETED"
             ((org-agenda-overriding-header "Completed Projects")
               (org-agenda-files org-agenda-files)))
           (todo "CANCELLED"
             ((org-agenda-overriding-header "Cancelled Projects")
               (org-agenda-files org-agenda-files)))))))

  (setq org-capture-templates
    `(("t" "Task" entry (file+olp "~/notes/tasks.org" "Inbox")
        "* TODO %?\n  %U\n %i")
       ("m" "Meeting" entry
         (file+olp "~/notes/tasks.org" "Meetings")
         "* %<%e/%m/%g> %<%H:%M> :meetings:\n%?"
         :empty-lines 1))))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-tags-exclude-from-inheritance '("crypt"))
(setq org-crypt-key nil)
(setq auto-save-default nil)

(use-package org-pomodoro)
(setq org-pomodoro-manual-break t
  org-pomodoro-keep-killed-pomodoro-time t
  org-pomodoro-play-sounds nil)
(setq org-agenda-clockreport-parameter-plist 
 '(:fileskip0 t :link t :maxlevel 2 :formula "$4=($2+$3)*(60/25);t"))
(org-babel-do-load-languages
  'org-babel-load-languages
  '((emacs-lisp . t)
     (js . t)
     (clojure . t)
     (css . t)
     (sql . t)))
(setq org-confirm-babel-evaluate nil)
(require 'ob-clojure)
(require 'cider)
(setq org-babel-clojure-backend 'cider)
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("clj" . "src clojure"))
(add-to-list 'org-structure-template-alist '("js" . "src js"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(defun org-font-setup ()
  ;; Replace list hyphen with dot
  (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; Set faces for heading levels
  (dolist (face '((org-level-1 . 1.5)
                  (org-level-2 . 1.3)
                  (org-level-3 . 1.1)
                  (org-level-4 . 1.1)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

  ;; Ensure that anything that should be fixed-pitch in Org files appears that way
  (set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
  (set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  (set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
  (set-face-attribute 'line-number nil :inherit 'fixed-pitch)
  (set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch))

(org-font-setup)

;; Set org code block background colour
(require 'color)
(set-face-attribute 'org-block nil :background
  (color-darken-name (face-attribute 'default :background) 2))
(set-face-attribute 'org-block-end-line nil :background
  (color-darken-name (face-attribute 'default :background) 2))
(set-face-attribute 'org-block-begin-line nil :background
  (color-darken-name (face-attribute 'default :background) 2))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/rotes/")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode))

; Better terminal integration
(use-package vterm
  :ensure t)

(org-indent-mode t)
