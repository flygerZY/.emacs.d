;;; init-keybindings.el --- configs for startup -*- lexical-binding: t -*-
;;; Commentary:
;; (c) zhangyang, 2022-

;;; Code:

;;M(eta)  ：统一改到 left windows 键（Windows）
;;s(uper) ：统一改到left Alt 键（windows）
;;S(Shift)：不用修改
;;C(trl)  ：统一改成 Caps Lock（大小写切换键，这样可以拯救你的小拇指健康
(setq w32-apps-modifier 'super)       ; 通过SharpKeys改成了 Application

(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrl-z 撤销
(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrl-x 剪切

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; --------------------------------------------------------------------------------
;; 快速复制当前行
(defun my-copy-line()
  (interactive)
  (clipboard-kill-region (point-at-bol) (point-at-eol))
  (yank)
  )

(global-set-key (kbd "C-c y") 'my-copy-line)

;; --------------------------------------------------------------------------------
(provide 'init-keybindings)
;;; init-keybindings.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End
