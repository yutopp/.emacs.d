;; c-mode, c++-mode
(defun ytcf/emacs-lisp-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-elisp))
  (linum-mode t))

;;
(add-hook 'emacs-lisp-mode-hook 'ytcf/emacs-lisp-mode-hook)
