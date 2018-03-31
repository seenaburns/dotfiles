;;; basic-theme.el --- Minimalistic light color theme

(deftheme basic "Minimalistic theme based on base16 colors.")

(defvar basic-colors-alist
  '(("bg"      . "#E9B9C2")
    ("fg"      . "#282828")
    ("gray1"   . "#383838")
    ("gray2"   . "#656CB8")
    ("white"   . "#FFFFFF")
    ("red"     . "#ff0000")
    ("green"   . "#00ff00")
    ("yellow"  . "#ffff00")
    ("blue"    . "#0000ff")
    ("magenta" . "#ff00ff")
    ("cyan"    . "#00ffff"))
  "List of base16 colors.")

(defmacro basic-with-color-variables (&rest body)
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))

                   basic-colors-alist))
     ,@body))

;;; Theme Faces
(basic-with-color-variables
  (custom-theme-set-faces
   'basic
   ; common
   `(default ((t (:foreground ,fg :background ,bg))))
   `(cursor ((t (:foreground nil :background ,blue))))
   `(linum  ((t (:foreground ,gray2 :background nil))))

   ; search higlighting

   `(isearch ((t (:foreground ,bg :background ,fg))))
   `(isearch-fail ((t (:foreground nil :background ,magenta))))
   `(lazy-highlight ((t (:foreground ,fg :background ,gray2))))

   ; Selection highlighting
   `(region ((t (:foreground ,bg :background ,fg))))
   `(secondary-selection ((t (:foreground nil :background ,gray1))))
   `(trailing-whitespace ((t (:foreground nil :background ,red))))

   ; Other
   `(minibuffer-prompt ((t (:foreground ,blue :background nil))))

   ; syntax highlighting
   `(font-lock-builtin-face           ((t :foreground nil :background nil)))
   `(font-lock-comment-delimiter-face ((t :foreground ,gray2 :background nil)))
   `(font-lock-comment-face           ((t :foreground ,gray2 :background nil)))
   `(font-lock-constant-face           ((,class (:foreground ,white :background nil :weight bold))))
   `(font-lock-doc-face               ((t :foreground ,gray2 :background nil)))
   `(font-lock-function-name-face     ((t :foreground ,magenta :background nil)))
   `(font-lock-keyword-face           ((t :foreground ,blue :background nil)))
   `(font-lock-negation-char-face     ((t :foreground nil :background nil)))
   `(font-lock-preprocessor-face      ((t :foreground nil :background nil)))
   `(font-lock-regexp-grouping-backslash ((t :foreground nil :background nil)))
   `(font-lock-regexp-grouping-construct ((t :foreground nil :background nil)))
   `(font-lock-string-face            ((t :foreground ,green :background nil)))
   `(font-lock-type-face              ((,class (:foreground ,white :background nil :weight bold))))
   `(font-lock-variable-name-face     ((t :foreground ,cyan :background nil)))
   `(font-lock-warning-face           ((t :foreground nil :background ,magenta)))

   ; default main section
   `(button ((t (:foreground ,blue :underline nil :weight normal))))
   `(comint-highlight-input ((t (:foreground nil :background nil))))
   `(comint-highlight-prompt ((t (:foreground nil :background nil))))

   `(compilation-line-number ((t (:foreground ,gray1 :background nil))))
   `(compilation-column-number ((t (:foreground ,gray1 :background nil))))
   `(compilation-debug ((t (:foreground ,yellow :background nil))))
   `(compilation-info ((t (:foreground ,yellow :background nil))))
   `(compilation-warning ((t (:foreground ,yellow :background nil))))
   `(compilation-error ((t (:foreground ,red :background nil))))
   `(compilation-mode-line-exit ((t (:inherit mode-line))))
   `(compilation-mode-line-fail ((t (:inherit mode-line))))
   `(compilation-mode-line-run ((t (:inherit mode-line))))

   ; term
   `(term-color-red ((t (:foreground ,red :background nil))))
   `(term-color-blue ((t (:foreground ,blue :background nil))))
   `(term-color-green ((t (:foreground ,green :background nil))))

   `(fringe ((t (:foreground ,gray1 :background ,bg))))
   `(header-line ((t (:inherit mode-line))))
   `(hi-yellow ((t (:foreground ,red :background ,nil))))
   `(italic ((t (:foreground nil :background nil :underline nil))))
   `(link ((t (:foreground nil :background nil :underline nil))))
   `(link-visited ((t (:foreground nil :background nil :underline nil))))
   `(match ((t (:foreground nil :background ,magenta))))
   ; `(mode-line ((t (:foreground ,gray1 :background ,gray1 :box nil))))
   ; `(mode-line-buffer-id ((t (:weight normal))))
   ; `(mode-line-inactive ((t (:inherit mode-line :box nil))))
   `(underline ((t (:foreground nil :background nil :underline t))))

   `(custom-face-tag ((t (:foreground nil :background nil))))
   `(custom-visibility ((t (:foreground ,blue :background nil))))
   `(custom-link ((t (:foreground ,blue :background nil))))

   ; `(company-tooltip ((t (:foreground ,fg :background nil))))
   ; `(company-scrollbar-bg ((t (:foreground ,fg :background nil))))
   ; `(company-scrollbar-fg ((t (:foreground ,fg :background nil))))
   ; `(company-tooltip-selection ((t (:foreground ,bg :background ,fg))))
   ; `(company-tooltip-common ((t (:foreground ,fg :background nil))))


   `(diff-added ((t (:foreground ,green :background nil))))
   `(diff-removed ((t (:foreground ,red :background nil))))
   `(diff-context ((t (:foreground ,fg :background nil))))
   `(diff-refine-added ((t :inherit diff-added :foreground nil :weight bold)))
   `(diff-refine-change ((t :inherit diff-changed :foreground nil :weight bold)))
   `(diff-refine-removed ((t :inherit diff-removed :foreground nil :weight bold)))
   `(diff-header ((t (:foreground ,fg :background nil))))
   `(diff-file-header ((t (:foreground ,fg :background nil))))
   `(diff-hunk-header ((t (:foreground ,fg :background nil))))

   ; git-gutter
   `(git-gutter:modified ((t (:foreground ,blue :background nil))))
   `(git-gutter:added ((t (:foreground ,green :background nil))))
   `(git-gutter:deleted ((t (:foreground ,red :background nil))))

   `(eldoc-highlight-function-argument ((t (:weight normal :foreground ,red :background nil))))

   `(eshell-prompt ((t (:foreground ,blue :background nil :weight normal))))
   `(eshell-ls-directory ((t (:foreground nil :background nil :weight normal))))
   `(eshell-ls-executable ((t (:foreground nil :background nil :weight normal))))

   `(helm-action ((t (:foreground ,fg :background nil :underline nil))))
   `(helm-candidate-number ((t (:foreground ,gray1 :background ,gray1))))
   `(helm-header ((t (:inherit mode-line))))
   `(helm-selection ((t (:foreground ,fg :background ,gray1 :underline nil))))
   `(helm-source-header ((t (:inherit default :foreground ,fg :background nil :underline nil :weight normal :family ,(face-attribute 'default :family) :height ,(face-attribute 'default :height)))))
   `(helm-buffer-file ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-buffer-directory ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-buffer-process ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-buffer-size ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-buffer-not-saved ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-ff-directory ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-ff-executable ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-ff-file ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-ff-invalid-symlink ((t (:foreground ,fg :background ,red :underline nil :italic nil))))
   `(helm-ff-prefix ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-ff-symlink ((t (:foreground ,fg :background nil :underline nil :italic nil))))
   `(helm-history-remote ((t (:foreground ,fg :background ,magenta :underline nil :italic nil))))
   `(helm-history-deleted ((t (:foreground ,fg :background ,red :underline nil :italic nil))))
   `(helm-visible-mark ((t (:foreground ,fg :background ,yellow :underline nil :italic nil))))
   `(helm-separator ((t (:foreground ,gray1 :background nil :underline nil :italic nil))))
   `(helm-prefarg ((t (:foreground ,red :background nil :underline nil :italic nil))))
   `(helm-M-x-key ((t (:foreground ,blue :background nil :underline nil :italic nil))))


   `(rng-error ((t (:foreground nil :background ,magenta))))

   `(show-paren-match ((t (:foreground ,bg :background ,fg))))
   `(show-paren-mismatch ((t (:foreground nil :background ,red))))

   `(shr-link ((t (:foreground ,blue :background nil :weight normal :underline nil))))
   `(shr-strike-through ((t (:foreground nil :background nil :weight normal :strike-through t))))

   `(wgrep-face ((t (:foreground ,green :background nil))))
   `(wgrep-done-face ((t (:foreground ,fg :background nil))))

   `(spaceline-highlight-face ((t (:foreground ,fg :background ,gray2))))
   `(spaceline-evil-normal    ((t (:foreground ,fg :background ,gray2))))
   `(spaceline-evil-insert    ((t (:foreground ,fg :background ,magenta))))
   `(spaceline-evil-emacs     ((t (:foreground ,fg :background ,magenta))))
   `(spaceline-evil-replace   ((t (:foreground ,fg :background ,magenta))))
   `(spaceline-evil-visual    ((t (:foreground ,fg :background ,magenta))))
   `(spaceline-evil-motion    ((t (:foreground ,fg :background ,magenta))))
   `(spaceline-unmodified     ((t (:foreground ,fg :background ,magenta))))
   `(spaceline-modified       ((t (:foreground ,fg :background ,green))))
   `(spaceline-read-only      ((t (:foreground ,fg :background ,gray2))))
   `(powerline-active1        ((t (:foreground ,bg :background ,fg))))
   `(powerline-inactive1      ((t (:foreground ,fg :background ,gray2))))
   `(mode-line                ((t (:foreground ,bg :background ,fg))))
   `(mode-line-inactive       ((t (:foreground ,fg :background ,gray2))))
   `(powerline-active2        ((t (:foreground ,bg :backgr () ound ,fg))))
   `(powerline-inactive2      ((t (:foreground ,fg :background ,gray2))))
   ))

; (basic-with-color-variables
;   (custom-theme-set-variables
;    'basic
;    `(ansi-color-names-vector [
; 			      (,fg . ,gray1)
; 			      (,red . ,magenta)
; 			      (,green . ,gray2)
; 			      (,yellow . ,gray2)
; 			      (,blue . ,gray3)
; 			      (,purple . ,gray4)
; 			      (,turquoise . ,gray5)
; 			      (,bg . ,bg)
; 			      ])
;    `(vc-annotate-very-old-color ,gray3)
;    `(vc-annotate-background ,bg)
;    `(vc-annotate-color-map
;      '((20 . ,red)
;        (50 . ,magenta)
;        (80 . ,yellow)
;        (110 . ,green)
;        (140 . ,turquoise)
;        (170 . ,blue)
;        (200 . ,purple)
;        (230 . ,brown)
;        (260 . ,fg)
;        (290 . ,gray1)
;        (320 . ,gray2)
;        (350 . ,gray3)))
;    ))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'basic)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; End:
;;; basic-theme.el ends here
