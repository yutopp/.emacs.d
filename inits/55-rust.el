;;; Rust

;; https://rust-analyzer.github.io/manual.html#emacs
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))

(use-package rustic :ensure t
  :defer t
  :init
  (setq rustic-lsp-server 'rust-analyzer
        rustic-spinner-type 'moon))
