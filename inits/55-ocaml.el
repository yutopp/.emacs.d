;; https://github.com/ocaml/tuareg
;; require: opam install ocamlformat
(use-package tuareg :ensure t
  :commands company
  :init
  (add-hook 'tuareg-mode-hook
            #'(lambda()
                (add-hook 'before-save-hook #'ocamlformat-before-save)
                (setq ocamlformat-show-errors 'echo)

                (setq mode-name "🐫")
                (setq tuareg-indent-align-with-first-arg nil))))

;; require: opam install merlin
(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)
    ;; use ocamlformat
    (require 'ocamlformat)
    ;; enable company-mode
    (require 'merlin-company)
    ))
