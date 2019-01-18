(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pyenv-mode)
(pyenv-mode)

(setenv "PYTHONPATH" "/Users/xuexu/.pyenv/shims/python")
(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (after-load 'python
        (push 'company-anaconda company-backends)))))


(require-package 'py-autopep8)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)



(provide 'init-python)
