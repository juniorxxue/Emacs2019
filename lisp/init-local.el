;; more beautiful
(set-frame-font "Source Code Pro 15" nil t)

(require-package 'doom-themes)

(load-theme 'doom-tomorrow-night t)

(require-package 'doom-modeline)
(require 'doom-modeline)
(doom-modeline-init)

;; auto save
(require-package 'super-save)
(require 'super-save)
(super-save-mode +1)

(provide 'init-local)
