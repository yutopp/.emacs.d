(add-to-list 'load-path "~/.emacs.d/mode-config/rill-mode")

(setq auto-mode-alist (cons '("\\.rill\\w?" . rill-mode) auto-mode-alist))
(autoload 'rill-mode "rill-mode" "Major mode for editing Rill code" t)
