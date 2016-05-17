;; typescript-mode

(add-to-list 'auto-mode-alist '("\\.tsx$"       . typescript-mode))

;;;
(defun ytcf/typescript-mode ()
;  (tide-setup)
;  (flycheck-mode t)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode t)
  (linum-mode t)
  (hs-minor-mode 1))


(add-hook 'typescript-mode-hook 'ytcf/typescript-mode)
