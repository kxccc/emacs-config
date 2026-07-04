;; -*- lexical-binding: t; -*-

(defvar my-leader-map)

(use-package
 general
 :config
 (general-create-definer
  my-leader
  :states '(normal visual motion)
  :keymaps 'override
  :prefix-map 'my-leader-map
  :prefix "SPC"))

(provide 'init-general)
