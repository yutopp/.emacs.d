(require 'web-mode)

;;;
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

;;;
(defun ytcf/web-mode-hook ()
  "Hooks for Web mode."
  (setq-default web-mode-markup-indent-offset 4)
  (setq-default web-mode-css-indent-offset 4)
  (setq-default web-mode-script-indent-offset 4)
  (hs-minor-mode 1))

;;
(add-hook 'web-mode-hook 'ytcf/web-mode-hook)
