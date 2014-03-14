;; c-mode, c++-mode
(defun ytcf/c++-mode-hook ()
  (c-set-style "stroustrup")
  (setq-default c-basic-offset 4)
  (linum-mode t))

;;
(add-hook 'c-mode-common-hook 'ytcf/c++-mode-hook)
