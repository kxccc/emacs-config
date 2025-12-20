;; -*- lexical-binding: t; -*-

;; 格式化elisp代码
(use-package
 elisp-autofmt
 :custom
 (elisp-autofmt-python-bin
  "/nix/store/db2rr68gyw519rmh4zvv28r8p9sxaa7a-python3-3.10.19/bin/python3"))

;; 重启 Emacs
(use-package restart-emacs :bind (("C-c r" . restart-emacs)))

(provide 'init-plugins)
