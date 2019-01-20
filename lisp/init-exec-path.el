(require-package 'exec-path-from-shell)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; PATH Style
;; export PATH=/usr/local/bin:/usr/bin:/bin ((´ ω `♡))
;; instead of
;; export PATH=/usr/local/bin:$PATH (WRONG!!!)

;; I use fish shell
(add-to-list 'exec-path "/Users/shawn/.pyenv/shims")

(provide 'init-exec-path)
