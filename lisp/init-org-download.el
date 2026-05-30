;; -*- lexical-binding: t; -*-

;; 安装 org-download
(use-package
 org-download
 :after org
 :bind
 (:map
  org-mode-map
  ("C-c C-y" . org-download-clipboard) ;; 从剪贴板插入图片
  )
 :custom
 ;; 使用附件功能保存图片
 (org-download-method 'attach))

(provide 'init-org-download)
