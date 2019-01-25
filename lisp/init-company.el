;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (after-load 'company
    (dolist (backend '(company-eclim company-semantic))
      (delq backend company-backends))
    (diminish 'company-mode)
    (define-key company-mode-map (kbd "M-/") 'company-complete)
    (define-key company-active-map (kbd "M-/") 'company-other-backend)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (setq company-idle-delay 0
          company-minimum-prefix-length 1)
    (setq-default company-dabbrev-other-buffers 'all
                  company-tooltip-align-annotations t))
  (global-set-key (kbd "M-C-/") 'company-complete)
  (when (maybe-require-package 'company-quickhelp)
    (add-hook 'after-init-hook 'company-quickhelp-mode)))


;; Suspend page-break-lines-mode while company menu is active
;; (see https://github.com/company-mode/company-mode/issues/416)

(after-load 'company
  (after-load 'page-break-lines
    (defvar-local sanityinc/page-break-lines-on-p nil)

    (defun sanityinc/page-break-lines-disable (&rest ignore)
      (when (setq sanityinc/page-break-lines-on-p (bound-and-true-p page-break-lines-mode))
        (page-break-lines-mode -1)))

    (defun sanityinc/page-break-lines-maybe-reenable (&rest ignore)
      (when sanityinc/page-break-lines-on-p
        (page-break-lines-mode 1)))

    (add-hook 'company-completion-started-hook 'sanityinc/page-break-lines-disable)
    (add-hook 'company-after-completion-hook 'sanityinc/page-break-lines-maybe-reenable)))



;; (require-package 'company-box)
;; (require 'company-box)
;; (add-hook 'company-mode-hook 'company-box-mode)

;; ;; (require-package 'company-posframe)
;; ;; (company-posframe-mode 1)
;; (setq company-box-icons-unknown 'fa_question_circle)

;; (setq company-box-icons-elisp
;;       '((fa_tag :face font-lock-function-name-face) ;; Function
;;         (fa_cog :face font-lock-variable-name-face) ;; Variable
;;         (fa_cube :face font-lock-constant-face)     ;; Feature
;;         (md_color_lens :face font-lock-doc-face))) ;; Face

;; (setq company-box-icons-yasnippet 'fa_bookmark)


;; (setq company-box-icons-lsp
;;       '((1 . fa_text_height)                               ;; Text
;;         (2 . (fa_tags :face font-lock-function-name-face)) ;; Method
;;         (3 . (fa_tag :face font-lock-function-name-face))  ;; Function
;;         (4 . (fa_tag :face font-lock-function-name-face)) ;; Constructor
;;         (5 . (fa_cog :foreground "#FF9800"))              ;; Field
;;         (6 . (fa_cog :foreground "#FF9800"))              ;; Variable
;;         (7 . (fa_cube :foreground "#7C4DFF"))             ;; Class
;;         (8 . (fa_cube :foreground "#7C4DFF"))             ;; Interface
;;         (9 . (fa_cube :foreground "#7C4DFF"))             ;; Module
;;         (10 . (fa_cog :foreground "#FF9800"))             ;; Property
;;         (11 . md_settings_system_daydream)                ;; Unit
;;         (12 . (fa_cog :foreground "#FF9800"))             ;; Value
;;         (13 . (md_storage :face font-lock-type-face))     ;; Enum
;;         (14 . (md_closed_caption :foreground "#009688"))  ;; Keyword
;;         (15 . md_closed_caption)                          ;; Snippet
;;         (16 . (md_color_lens :face font-lock-doc-face))   ;; Color
;;         (17 . fa_file_text_o)                             ;; File
;;         (18 . md_refresh)                                 ;; Reference
;;         (19 . fa_folder_open)                             ;; Folder
;;         (20 . (md_closed_caption :foreground "#009688")) ;; EnumMember
;;         (21 . (fa_square :face font-lock-constant-face)) ;; Constant
;;         (22 . (fa_cube :face font-lock-type-face))       ;; Struct
;;         (23 . fa_calendar)                               ;; Event
;;         (24 . fa_square_o)                               ;; Operator
;;         (25 . fa_arrows)) ;; TypeParameter
;; )

(provide 'init-company)
