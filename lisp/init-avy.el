;; -*- lexical-binding: t; -*-

(use-package pyim :custom (pyim-default-scheme 'xiaohe-shuangpin))

(use-package
 avy
 :general (my-leader :prefix nil "s" #'avy-goto-char-2)

 :config (require 'pyim)

 (defun my-avy-pyim-candidates (orig-fun regex &rest args)
   (apply orig-fun (pyim-cregexp-build regex) args))

 (advice-add 'avy--regex-candidates :around #'my-avy-pyim-candidates))

(provide 'init-avy)
