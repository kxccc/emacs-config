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

;; evil
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode 1)
  (define-key evil-normal-state-map (kbd "SPC") 'evil-window-map))

;; evil-org
(use-package evil-org
  :after (evil org)
  :hook (org-mode . evil-org-mode)
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(electric-pair-mode 1)            ; 自动补全括号
(column-number-mode 1)            ; 在 Mode line 上显示列号
(global-display-line-numbers-mode 1)     ; 在 Window 显示行号
(which-key-mode 1) ; which-key
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono-16") ; 设置字体

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 设定源码加载路径
(require 'init-org)

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
