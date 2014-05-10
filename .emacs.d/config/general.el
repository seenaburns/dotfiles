(provide 'general)

;; ------------------------------------------------------------
;;                   Package Manager
;; ------------------------------------------------------------
; Custom installed packages
(add-to-list 'load-path "~/.emacs.d/bin/")

;; For emacs23 load package.el
(if (= emacs-major-version 24)
    (load "package")
)

(require 'package)
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))
; list-packages to find packages

; Require packages

; Autopairs
(require 'autopair)
(autopair-global-mode 1)

(require 'auto-complete)
(global-auto-complete-mode t)

;; ------------------------------------------------------------
;;                  General Editting
;; ------------------------------------------------------------
; Display line number
(global-linum-mode 1)

; Delete selected text when typing
(delete-selection-mode 1)

; Parentheses
; (highlight match + entire bracket)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)


; Tabs (spaces)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

; ido
(require 'ido)
(ido-mode t)
(custom-set-variables
 '(ido-enable-last-directory-history nil)
 '(ido-record-commands nil)
 '(ido-max-work-directory-list 0)
 '(ido-max-work-file-list 0))

; tramp mode for remote files
(require 'tramp)
(setq tramp-default-method "scp")

; Set mode for certain filetypes
(add-to-list 'auto-mode-alist '("\\.pde\\'" . java-mode))

; If haskell-mode
;   enable unicode
;   enable indent
(when (require 'haskell-mode nil 'noerror)
  (setq haskell-font-lock-symbols t)
  (add-hook 'haskell-mode-hook 'turn-on-haskell-indent))

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
;; Custom Set List
;; ------------------------------------------------------------
;; Move private custom set list to separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Don't save ido history to ~/.ido.last
(setq ido-enable-last-directory-history nil)
(setq ido-max-work-file-list 0)
(setq ido-max-work-directory-list 0)
(setq ido-record-commands nil)

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
