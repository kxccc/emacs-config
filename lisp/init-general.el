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

(my-leader
 :prefix
 nil
 "C-h"
 #'windmove-left
 "C-j"
 #'windmove-down
 "C-k"
 #'windmove-up
 "C-l"
 #'windmove-right)

(provide 'init-general)
