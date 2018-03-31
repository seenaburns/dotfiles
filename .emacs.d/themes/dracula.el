;;; dracula.el
;;; Commentary:
;;; Code:
(setq basic-colors-alist
  '(("bg"      . "#282a36")
    ("fg"      . "#f8f8f2")
    ("gray1"   . "#44475a")
    ("gray2"   . "#6272a4")
    ("white"   . "#FFFFFF")
    ("red"     . "#ff5555")
    ("green"   . "#50fa7b")
    ("yellow"  . "#f1fa8c")
    ("blue"    . "#8be9fd") ; cyan
    ("magenta" . "#bd93f9")
    ("cyan"    . "#ff79c6") ; pink
    )
)

(load-theme 'basic t)

(provide 'dracula)
