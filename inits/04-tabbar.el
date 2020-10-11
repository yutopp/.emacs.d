(tab-bar-mode t)

;;; https://github.com/emacs-mirror/emacs/blob/master/lisp/tab-bar.el
(global-set-key (kbd "C-S-t") 'tab-new)
(global-set-key (kbd "C-S-w") 'tab-close)
(global-set-key (kbd "M-]") 'tab-next)
(global-set-key (kbd "M-[") 'tab-previous)

;; Elscreen
;(use-package elscreen
;  :ensure t
;  :config
;  (setq-default elscreen-prefix-key "\C-xt")
;  (setq-default elscreen-tab-display-control nil)
;  (setq-default elscreen-tab-display-kill-screen nil)
;  (global-set-key (kbd "C-S-t") 'elscreen-create)
;  (global-set-key (kbd "C-S-w") 'elscreen-kill)
;  (global-set-key (kbd "M-]") 'elscreen-next)
;  (global-set-key (kbd "M-[") 'elscreen-previous)
;  (elscreen-start))
