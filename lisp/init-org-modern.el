;; -*- lexical-binding: t; -*-

;; Load Modus Operandi theme
(setq custom-safe-themes t)
(load-theme 'modus-operandi)

;; org-modern
(use-package
 org-modern
 :after org
 :custom
 ;; Edit settings
 (org-auto-align-tags nil)
 (org-tags-column 0)
 (org-catch-invisible-edits 'show-and-error)
 (org-special-ctrl-a/e t)
 (org-insert-heading-respect-content t)

 ;; Org styling, hide markup etc.
 (org-hide-emphasis-markers t)
 (org-pretty-entities t)
 (org-agenda-tags-column 0)
 (org-ellipsis "…")

 ;; Org-modern settings
 (org-modern-star '("◉" "○" "◈" "◇" "✳"))
 (org-modern-hide-stars " ")
 :config (global-org-modern-mode))

(provide 'init-org-modern)
