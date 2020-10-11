;;; themes

(use-package zenburn-theme :ensure t
  :defer t
  :init
  (load-theme 'zenburn t)
  :config
  )

;;; fonts

;; yay -S ttf-inconsolata
(set-face-attribute 'default nil :family "Inconsolata")
;;(set-face-attribute 'default nil :family "Consolas" :height 104)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "IPAGothic"))
;;(setq face-font-rescale-alist '(("IPAGothic" . 1.08)))
(set-frame-font (font-spec :size 18))
