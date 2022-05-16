;;; init.el --- configs for startup -*- lexical-binding: t -*-
;;; Commentary:
;; (c) zhangyang, 2022-

;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq custom-file (expand-file-name "~/.emacs.d/lisp/custom.el"))
(load custom-file 'no-error 'no-message)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(progn
	(defvar emax-root (concat (expand-file-name "~") "/emax"))
	(defvar emax-bin (concat emax-root "/bin"))
	(defvar emax-bin64 (concat emax-root "/bin64"))

	(setq exec-path (cons emax-bin exec-path))
	(setenv "PATH" (concat emax-bin ";" (getenv "PATH")))

	(setq exec-path (cons emax-bin64 exec-path))
	(setenv "PATH" (concat emax-bin64 ";" (getenv "PATH")))

	(setq emacsd-bin (concat user-emacs-directory "bin"))
	(setq exec-path (cons  emacsd-bin exec-path))
	(setenv "PATH" (concat emacsd-bin  ";" (getenv "PATH")))

	;;可选安装msys64
	;;下载地址: http://repo.msys2.org/mingw/sources/
	;;(setenv "PATH" (concat "C:\\msys64\\usr\\bin;C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

	;; (dolist (dir '("~/emax/" "~/emax/bin/" "~/emax/bin64/" "~/emax/lisp/" "~/emax/elpa/"))
	;;   (add-to-list 'load-path dir))
	)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
(put 'upcase-region 'disabled nil)
