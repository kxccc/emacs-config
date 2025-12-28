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

(with-eval-after-load 'alert
  (alert-define-style
   'bark
   :notifier
   (lambda (info)
     (defvar my-alert-prefixes '("Start break" "Ready for"))
     (let ((msg (plist-get info :message)))
       (when (and (stringp msg)
                  (cl-some
                   (lambda (p) (string-prefix-p p msg))
                   my-alert-prefixes))
         (url-retrieve
          (format
           "https://api.day.app/xxxxxx/%s?group=emacs?isArchive=1"
           (url-hexify-string msg))
          #'ignore)
         (url-retrieve
          (format
           "https://api.day.app/xxxxxx/%s?group=emacs"
           (url-hexify-string msg))
          #'ignore)))))

  (add-to-list
   'alert-user-configuration
   '(((:category . "org-pomodoro")) bark nil)))

(provide 'init-org-pomodoro)
