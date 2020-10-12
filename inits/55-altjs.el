;;; TypeScript

;; npm install -g typescript-language-server
(use-package typescript-mode :ensure t
  :defer t
  :config
  (setq typescript-indent-level 2))


;;; JSON

(use-package json-mode :ensure t
  :config
  (setq-default js-indent-level 2))


;;; Elm

;; npm i -g @elm-tooling/elm-language-server
(use-package elm-mode :ensure t
  :defer t
  :init)
