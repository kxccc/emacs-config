;; -*- lexical-binding: t; -*-

(use-package
 org-pomodoro
 :general
 (my-leader
  :keymaps '(org-mode-map org-agenda-mode-map) "m p" #'org-pomodoro)
 :custom
 (org-pomodoro-length 25)
 (org-pomodoro-short-break-length 5)
 (org-pomodoro-long-break-length 15)
 (org-pomodoro-long-break-frequency 4)
 ;; 启用手动开始休息
 (org-pomodoro-manual-break t))

(provide 'init-org-pomodoro)
