;; $ brew install racket
;; $ yes | raco pkg install drracket
(require-package 'racket-mode)
(require 'racket-mode)

(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))
(provide 'init-racket)
