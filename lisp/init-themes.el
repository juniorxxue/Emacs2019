(require-package 'doom-themes)
(require 'doom-themes)
;; (load-theme 'doom-tomorrow-night t)


;; (load "/Users/xuexu/Desktop/doom-xcode-dark-theme/doom-xcode-dark-theme.el")
;; Global settings (defaults)
(setq doom-themes-enable-bold t ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(load-theme 'doom-one t)
;; (load-theme 'doom-xcode-dark t)


(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.15)
  (add-hook 'after-init-hook 'dimmer-mode)
  ;; TODO: file upstream as a PR
  (after-load 'dimmer
    (advice-add 'frame-set-background-mode :after (lambda (&rest args) (dimmer-process-all)))))


(require-package 'doom-modeline)
(require 'doom-modeline)
(doom-modeline-init)

(provide 'init-themes)
