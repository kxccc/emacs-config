;; -*- lexical-binding: t; -*-

;; 打开 agenda 快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; org 目录
(setq org-directory "~/dev/docs/obsidian")
;; org agenda 读取目录
(setq org-agenda-files
      '("~/dev/docs/org/work.org" "~/dev/docs/org/inbox.org"))
;; 启动默认目录
(setq default-directory org-directory)

;; 让 refile 的目标就是所有 agenda 文件中的标题（最多两级）
(setq org-refile-targets '((org-agenda-files :maxlevel . 2)))
;; 显示为 “文件/父/子”
(setq org-refile-use-outline-path 'file)
;; 一次性补全（而不是分步）
(setq org-outline-path-complete-in-steps nil)
;; 允许在 refile 时临时创建不存在的父节点
(setq org-refile-allow-creating-parent-nodes 'confirm)

;; 显示任务今日耗时，而不是总耗时
(setq org-clock-mode-line-total 'today)

;; 把“今天”延长到凌晨 4 点  
(setq org-extend-today-until 4)

;; clock-in 时续上之前未完成的任务
(setq org-clock-in-resume t)

;; 避免每次执行代码都确认
(setq org-confirm-babel-evaluate nil)
;; 启用 Org Babel 支持 Python
(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))
;; 指定使用 Python 3
(setq org-babel-python-command "python3")

;; 记录任务完成时间
(setq org-log-done 'time)
;; 记录到LOGBOOK
(setq org-log-into-drawer t)

;; 子任务未完成时，父任务不能标记为完成
(setq org-enforce-todo-dependencies t)

;; 设置 clock 报告参数
(setq org-agenda-clockreport-parameter-plist
      '(:link t :maxlevel 5 :fileskip0 t :compact nil))

;; 自定义状态
(setq org-todo-keywords
      '((sequence
         "TODO(t)"
         "DOING(d)"
         "WAITING(w)"
         "|"
         "DONE(D!)"
         "CANCELLED(C)")))

;; 自定义 agenda 视图
(setq
 org-agenda-custom-commands
 '(("x" "Agenda + Other tasks"
    ((agenda
      ""
      ((org-agenda-span 7) ;; 显示7天
       (org-agenda-files '("~/dev/docs/org/work.org")) ;; 限定文件
       (org-agenda-overriding-header "📂 工作安排")))
     (alltodo
      ""
      ((org-agenda-files
        '("~/dev/docs/org/inbox.org"
          "~/dev/docs/org/reminders-beorg.org")) ;; 限定文件
       (org-agenda-overriding-header "🗓️ 其他安排")))
     (agenda
      ""
      ((org-agenda-span 1) ;; 显示1天
       (org-agenda-start-day "0d") ;; 从今天开始
       (org-agenda-files '("~/dev/docs/org/foundation.org")) ;; 限定文件
       (org-agenda-overriding-header "🗓️ Foundation")))))
   ("r" "Closed tasks" agenda ""
    ((org-agenda-span 7)
     (org-agenda-show-log 'only) ; 仅显示日志项
     (org-agenda-log-mode-items '(closed)) ; 只看 CLOSED 事件
     ))))

;; todo capture 模板
(setq org-capture-templates
      '(("t" "Todo" entry
         (file "~/dev/docs/org/inbox.org") ; 保存文件
         "* TODO %?\n[%U]" ; 模板内容
         )))

(global-set-key (kbd "C-c c") 'org-capture)

;; org-roam
(use-package
 org-roam
 :custom (org-roam-directory (file-truename org-directory))
 :bind
 (("C-c n l" . org-roam-buffer-toggle)
  ("C-c n f" . org-roam-node-find)
  ("C-c n g" . org-roam-graph)
  ("C-c n i" . org-roam-node-insert)
  ("C-c n c" . org-roam-capture)
  ("C-c n d" . org-roam-dailies-goto-today))
 :config
 ;; If you're using a vertical completion framework, you might want a more informative completion interface
 (setq org-roam-node-display-template
       (concat
        "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
 (org-roam-db-autosync-mode)
 ;; If using org-roam-protocol
 (require 'org-roam-protocol))

(provide 'init-org)
