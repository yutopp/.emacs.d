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

;;; hiwin

(use-package hiwin :ensure t
  :defer t
  :init
  (hiwin-activate)
  (set-face-background 'hiwin-face "gray30"))

;;; hi-line

;; http://rubikitch.com/2015/05/14/global-hl-line-mode-timer/
(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer
      (run-with-idle-timer 0.02 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)
