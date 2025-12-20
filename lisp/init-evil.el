;; -*- lexical-binding: t; -*-

;; evil
(use-package
 evil
 :custom
 (evil-want-C-u-scroll t) ; 使 C-u 可以向上滚屏
 (evil-undo-system 'undo-redo) ; 使用 Emacs 内置的 undo-redo 系统
 (evil-want-Y-yank-to-eol t) ; 使 Y 是 yank to end of line
 :config (evil-mode 1))

;; evil-org
(use-package
 evil-org
 :after org
 :hook (org-mode . (lambda () evil-org-mode))
 :config
 (require 'evil-org-agenda)
 (evil-org-agenda-set-keys))

(provide 'init-evil)
