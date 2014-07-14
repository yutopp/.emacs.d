;; c-mode, c++-mode
(defun ytcf/coffeescript-mode-hook ()
  (linum-mode t)
  (hs-minor-mode 1))

;;
(add-hook 'coffee-mode-hook 'ytcf/coffeescript-mode-hook)
