;; -*- lexical-binding: t; -*-

;; 格式化elisp代码
(use-package
 elisp-autofmt
 :general
 (my-leader :keymaps 'emacs-lisp-mode-map "l" #'elisp-autofmt-buffer)
 :custom
 (elisp-autofmt-python-bin
  "/nix/store/3rnwb06acrgdggxkgpm7fnklbxqs5mw6-python3-3.11.15/bin/python3"))

;; 重启 Emacs
(use-package restart-emacs :general (my-leader "r" #'restart-emacs))

;; 环境变量
(use-package
 exec-path-from-shell
 :config (exec-path-from-shell-initialize))

(use-package projectile :init (projectile-mode +1))

(provide 'init-plugins)
