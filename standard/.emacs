;; General
; Match parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)
; Tabs
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; Handling backups
(setq backup-directory-alist `(("." . "~/.emacs.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Include shift tab
(add-hook 'term-setup-hook
          (lambda () (define-key input-decode-map "\e[Z" [backtab])))
(define-key function-key-map [S-tab] [backtab])

;; ORG MODE Settings (Global keys)
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
; (global-set-key "\C-cl" 'org-store-link)
 (global-set-key "\C-ca" 'org-agenda)
; (global-set-key "\C-cb" 'org-iswitchb)
; (setq org-log-done 'time) ; close with timestamp
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Desktop/todo.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
