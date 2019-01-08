;; more beautiful
(set-frame-font "Source Code Pro 15" nil t)

(require-package 'doom-themes)

(load-theme 'doom-tomorrow-night t)

(require-package 'doom-modeline)
(require 'doom-modeline)
(doom-modeline-init)

;; for macbook-pro
(add-to-list 'exec-path "/usr/local/bin/")

;; auto save
(require-package 'super-save)
(require 'super-save)
(super-save-mode +1)

;; company
(setq company-idle-delay 0
      company-minimum-prefix-length 1)

;; highlight current line
(global-hl-line-mode 1)

;; display line number
;; (global-display-line-numbers-mode)

(require 'pixel-scroll)
(pixel-scroll-mode 1)

(provide 'init-local)
