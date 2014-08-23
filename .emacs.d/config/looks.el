(provide 'looks)

;; ------------------------------------------------------------
;;                   Header line format
;; ------------------------------------------------------------
; Header line colors
(set-face-attribute 'header-line nil
    :foreground "white"
    :background "yellow"
    :underline nil)
; Set default to be emacs with version number
(setq-default default-header-line-format
    (list 
     '(" EMACS " emacs-version)
    )
)

; Menu bar (toolbar at top, remove)
(menu-bar-mode -1)

;; ------------------------------------------------------------
;;                     Mode-line format
;; ------------------------------------------------------------
; Mode line color (fore <-> back for some reason)
(set-face-attribute 'mode-line nil
    :foreground "yellow"
    :background "white")

(setq-default mode-line-format
    (list
     ;; Line number
     " %l:%c "
     ;; Mode name, shorten
     "(" '(:eval (upcase (short-mode-name mode-name))) ") "
     ;; Current buffer (note modified)
     "%b"
     '(:eval (cond ((buffer-modified-p) "*")
                   (t "-")))
     )
)

(defun short-mode-name (mode-name)
  "Map real mode name to a short (3 char) meaningful mode name."
  (let ((m (downcase mode-name)))
    (cond ((equal m "emacs-lisp") "lsp")
          ((equal m "fundamental") "fun")
          ((equal m "org") "org")
          (t mode-name)
    )
  )
)
