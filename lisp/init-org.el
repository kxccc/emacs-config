;;; init-org

;; 打开 agenda 快捷键
(evil-define-key 'normal 'global (kbd "<leader>a") 'org-agenda)

;; org 目录
(setq org-directory "~/dev/docs/obsidian")
;; org agenda 读取目录
(setq org-agenda-files (directory-files-recursively org-directory "\\.org$"))
;; 设置启动默认目录
(setq default-directory org-directory)

;; 开启 desktop 保存功能
(desktop-save-mode 1)
;; 每 10 分钟自动保存
(setq desktop-auto-save-timeout 600)

;; 避免每次执行代码都确认
(setq org-confirm-babel-evaluate nil)
;; 启用 Org Babel 支持 Python
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))
;; 指定使用 Python 3
(setq org-babel-python-command "python3")

;; 记录任务完成时间
(setq org-log-done 'time)

(provide 'init-org)
