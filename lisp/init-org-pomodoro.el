;; -*- lexical-binding: t; -*-

(use-package
 org-pomodoro
 :custom
 (org-pomodoro-length 25)
 (org-pomodoro-short-break-length 5)
 (org-pomodoro-long-break-length 15)
 (org-pomodoro-long-break-frequency 4)
 ;; 启用手动开始休息
 (org-pomodoro-manual-break t)
 :config
 (with-eval-after-load 'org
   (define-key org-mode-map (kbd "C-c p") #'org-pomodoro))
 (with-eval-after-load 'org-agenda
   (define-key org-agenda-mode-map (kbd "C-c p") #'org-pomodoro)))

(provide 'init-org-pomodoro)
