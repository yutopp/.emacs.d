(require 'web-mode)

;;;

(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?$"      . web-mode))

(add-to-list 'auto-mode-alist '("\\.scss?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.less?$"     . web-mode))

(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$"       . web-mode))
;;;
(defun ytcf/web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (setq web-mode-script-indent-offset 4)
  (hs-minor-mode 1))

;;
(add-hook 'web-mode-hook 'ytcf/web-mode-hook)
