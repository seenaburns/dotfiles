(provide 'general)

;; ------------------------------------------------------------
;;                  General Editting
;; ------------------------------------------------------------

; Display line number
(global-linum-mode 1)

; Delete selected text when typing
(delete-selection-mode 1)

; Emacs package system
; http://ergoemacs.org/emacs/emacs_package_system.html
; Auto insert/delete pairs
; autopair

; Parentheses (highlight match + entire bracket)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

; Tabs (spaces)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

; ido
(require 'ido)
(ido-mode t)

;; ------------------------------------------------------------
;;                   Handling Backups
;; ------------------------------------------------------------
; Save backups to .emacs.d
(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(setq backup-directory-alist (list (cons ".*" backup-dir)))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

; turn off autosave
(setq auto-save-default nil)
; turn off session saving
(setq auto-save-list-file-prefixnil)

; (setq auto-save-list-file-prefix backup-dir)
; (setq auto-save-file-name-transforms `((".*" ,backup-dir t)))

;; ------------------------------------------------------------
;;                    Org Mode Settings
;; ------------------------------------------------------------

; Map shift tab to backtab
(add-hook 'term-setup-hook
          (lambda () (define-key input-decode-map "\e[Z" [backtab])))
(define-key function-key-map [S-tab] [backtab])

;; ORG MODE Settings (Global keys)
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
; (global-set-key "\C-cl" 'org-store-link)
 (global-set-key "\C-ca" 'org-agenda)
; (setq org-agenda-skip-scheduled-if-done 'true)
(custom-set-variables
 '(org-agenda-files (quote ("~/Dropbox/Notes/todo.org"))))
(custom-set-faces
 )