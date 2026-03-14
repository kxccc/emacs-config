;; -*- lexical-binding: t; -*-

(defun my-org-resolve-clocks ()
  (interactive)
  (unless org-clock-resolving-clocks
    (let ((org-clock-resolving-clocks t)
          (has-open nil))
      (dolist (file (org-files-list))
        (let ((clocks (org-find-open-clocks file)))
          (when clocks
            (setq has-open t))
          (dolist (clock clocks)
            (let ((dangling
                   (or (not (org-clock-is-active))
                       (/= (car clock) org-clock-marker))))
              (if dangling
                  (org-clock-resolve-clock clock 'now nil nil nil t)
                (message "Clock fixed"))))))
      (when (and (not has-open) (org-clock-is-active))
        (move-marker org-clock-marker nil)
        (move-marker org-clock-hd-marker nil)
        (setq org-clock-current-task nil)
        (setq global-mode-string
              (delq 'org-mode-line-string global-mode-string))
        (org-clock-restore-frame-title-format)
        (force-mode-line-update)
        (message "Clock fixed")))))

(my-org-resolve-clocks)


(defvar my-debounce-timer nil)
(defvar my-watch-descriptors nil)
(defvar my-watch-files org-agenda-files)

(defun my-debounce (fn delay)
  (when my-debounce-timer
    (cancel-timer my-debounce-timer))
  (setq my-debounce-timer (run-at-time delay nil fn)))

(defun my-setup-file-watchers ()
  (dolist (desc my-watch-descriptors)
    (ignore-errors
      (file-notify-rm-watch desc)))
  (setq my-watch-descriptors nil)

  ;; 监听目录而不是文件，这样文件删除重建都能捕获
  (let ((dirs
         (delete-dups (mapcar #'file-name-directory my-watch-files))))
    (dolist (dir dirs)
      (when (file-exists-p dir)
        (push (file-notify-add-watch
               dir '(change) #'my-dir-change-handler)
              my-watch-descriptors)))))

(defun my-dir-change-handler (event)
  (let ((file (caddr event)))
    ;; 只处理 my-watch-files 里的文件
    (when (member file my-watch-files)
      (my-debounce #'my-org-resolve-clocks 10))))

(my-setup-file-watchers)

(provide 'init-clock-resolve)
