;; -*- lexical-binding: t; -*-

(use-package vertico :init (vertico-mode))

(use-package
 orderless
 :custom (completion-styles '(orderless basic))
 (completion-category-overrides
  '((file (styles partial-completion)))))

(use-package
 consult
 :general
 (my-leader
  "f b"
  #'consult-buffer
  "f f"
  #'consult-find
  "f g"
  #'consult-ripgrep))

(provide 'init-completion)
