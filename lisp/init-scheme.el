(set-variable (quote scheme-program-name) "chez")


(setq geiser-active-implementations '(chez))

(require-package 'geiser)
(setq geiser-chez-binary "/usr/local/bin/chez")

(provide 'init-scheme)
