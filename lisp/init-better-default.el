;;; init-better-default.el --- configs for startup -*- lexical-binding: t -*-
;;; Commentary:
;; (c) zhangyang, 2022-

;;; Code:

;;开启servermode
(server-mode 1)

;; System default coding
(set-language-environment 'utf-8)

;;使 Emacs 自动加载外部修改过的文件
;; Keeping buffers automatically up-to-date.
(require 'autorevert)
(global-auto-revert-mode 1)
(setq auto-revert-verbose t
      auto-revert-use-notify nil
      auto-revert-stop-on-user-input nil)

;; auto-fill-mode, Help by command or variable name
(add-hook 'after-init-hook 'auto-fill-mode)

;;关闭自动生产的保存文件
(setq auto-save-default nil)

;;no backup file
;;(setq make-backup-files nil) ;;关闭自动备份
(setq
     backup-by-copying t ; 自动备份
     backup-directory-alist
     '(("." . "~/.em_backup")) ; 自动备份在目录"~/.em_backup"下
     delete-old-versions t ; 自动删除旧的备份文件
     kept-new-versions 3 ; 保留最近的3个备份文件
     kept-old-versions 1 ; 保留最早的1个备份文件
     version-control t) ; 多次备份

;; tab 设置为4个空格
(setq-default indent-tabs-mode nil)         ;tab插入空格
(setq-default tab-width 4)                  ;tab4个字符宽度
(setq indent-line-function 'insert-tab)     ;缩进时插入tab

    

;; use short answers for YES/NO ect.
(setq use-short-answers t)

(provide 'init-better-default)
;;; init-better-default.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
