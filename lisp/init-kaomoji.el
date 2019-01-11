;; TODO key->multi-values
;; TODO ivy-format-function
;; TODO kaomoji-auto-update
(require 'ivy)
(defconst counsel-kaomoji-table
  '(("Joy" . "(* ^ ω ^)")
    ("Love" .  "(´ ω `♡)")))



(defun counsel-kaomoji-name-list (counsel-kaomoji-alist)
  (cond
   ((null counsel-kaomoji-alist) '())
   ((cons (car (car counsel-kaomoji-alist))
          (counsel-kaomoji-name-list (cdr counsel-kaomoji-alist))))))

(defun counsel-kaomoji-name->kaomoji (counsel-kaomoji-name)
  (cdr (assoc counsel-kaomoji-name counsel-kaomoji-table)))


(defun counsel-kaomoji--decorate-candidate (kaomoji)
  "Decrorate a kaomoji name, by appending corresponding kaomoji"
  (format
   (concat "%-" (number-to-string (- (window-total-width) 10)) "s%s")
   kaomoji
   (counsel-kaomoji-name->kaomoji
    kaomoji)))


(defun counsel-kaomoji--format-function (candidates)
  (ivy--format-function-generic
   (lambda (kaomoji)
     (ivy--add-face
      (counsel-kaomoji--decorate-candidate
       kaomoji)
      'ivy-current-match))
   'counsel-kaomoji--decorate-candidate
   candidates
   "\n"))

;;; ###autoload
(defun counsel-kaomoji ()
  (interactive)
  (let ((ivy-format-function #'counsel-kaomoji--format-function))
    (ivy-read
     "Kaomoji: "
     (counsel-kaomoji-name-list counsel-kaomoji-table)
     :action (lambda (counsel-kaomoji-name)
               (insert (counsel-kaomoji-name->kaomoji counsel-kaomoji-name))))))

(provide 'init-kaomoji)
