;; evil
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)         ; 使 C-u 可以向上滚屏
  (setq evil-undo-system 'undo-redo)    ; 使用 Emacs 内置的 undo-redo 系统
  (setq evil-want-Y-yank-to-eol t)      ; 使 Y 是 yank to end of line
  :config
  (evil-mode 1)
  (evil-set-leader '(normal visual motion) ";")    ; 设置 leader key 为 ";"
  (define-key evil-normal-state-map (kbd "SPC") 'evil-window-map))    ; 设置 SPC 为 window 命令前缀

;; evil-org
(use-package evil-org
  :after org
  :hook (org-mode . (lambda () evil-org-mode))
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(provide 'init-evil)
