;; 设置 Doom Emacs 主题
(use-package doom-themes
  :config
  (load-theme 'doom-one-light t)  ; 选择主题

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; or for treemacs users
  ;; (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(provide 'init-doom-themes)
