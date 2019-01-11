(require-package 'doom-themes)
(load-theme 'doom-tomorrow-night t)

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
