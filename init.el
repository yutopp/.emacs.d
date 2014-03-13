;;; -*- coding: utf-8 -*-

;; bun!!!

;;;
;;; initialize packages
(require 'package)
;; add melpa
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; add marmalade
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/"))
;;
(package-initialize)

;;;
;; yfcf = yutopp config
(defconst ytcf/required_packages
  '(
    nzenburn-theme
    elscreen
    powerline
    highlight-parentheses
    ))
(dolist (target_package ytcf/required_packages)
  (unless (package-installed-p target_package)
    (package-install target_package)
    ))


;;;
;; do not create temporary files
;; http://rontan.sakura.ne.jp/2009/02/tips_emacs_bkfile/
(setq make-backup-files nil)
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq gc-cons-threshold (* 10 gc-cons-threshold))


;;;
;; theme
(load-theme 'nzenburn t)

;; dissable startup message
(setq inhibit-startup-message t)
;;
(setq display-time-day-and-date t)
;;
(setq-default visible-bell t)
;; dissable toolbar
(tool-bar-mode -1)
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
(cond (window-system
       (setq-default x-select-enable-clipboard t)
       ))
(setq-default mouse-drag-copy-region nil)

;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defconst ytcf/tab-stop-list (reverse (let* ((a '()))
                                        (dotimes (i 30 a)
                                          (add-to-list 'a (* (+ i 1) tab-width))))))
(setq-default tab-stop-list ytcf/tab-stop-list)


;;
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default default-file-name-coding-system 'utf-8-unix)
(setq-default default-keyboard-coding-system 'utf-8-unix)
(setq-default default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq-default default-sendmail-coding-system 'utf-8-unix)
(setq-default default-terminal-coding-system 'utf-8-unix)


;;; --
;; Elscreen
(setq-default elscreen-prefix-key "\C-xt")
(setq-default elscreen-tab-display-control nil)
(setq-default elscreen-tab-display-kill-screen nil)
(global-set-key (kbd "C-S-t") 'elscreen-create)
(global-set-key (kbd "C-S-w") 'elscreen-kill)
(global-set-key (kbd "M-]") 'elscreen-next)
(global-set-key (kbd "M-[") 'elscreen-previous)
(elscreen-start)



;;; --
;; for japanese input
;; http://www.ubiqlog.com/archives/8538
(prefer-coding-system 'utf-8)
(setq quail-japanese-use-double-n t)

(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'echo-area)
(global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method)



;;; --
;;
(powerline-default-theme)


;;; --
;; iswitchb
;; http://ubulog.blogspot.jp/2007/09/emacs_19.html
(iswitchb-mode t)
(setq read-buffer-function 'iswitchb-read-buffer)
(setq iswitchb-regexp nil)
(setq iswitchb-prompt-newbuffer nil)
(add-hook 'iswitchb-define-mode-map-hook
          '(lambda ()
             (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
             (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
             (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
             (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))



;;; --
;; Highlght parentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)



;;; --
;;
(add-hook 'before-save-hook
          '(lambda ()
             (delete-trailing-whitespace)
             ))
