;;;
;; do not create temporary files
;; http://rontan.sakura.ne.jp/2009/02/tips_emacs_bkfile/
(setq make-backup-files nil)
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq gc-cons-threshold (* 100 gc-cons-threshold))

;; disable startup message
(setq inhibit-startup-message t)
;;
(setq display-time-day-and-date t)
;;
(setq-default visible-bell t)
;; disable toolbar
(tool-bar-mode -1)
;;
(menu-bar-mode 0)
;; auto reload
(global-auto-revert-mode 1)
;; set scroll bar to right
(set-scroll-bar-mode 'right)
;; change cursor
(setq-default cursor-type 'bar)
;; set window alpha
(set-frame-parameter nil 'alpha 92)
;;
(line-number-mode t)
(column-number-mode t)

;;
(cua-mode t)

(setq-default mouse-drag-copy-region nil)
(setq x-select-enable-clipboard t)
