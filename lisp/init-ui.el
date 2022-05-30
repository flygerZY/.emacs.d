;;; init-ui.el --- configs for startup -*- lexical-binding: t -*-
;;; Commentary:
;; (c) zhangyang, 2022-

;;; Code:
;; 启动全屏
;;(add-hook 'window-setup-hook #'toggle-frame-fullscreen)
;;设置窗口位置为屏库左上角(0,0)
(set-frame-position (selected-frame) 0 0)
;; 设置宽和高
(set-frame-width (selected-frame) 100)
(set-frame-height (selected-frame) 33)


;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式（不能生效，解决方案见第二集）
(setq-default cursor-type 'bar)

;;关闭欢迎界面
(setq inhibit-startup-screen t)

;;让鼠标滚动更好用
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;hight line
(global-hl-line-mode t)


;; default
(set-face-attribute 'default nil :font (font-spec :family "Monaco"
                          :size 14))

(when (eq system-type 'darwin)
  (setq fonts '("SF Mono" "冬青黑体简体中文"))
  (set-fontset-font t 'unicode "Apple Color Emoji" nil 'prepend)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 14)))

(when (eq system-type 'windows-nt)
  (setq fonts '("Monaco" "文泉译微米黑"))
  (set-fontset-font t 'unicode "Segoe UI Emoji" nil 'prepend)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 14)))

(when (eq system-type 'gnu/linux)
  (setq fonts '("Source Code Pro" "思源黑体"))
  (set-fontset-font t 'unicode "Noto Color Emoji" nil 'prepend)
  (set-face-attribute 'default nil :font
                      (format "%s:pixelsize=%d" (car fonts) 14)))

;;;;;font
;;;(defvar cn-fonts-list '("文泉译微米黑" "黑体" "STHeiti" "微软雅黑" )
;;;  "定义使用的中文字体候选列表.")
;;;
;;;(defvar en-fonts-list '("Monaco" "Cascadia Code" "Courier New"  "Ubuntu Mono")
;;;  "定义使用的英文字体候选列表.")
;;;
;;;(defvar emoji-fonts-list '("Apple Color Emoji" "Segoe UI Emoji" "Noto Color Emoji" "Symbola" "Symbol")
;;;  "定义使用Emoji字体候选列表.")
;;;
;;;;;;###autoload
;;;(defun tenon--font-setup ()
;;;  "Font setup."
;;;
;;;  (interactive)
;;;  (let* ((cf (tenon--available-font cn-fonts-list))
;;;	     (ef (tenon--available-font en-fonts-list))
;;;         (em (tenon--available-font emoji-fonts-list)))
;;;    (when ef
;;;      (dolist (face '(default fixed-pitch fixed-pitch-serif variable-pitch))
;;;	    (set-face-attribute face nil :family ef)))
;;;    (when em
;;;      (dolist (charset `(unicode unicode-bmp ,(if (> emacs-major-version 27) 'emoji 'symbol)))
;;;        (set-fontset-font t charset em nil 'prepend)))
;;;    (when cf
;;;      (dolist (charset '(kana han cjk-misc bopomofo))
;;;	    (set-fontset-font t charset cf))
;;;      (setq face-font-rescale-alist
;;;	    (mapcar (lambda (item) (cons item 1.2)) `(,cf ,em))))))
;;;


(provide 'init-ui)
;;; init-ui.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
