;; -*- lexical-binding: t; -*-

;; 设置镜像源
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa" . "https://melpa.org/packages/")))

;; 自动安装未安装的包
(setq use-package-always-ensure t)
;; 启用 use-package
(eval-when-compile
  (require 'use-package))

(electric-pair-mode 1) ; 自动补全括号
(column-number-mode 1) ; 在 Mode line 上显示列号
(global-auto-revert-mode t) ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(which-key-mode 1) ; which-key
(set-face-attribute 'default nil :font "Maple Mono Normal NF CN-16") ; 设置字体
(add-to-list 'default-frame-alist '(fullscreen . maximized)) ; 启动时窗口最大化
(setq word-wrap nil) ;可在单词中间换行
(global-visual-line-mode 1) ; 自动换行显示长行文本

;; 开启 desktop 保存功能
(desktop-save-mode 1)
;; 每 10 分钟自动保存
(setq desktop-auto-save-timeout 600)

;; 保守滚动，取消自动居中
(setq scroll-conservatively 10000)

(add-to-list
 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 添加自定义配置文件路径
(require 'init-evil) ; 设置 evil
(require 'init-org) ; 设置 org-mode
(require 'init-org-modern) ; 设置 org-modern
(require 'init-org-pomodoro) ; 设置 org-pomodoro
(require 'init-plugins) ; 设置其他插件

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5e39e95c703e17a743fb05a132d727aa1d69d9d2c9cde9353f5350e545c793d4"
     default))
 '(package-selected-packages nil)
 '(safe-local-variable-values
   '((auto-save-visited-interval . 10) (auto-save-visited-mode . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
