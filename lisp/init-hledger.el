;; -*- lexical-binding: t; -*-

(use-package
 hledger-mode
 :mode ("\\.journal\\'")
 :general (my-leader "j" #'hledger-run-command)
 :custom
 (hledger-jfile
  (expand-file-name "obsidian/ledger/journal.journal" org-directory)) ; 账本文件
 (hledger-reporting-day 1) ; 月份报告从1号开始
 (hledger-currency-string "CNY") ; 补全货币
 )

(use-package
 flymake-hledger
 :hook (hledger-mode . flymake-hledger-enable)
 :config
 (dolist (check '("recentassertions" "tags" "accounts" "commodities"))
   (add-to-list 'flymake-hledger-checks check)))

(provide 'init-hledger)
