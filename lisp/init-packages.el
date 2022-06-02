;;; init-packages.el 
;;; Commentary:
;; (c) zhangyang, 2022-

;;; Code:

;; Auto update packages
;; this maybe useful, if you want to update all the packages with command, just like me
(use-package auto-package-update
  :init (setq auto-package-update-delete-old-versions t
	          auto-package-update-hide-results t))

;; Settings for company, auto-complete for texting, coding, etc.
(use-package company
  :hook (after-init . global-company-mode)
  :config (setq company-minimum-prefix-length 1
                company-show-quick-access t))

;; Settings for which-key - suggest next key
(use-package which-key
  :diminish
  :hook (after-init . which-key-mode))

;; try
(use-package try
  :ensure t)

;; Youdao Dictionary
(use-package youdao-dictionary
  :ensure t
  :bind (("C-c y" . youdao-dictionary-search-at-point))
  :init
  (setq url-automatic-caching t
	youdao-dictionary-use-chinese-word-segmentation t)) ; 中文分词



;; ivy counsel swiper
(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "%d/%d ")
  (setq ivy-display-style 'fancy))

(use-package counsel	     
:ensure t		     
  :bind			     
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map   
   ("M-y" . ivy-next-line))) 

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper-isearch)
	 ("C-r" . swiper-isearch)
	 ("C-c C-r" . ivy-resume)
	 ("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

;; info-colors, make the info manual as colorful
(use-package info-colors
  :hook (Info-selection . info-colors-fontify-node))

;; move-dup, move/copy line or region
(use-package move-dup
  :hook (after-init . global-move-dup-mode)
  :bind (("M-p"   . move-dup-move-lines-up)
         ("C-M-p" . move-dup-duplicate-up)
         ("M-n"   . move-dup-move-lines-down)
         ("C-M-n" . move-dup-duplicate-down)))

;;;; neotree, file tree manager
;;(use-package neotree
;;  :commands (neo-buffer--lock-width neo-buffer--unlock-width)
;;  :config (setq neo-autorefresh t
;;		        neo-theme 'nerd
;;		        neo-click-changes-root t
;;		        neo-smart-open t)
;;  :bind ("<f5>" . neotree-toggle))
(use-package treemacs
  :ensure t
  :defer t
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

;; test emacs init time
(use-package benchmark-init
             :init (benchmark-init/activate)
             :hook (after-init . benchmark-init/deactivate))

;; 使用char-based决策树跳转到可见文本
(use-package avy
  :ensure t
  :bind ("M-j" . avy-goto-char-timer)
  :bind ("M-g w" . avy-goto-word-1)
  :bind ("C-'" . avy-goto-char-2)
  :bind ("C-:" . avy-goto-char)
  :bind ("M-g f" . avy-goto-line)) 

;; undo tree
(use-package undo-tree
      :ensure t
      :init
      (global-undo-tree-mode t)
      (setq undo-tree-auto-save-history nil))

;; all the  icons
(use-package all-the-icons 
  :ensure t
  :defer 0.5)

(use-package all-the-icons-ivy
  :ensure t
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window ivy-switch-buffer))
  :config
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-dired-jump)
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-find-library)
  (all-the-icons-ivy-setup))

(use-package diredfl
  :ensure t
  :config (diredfl-global-mode t))

(use-package all-the-icons-dired
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))


;; highlight-symbol
(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("C-c h" . highlight-symbol) ;; 按下 F3 键就可高亮当前符号
  :bind ("<f3>" . highlight-symbol-next)) ;; 按下 F3 键就可高亮当前符号

;; rainbow-delimiter
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; mwim
(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
  ;;:hook (after-init . doom-modeline-mode))

;; restart-emacs
(use-package restart-emacs
  :ensure t)

;; switch window fast
(use-package ace-window
  :bind ("C-x o" . ace-window))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-packages)
;;; init-packages.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
