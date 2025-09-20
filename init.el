;; -- lexical-binding: t; --

;; 设置镜像源
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

;; 自动安装未安装的包
(setq use-package-always-ensure t)
;; 启用 use-package
(eval-when-compile
  (require 'use-package))

(electric-pair-mode 1)            ; 自动补全括号
(column-number-mode 1)            ; 在 Mode line 上显示列号
(global-display-line-numbers-mode 1)     ; 在 Window 显示行号
(global-auto-revert-mode t)              ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(which-key-mode 1)                       ; which-key
(set-face-attribute 'default nil :font "Maple Mono Normal NF CN-16")    ; 设置字体

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 添加自定义配置文件路径
(require 'init-evil)          ; 设置 evil
(require 'init-org)           ; 设置 org-mode
(require 'init-doom-themes)   ; 设置 doom-themes

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
