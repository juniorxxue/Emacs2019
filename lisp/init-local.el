;; auto save
(require-package 'super-save)
(require 'super-save)
(super-save-mode +1)

;; highlight current line
(global-hl-line-mode 1)

;; display line number
;; (global-display-line-numbers-mode)

(require 'pixel-scroll)
(pixel-scroll-mode 1)

(provide 'init-local)
