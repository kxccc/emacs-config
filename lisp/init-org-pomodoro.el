;; -*- lexical-binding: t; -*-

(use-package
 org-pomodoro
 :after (org org-agenda)
 :custom
 (org-pomodoro-length 25)
 (org-pomodoro-short-break-length 5)
 (org-pomodoro-long-break-length 15)
 (org-pomodoro-long-break-frequency 4)
 ;; 启用手动开始休息
 (org-pomodoro-manual-break t)
 :bind
 (:map org-agenda-mode-map ("C-c p" . org-pomodoro))
 (:map org-mode-map ("C-c p" . org-pomodoro)))

(with-eval-after-load 'alert
  (add-to-list
   'alert-user-configuration
   '(((:category . "org-pomodoro")) osx-notifier nil)))

(provide 'init-org-pomodoro)
