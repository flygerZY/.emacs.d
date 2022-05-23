
;; keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)

;; --------------------------------------------------------------------------------
;; make ibuffer default and show better
(defalias 'list-buffers 'ibuffer)
(setq ibuffer-saved-filter-groups
	(quote (("default"
		 ("dired" (mode . dired-mode))
		 ("org" (name . "^.*org$"))
		 ("magit" (mode . magit-mode))
		 ("web" (or (mode . web-mode) (mode . js2-mode)))
		 ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
		 ("programming" (or
				 (mode . verilog-mode)
                                 (mode . c-mode)
				 (mode . ess-r-mode)
				 (mode . python-mode)
				 (mode . c++-mode)))
		 ("emacs" (or
			   (name . "^\\*scratch\\*$")
			   (name . "^\\*Messages\\*$")))
		 ))))
  (add-hook 'ibuffer-mode-hook
	    (lambda ()
	      (ibuffer-auto-mode 1)
	      (ibuffer-switch-to-saved-filter-groups "default")))
;; --------------------------------------------------------------------------------
(use-package magit
     :ensure t
     :bind
     ("C-x g" . magit-status)
     )

(use-package git-gutter
     :ensure t
     :config
     (global-git-gutter-mode +1)
     )

;; --------------------------------------------------------------------------------


(use-package posframe
    :ensure t
    )

(use-package expand-region
  :ensure t
  :bind("C-=" . er/expand-region)
  )

;; --------------------------------------------------------------------------------
;; dashboard
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Hello Luna , Welcome to Emacs!") ;; 个性签名，随读者喜好设置
  ;; (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
			  (bookmarks . 5)  ;; 显示多少个最近书签
			  (projects . 10))) ;; 显示多少个最近项目
  :init
  (dashboard-setup-startup-hook))





(provide 'init-test)
