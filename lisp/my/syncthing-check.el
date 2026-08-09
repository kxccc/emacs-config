;; -*- lexical-binding: t; -*-

(require 'url)
(require 'json)

;; ==========================
;; 配置
;; ==========================

(defvar my-syncthing-device-id (getenv "SYNCTHING_DEVICE_ID"))

(defvar my-syncthing-api-key (getenv "SYNCTHING_API_KEY"))

(defvar my-syncthing-url
  "http://127.0.0.1:8384/rest/system/connections")

;; ==========================
;; 异步检查
;; ==========================

(defun my-syncthing-check ()
  "Check Syncthing connection asynchronously."
  (let ((url-request-extra-headers
         `(("X-API-Key" . ,my-syncthing-api-key))))
    (url-retrieve
     my-syncthing-url #'my-syncthing-check-callback nil t)))

;; ==========================
;; 回调
;; ==========================

(defun my-syncthing-check-callback (status)
  (let ((buf (current-buffer)))
    (unwind-protect
        (if (plist-get status :error)
            (message "⚠ Syncthing API error: %S" status)
          (goto-char url-http-end-of-headers)
          (let* ((json-object-type 'hash-table)
                 (json-key-type 'string)
                 (data (json-read))
                 (connections (gethash "connections" data))
                 (device (gethash my-syncthing-device-id connections))
                 (connected (gethash "connected" device)))
            (unless (eq connected t)
              (message "⚠ Syncthing device offline"))))
      ;; 删除 HTTP buffer
      (when (buffer-live-p buf)
        (kill-buffer buf)))))

;; ==========================
;; 定时器
;; ==========================

(defvar my-syncthing-timer nil)

(defun my-syncthing-start ()
  "Start Syncthing monitor."
  (setq my-syncthing-timer
        (run-with-timer 0 10 #'my-syncthing-check)))

;; 启动
(my-syncthing-start)

(provide 'my/syncthing-check)
