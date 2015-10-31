;;; -*- coding: utf-8 -*-

;;;
(add-to-list 'load-path "~/.emacs.d/lisp")

;;;
;;; initialize packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;
;; namespace yfcf = yutopp config
(defconst ytcf/required_packages
  '(
    sr-speedbar
    elscreen
    highlight-parentheses
    fold-dwim
    js3-mode
    web-mode
    coffee-mode
    zenburn-theme
    tuareg
    go-mode
    deferred
    icicles
    markdown-mode
    company
    company-quickhelp
    telephone-line
    ))

(defun ytcf/install_packages ()
  (dolist (target_package ytcf/required_packages)
    (unless (package-installed-p target_package)
      (package-install target_package)
      )))

(ytcf/install_packages)

;; too slow
;(require 'deferred)
;(deferred:$
;  (deferred:next
;    (lambda () (package-refresh-contents)))
;  (deferred:nextc it
;    (lambda () (ytcf/install_packages))))

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
;; yaourt -S ttf-inconsolata
(cond
 ((find-font (font-spec :name "Inconsolata-11"))
  (set-default-font "Inconsolata-11")
  (set-face-font 'variable-pitch "Inconsolata-11")
  ;(Set-Face-attribute 'default nil :height 100)
  ))


;;
(cua-mode t)
;; reference...: http://d.hatena.ne.jp/l1o0/20100429/1272557315
;; pacman -S xclip
;(defun my-cut-function (text &optional rest)
;  (interactive)
;  (let ((process-connection-type nil))
;    (let ((proc (start-process "xclip" "*Messages*" "xclip" "-selection" "clipboard")))
;      (process-send-string proc text)
;      (process-send-eof proc))))
;
;(defun my-paste-function ()
;  (interactive)
;  (shell-command-to-string "xclip -o"))
;
;(when (executable-find "xclip")
;  (setq interprogram-cut-function 'my-cut-function)
;  ;(setq interprogram-paste-function 'my-paste-function)
;  )
(setq-default mouse-drag-copy-region nil)
(setq x-select-enable-clipboard t)

;;
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defconst ytcf/tab-stop-list (reverse (let* ((a '()))
                                        (dotimes (i 30 a)
                                          (add-to-list 'a (* (+ i 1) tab-width))))))
(setq-default tab-stop-list ytcf/tab-stop-list)


;;
(set-language-environment "utf-8")
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
(setq-default quail-japanese-use-double-n t)

(when (require 'mozc nil 'noerror)
  ;(set-language-environment "Japanese")
  (setq-default default-input-method "japanese-mozc")
  (setq-default mozc-candidate-style 'echo-area)
  (global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method))


;;; --
;;
(require 'telephone-line)
(telephone-line-mode 1)


;;; --
;;
(require 'linum)
(setq-default linum-format "%5d")


;;; --
;; iswitchb
;; http://ubulog.blogspot.jp/2007/09/emacs_19.html
;; http://www.emacswiki.org/emacs/IswitchBuffers
(icomplete-mode 99)
;(iswitchb-mode 1)
;(setq read-buffer-function 'iswitchb-read-buffer)
;(setq iswitchb-regexp nil)
;(setq iswitchb-prompt-newbuffer nil)
;(add-hook 'iswitchb-define-mode-map-hook
;          '(lambda ()
;             (define-key iswitchb-mode-map "\C-n" 'iswitchb-next-match)
;             (define-key iswitchb-mode-map "\C-p" 'iswitchb-prev-match)
;             (define-key iswitchb-mode-map "\C-f" 'iswitchb-next-match)
;             (define-key iswitchb-mode-map "\C-b" 'iswitchb-prev-match)))

;;; --
(require 'icicles)
(icy-mode 1)


;;; --
(setq ido-enable-flex-matching t)
(ido-mode 1)
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "C-f") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-b") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)


;;; --
;; Highlght parentheses
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)


;; --
;; fold
(require 'fold-dwim)

(global-set-key (kbd "C-x j")     'fold-dwim-toggle)
(global-set-key (kbd "<M-f7>")    'fold-dwim-hide-all)
(global-set-key (kbd "<S-M-f7>")  'fold-dwim-show-all)


;;; -- window
;(global-set-key (kbd "C-S-b")     'shrink-window-horizontally)
;(global-set-key (kbd "C-S-f")     'enlarge-window-horizontally)
;(global-set-key (kbd "C-S-n")     'enlarge-window-horizontally)
;(global-set-key (kbd "C-S-p")     'shrink-window)


;;; -- reload
(setq imenu-auto-rescan t)
(setq org-imenu-depth 6)
(add-hook 'org-mode-hook
          (lambda () (imenu-add-to-menubar "Imenu")))


;;; -- sr-speedbar
(require 'sr-speedbar)
(sr-speedbar-refresh-turn-on)
(setq sr-speedbar-right-side nil)
(global-set-key (kbd "C-c s")   'sr-speedbar-toggle)


;;; --
;; remove trailing whitespace when saving files except markdown
(add-hook 'before-save-hook
          '(lambda ()
             (when (and (stringp buffer-file-name)
                        (not (string-match "\\.md\\'" buffer-file-name)))
               (delete-trailing-whitespace))
             ))


;;; --
(defun ytcf/toggle-fullscreen ()
  ""
  (interactive)
  (let ((is_fullscreen (not (null (frame-parameter (selected-frame) 'fullscreen)))))
    (if is_fullscreen (set-frame-parameter (selected-frame) 'fullscreen 'nil)
      (set-frame-parameter (selected-frame) 'fullscreen 'fullboth))
    ))
(global-set-key [f11] 'ytcf/toggle-fullscreen)


;;; ---
;; company-mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)

(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "TAB") 'company-select-next)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)

(company-quickhelp-mode 1)
(setq company-quickhelp-delay 0.2)

(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 6)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 20)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 15)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))


(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-elisp))))


;;; ----


;;; --
(load "mode-config/c++.el")
(load "mode-config/web.el")
(load "mode-config/coffeescript.el")
(load "mode-config/ocaml.el")

(load "mode-config/rill.el")


;;; --
(add-to-list 'load-path "~/.emacs.d/ext/TypeScript support for emacs")
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(autoload 'typescript-mode "TypeScript" "Major mode for editing typescript." t)

;;; --
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-hook 'markdown-mode-hook 'show-ws-toggle-show-trailing-whitespace)


;;; --
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(autoload 'bison-mode "bison-mode")
(autoload 'flex-mode "flex-mode")
(add-to-list 'auto-mode-alist '("\\.mly\\'" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.mll\\'" . flex-mode))
