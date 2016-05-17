;; ref: https://github.com/the-lambda-church/merlin/wiki/emacs-from-scr
;; require: opam install merlin
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
(require 'merlin)

(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-command 'opam)

; Make company aware of merlin
(add-to-list 'company-backends 'merlin-company-backend)
; Enable company on merlin managed buffers
(add-hook 'merlin-mode-hook 'company-mode)

(defun ytcf/tuareg-mode-hook ()
  (setq tuareg-indent-align-with-first-arg nil)
  (setq tuareg-in-indent 0)
  (setq tuareg-electric-indent nil)
  (setq tuareg-leading-star-in-doc t)
  (setq tuareg-with-indent 0)
  (linum-mode t))

(add-hook 'tuareg-mode-hook 'ytcf/tuareg-mode-hook)

(add-to-list 'auto-mode-alist '("\\.mly\\'" . bison-mode))
(add-to-list 'auto-mode-alist '("\\.mll\\'" . flex-mode))
