(set-language-environment "utf-8")

(setq-default buffer-file-coding-system 'utf-8-unix)
(setq-default default-file-name-coding-system 'utf-8-unix)
(setq-default default-keyboard-coding-system 'utf-8-unix)
(setq-default default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq-default default-sendmail-coding-system 'utf-8-unix)
(setq-default default-terminal-coding-system 'utf-8-unix)

;;; --
;; for japanese input
;; http://www.ubiqlog.com/archives/8538
(prefer-coding-system 'utf-8)
;;(set-language-environment "Japanese")
;;(set-default 'buffer-file-coding-system 'utf-8)
;                                        ;(setq-default quail-japanese-use-double-n t)
;
;;(when (require 'mozc nil 'noerror)
;;  (setq-default default-input-method "japanese-mozc")
;;  (setq-default mozc-candidate-style 'echo-area))
;
;;(when (require 'mozc nil 'noerror)
;;  (setq-default default-input-method "japanese-mozc")
;;  (setq-default mozc-candidate-style 'echo-area)
;;  (global-set-key (kbd "<zenkaku-hankaku>") 'toggle-input-method))
