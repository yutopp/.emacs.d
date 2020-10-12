(use-package lsp-mode :ensure t
  :custom
  ;; MEMO: https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
  (lsp-inhibit-message t)
  (lsp-message-project-root-warning t)
;;  (lsp-document-sync-method 'incremental) ;; always send incremental document
;;  (lsp-response-timeout 5)
  (lsp-idle-delay 0.1)
  (lsp-headerline-breadcrumb-enable t)
  (lsp-signature-auto-activate nil)
  (lsp-signature-render-documentation nil)
  (lsp-signature-function (lambda (_message))); work around
  (lsp-prefer-flymake 'flymake)
  (create-lockfiles nil)
  :config
  :commands (lsp lsp-deferred company)
  :hook
  ((go-mode
    rustic-mode
    typescript-mode) . lsp-deferred))

(use-package lsp-ui :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-sideline-show-diagnostics t)
  (lsp-ui-doc-enable t)
  (scroll-margin 0))
