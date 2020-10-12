(use-package flyspell :ensure t
  :defer t)

(use-package flymake :ensure t
  :defer t)

(use-package yasnippet :ensure t
  :defer t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1)
  )

(use-package company-quickhelp :ensure t
  :defer t
  )

(use-package company :ensure t
  :defer t
  :commands (company-quickhelp yasnippet)
  :config
  (setq company-idle-delay 0
        company-minimum-prefix-length 1
        company-selection-wrap-around t
        company-quickhelp-delay 0.15)
  (global-company-mode)
  (company-quickhelp-mode 1)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "TAB") 'company-select-next)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-h") nil)
  )

;;  (push 'company-omnisharp company-backends))

(use-package company-box :ensure t
  :hook (company-mode . company-box-mode))
;;  :config
;;  (company-box-icons-resize 16))
