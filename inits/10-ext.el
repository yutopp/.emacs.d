;;; ido

(setq ido-enable-flex-matching t)
(ido-mode 1)

;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match)
  (define-key ido-completion-map (kbd "C-f") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-b") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; https://github.com/cofi/dotfiles/blob/master/emacs.d/config/cofi-files.el#L19
(eval-after-load "ido"
  '(progn
     (setq ido-ignore-buffers (append
                               ido-ignore-buffers
                               '(
                                 "\\` "
                                 "\\`\\*.*\\*"
                                 "_region_"
                                 )))
     (setq ido-ignore-directories (append
                                   ido-ignore-directories
                                   '(
                                     "^auto/$"
                                     "\\.prv/"
                                     "_region_"
                                     )))
     (setq ido-ignore-files (append
                             ido-ignore-files
                             '(
                               "^auto/$"
                               "_region_"
                               "\\.omc$"
                               "\\.cmt$"
                               "\\.cmx$"
                               "\\.cmi$"
                               "\\.cmti$"
                               "\\.o$"
                               )))
     ))
