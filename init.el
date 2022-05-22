;;; init.el --- configs for startup -*- lexical-binding: t -*-
;;; Commentary:
;; (c) zhangyang, 2022-

;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq custom-file (expand-file-name "~/.emacs.d/lisp/custom.el"))
(load custom-file 'no-error 'no-message)

;; #platform
;; -----------------------------------------------------------------
(require 'init-platform)

;; # 存放使用编辑器接口产生的配置信息
;; -----------------------------------------------------------------
(require 'custom)

;; # elpa
;; -----------------------------------------------------------------
(require 'init-elpa)

;; # 增强内置功能
;; -----------------------------------------------------------------
(require 'init-better-default)

;; # 快捷键绑定
;; -----------------------------------------------------------------
(require 'init-keybindings)

;; # Org 模式相关的全部设定
;; -----------------------------------------------------------------
(require 'init-org)

;; # 视觉层配置
;; -----------------------------------------------------------------
(require 'init-ui)

;; # theme
;; -----------------------------------------------------------------
(require 'init-theme)



;; # 插件管理
;; -----------------------------------------------------------------
(require 'init-packages)

;; # verilog mode
;; --------------------------------------------------
(require 'init-verilog-mode)

;; # 测试
;;--------------------------------------------------
(require 'init-test)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
(put 'upcase-region 'disabled nil)
