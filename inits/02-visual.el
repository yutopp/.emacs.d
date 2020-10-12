;;; themes

(use-package zenburn-theme :ensure t
  :defer t
  :init
  (load-theme 'zenburn t)
  :config
  )

;;; fonts

;; yay -S ttf-inconsolata
(set-face-attribute 'default nil :family "Inconsolata" :height 136)
;;(set-face-attribute 'default nil :family "Consolas" :height 104)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "IPAGothic"))
;;(setq face-font-rescale-alist '(("IPAGothic" . 1.08)))

(set-fontset-font t 'symbol "Apple Color Emoji")
(set-fontset-font t 'symbol "Noto Color Emoji" nil 'append)
(set-fontset-font t 'symbol "Segoe UI Emoji" nil 'append)
(set-fontset-font t 'symbol "Symbola" nil 'append)

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

;;; Highlght parentheses

(use-package highlight-parentheses :ensure t
  :defer t
  :init
  (define-globalized-minor-mode global-highlight-parentheses-mode
    highlight-parentheses-mode
    (lambda ()
      (highlight-parentheses-mode t)))
  (global-highlight-parentheses-mode t))

;;; mode-line

(use-package all-the-icons)
(use-package doom-modeline :ensure t
  :init
;;  (setq doom-modeline-height 1)
;;  (custom-set-faces
;;   '(mode-line ((t (:family "Noto Sans" :height 0.9))))
;;   '(mode-line-inactive ((t (:family "Noto Sans" :height 0.9)))))
  (doom-modeline-mode 1))
