(require 'package)
(package-initialize)
(require 'use-package)

;; Aesthetics
(add-to-list 'default-frame-alist
             '(font . "Fira Mono-12"))
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

; General settings
(show-paren-mode t)    ; show paren match
(electric-pair-mode 1) ; brace matching
(setq-default indent-tabs-mode nil) ; disable tabs
(setq-default show-trailing-whitespace t)

; Load path
(add-to-list 'load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/custom/")
(use-package local)

; Theme
(use-package newtheme)
(load-theme 'basic t)

; Fill
(setq-default fill-column 100)
(setq comment-auto-fill-only-comments t)
(auto-fill-mode t)

(use-package company
  :init
  (setq company-idle-delay 0.1)
  :config
  (global-company-mode)
  (setq company-dabbrev-downcase nil)
  )

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package linum
  :config
  (global-linum-mode 1))

(use-package recentf
  :config
  (recentf-mode 1)
  (setq recentf-max-menu-items 200)
  )

(defun evil-keyboard-quit ()
  "Keyboard quit and force normal state."
  (interactive)
  (and evil-mode (evil-force-normal-state))
  (keyboard-quit))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (setq x-select-enable-clipboard nil)
  (bind-keys :map evil-normal-state-map (", s" . split-window-below)
             :map evil-normal-state-map (", d" . split-window-right)
             :map evil-normal-state-map (", w" . other-window)
             :map evil-normal-state-map (", x" . delete-window)
             :map evil-insert-state-map ("s-v" . clipboard-yank)
             :map evil-normal-state-map ("s-c" . clipboard-kill-ring-save)
             :map evil-normal-state-map ("C-g" . evil-keyboard-quit)
             :map evil-insert-state-map ("C-g" . evil-keyboard-quit)
             :map evil-motion-state-map ("C-g" . evil-keyboard-quit)
             :map evil-visual-state-map ("C-g" . evil-keyboard-quit)
             :map evil-window-map ("C-g" . evil-keyboard-quit)
             :map evil-operator-state-map ("C-g" . evil-keyboard-quit)
             :map evil-visual-state-map ("g c" . comment-dwim)
             :map evil-normal-state-map (", c" . recompile)
             :map evil-normal-state-map (", n" . next-error)
             )
  )

(use-package spaceline-config
  :config
  (spaceline-define-segment buffer-id
    (if (buffer-file-name)
        (buffer-file-name)
        (powerline-buffer-id)))
  )
  (spaceline-spacemacs-theme)

(use-package ido
  :after (evil)
  :init
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  ; :bind (:map evil-normal-state-map (", b" . ido-switch-buffer))
  :config
  (ido-mode 1)
  ; Display ido results vertically, rather than horizontally
  (setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
)

(use-package fzf
  ; :config (setenv "PATH" "")
  :config
  :bind (:map evil-normal-state-map (", b" . fzf-switch-buffer)
         :map evil-normal-state-map (", v" . fzf-find-file)
         :map evil-normal-state-map (", V" . fzf-recentf)
         :map evil-normal-state-map (", /" . fzf-ripgrep))
  )

(use-package projectile
  :after (evil)
  :bind (:map evil-normal-state-map (", l" . projectile-switch-project))
         ;; :map evil-normal-state-map (", v" . projectile-find-file))
  :config
  (projectile-global-mode 1))

(use-package go-mode)
(use-package nix-mode)

(use-package git-gutter
  :config
  (global-git-gutter-mode +1)
  (git-gutter:linum-setup)
  )

(setq create-lockfiles nil) ; don't create lockfile symlinks (hopefully no regrets)
(setq
 backup-by-copying t
 backup-directory-alist '(("." . "~/.emacs.d/backup"))
)
