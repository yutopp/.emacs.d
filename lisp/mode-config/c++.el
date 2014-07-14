;; c-mode, c++-mode
(defun ytcf/c++-mode-hook ()
  (setq-default c-basic-offset 4)
  (c-set-style "stroustrup")
  (c-set-offset 'inline-open '0)
  (linum-mode t)
  (hs-minor-mode 1))

;;
(add-hook 'c-mode-common-hook 'ytcf/c++-mode-hook)
