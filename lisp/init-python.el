;;; Be sure to install
;; setuptools
;; autopep8
;; python-language-server
(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pyenv-mode)
(pyenv-mode)

(setenv "PYTHONPATH" "/Users/xuexu/.pyenv/shims/python")
(require-package 'pip-requirements)

;; (when (maybe-require-package 'anaconda-mode)
;;   (after-load 'python
;;     (add-hook 'python-mode-hook 'anaconda-mode)
;;     (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
;;   (when (maybe-require-package 'company-anaconda)
;;     (after-load 'company
;;       (after-load 'python
;;         (push 'company-anaconda company-backends)))))
(require-package 'lsp-mode)
(require 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'company-lsp)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(require 'company-lsp)
;; (require-package 'lsp-python)
(require 'lsp-clients)
(add-hook 'python-mode-hook 'lsp)



(require-package 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)



(provide 'init-python)
