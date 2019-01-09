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


(defun counsel-kaomoji ()
  (interactive)
  (ivy-read
   "Kaomoji: "
   (counsel-kaomoji-name-list counsel-kaomoji-table)
   :action (lambda (counsel-kaomoji-name)
             (insert (counsel-kaomoji-name->kaomoji counsel-kaomoji-name)))))

(provide 'init-kaomoji)
