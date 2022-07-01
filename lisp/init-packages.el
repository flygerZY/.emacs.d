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
  :bind (("C-c d" . youdao-dictionary-search-at-point))
  :init
  (setq url-automatic-caching t
	youdao-dictionary-use-chinese-word-segmentation t)) ; 中文分词



;;;;; ivy counsel swiper
;;;(use-package ivy
;;;  :ensure t
;;;  :diminish (ivy-mode)
;;;  :bind (("C-x b" . ivy-switch-buffer))
;;;  :config
;;;  (ivy-mode 1)
;;;  (setq ivy-use-virtual-buffers t)
;;;  (setq ivy-count-format "%d/%d ")
;;;  (setq ivy-display-style 'fancy))
;;;
;;;(use-package counsel	     
;;;:ensure t		     
;;;  :bind			     
;;;  (("M-y" . counsel-yank-pop)
;;;   :map ivy-minibuffer-map   
;;;   ("M-y" . ivy-next-line))) 
;;;
;;;(use-package swiper
;;;  :ensure t
;;;  :bind (("C-s" . swiper-isearch)
;;;	 ("C-r" . swiper-isearch)
;;;	 ("C-c C-r" . ivy-resume)
;;;	 ("M-x" . counsel-M-x)
;;;	 ("C-x C-f" . counsel-find-file))
;;;  :config
;;;  (progn
;;;    (ivy-mode 1)
;;;    (setq ivy-use-virtual-buffers t)
;;;    (setq ivy-display-style 'fancy)
;;;    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
;;;    ))

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
  :bind ("M-g l" . avy-goto-line)) 

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
;;(use-package highlight-symbol
;;  :ensure t
;;  :init (highlight-symbol-mode)
;;  :bind ("C-<f3>" . highlight-symbol)
;;  :bind ("S-<f3>" . highlight-symbol-prev);; 按下 F3 键就可高亮当前符号
;;  :bind ("<f3>" . highlight-symbol-next)) ;; 按下 F3 键就可高亮当前符号

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

;;--------------------------------------------------------------------------------
(use-package simple
  :ensure nil
  :hook (after-init . size-indication-mode)
  :init
  (progn
    (setq column-number-mode t)
    ))

;;modeline上显示我的所有的按键和执行的命令
(package-install 'keycast)
(add-to-list 'global-mode-string '("" keycast-mode-line))
(keycast-mode t)

;; 这里的执行顺序非常重要，doom-modeline-mode 的激活时机一定要在设置global-mode-string 之后‘
;; --------------------------------------------------------------------------------
;; doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode t))
  ;;:hook (after-init . doom-modeline-mode))

;; restart-emacs
(use-package restart-emacs
  :ensure t)

;; switch window fast
(use-package ace-window
  :bind ("C-x o" . ace-window))

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
;;;;; dashboard
;;;(use-package dashboard
;;;  :ensure t
;;;  :config
;;;  (setq dashboard-banner-logo-title "Hello Luna , Welcome to Emacs!") ;; 个性签名，随读者喜好设置
;;;  ;; (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
;;;  (setq dashboard-startup-banner 'official) ;; 也可以自定义图片
;;;  (setq dashboard-items '((recents  . 5)   ;; 显示多少个最近文件
;;;			              (bookmarks . 5)  ;; 显示多少个最近书签
;;;			              (projects . 10))) ;; 显示多少个最近项目
;;;  :init
;;;  (dashboard-setup-startup-hook))



;; --------------------------------------------------------------------------------
;;;; awesome tab
;;(use-package awesome-tab
;;  :load-path "~/lisp"
;;  :config
;;  (awesome-tab-mode t))
(add-to-list 'load-path (expand-file-name "~/elisp"))

(require 'awesome-tab)

;;(awesome-tab-mode t)
;; --------------------------------------------------------------------------------
;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))
;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  ;; (setq read-extended-command-predicate
  ;;       #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))
;; Example configuration for Consult
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind (;; C-c bindings (mode-specific-map)
         ;;("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ("<help> a" . consult-apropos)            ;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ;;("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s d" . consult-find)
         ("M-s D" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("C-s" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("C-s" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Optionally configure the register formatting. This improves the register
  ;; preview for `consult-register', `consult-register-load',
  ;; `consult-register-store' and the Emacs built-ins.
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

  ;; Optionally tweak the register preview window.
  ;; This adds thin lines, sorting and hides the mode line of the window.
  (advice-add #'register-preview :override #'consult-register-window)

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  ;; Configure other variables and modes in the :config section,
  ;; after lazily loading the package.
  :config

  ;; Optionally configure preview. The default value
  ;; is 'any, such that any key triggers the preview.
  ;; (setq consult-preview-key 'any)
  ;; (setq consult-preview-key (kbd "M-."))
  ;; (setq consult-preview-key (list (kbd "<S-down>") (kbd "<S-up>")))
  ;; For some commands and buffer sources it is useful to configure the
  ;; :preview-key on a per-command basis using the `consult-customize' macro.
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-recent-file
   consult--source-project-recent-file
   :preview-key (kbd "M-."))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<") ;; (kbd "C-+")

  ;; Optionally make narrowing help available in the minibuffer.
  ;; You may want to use `embark-prefix-help-command' or which-key instead.
  ;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

  ;; By default `consult-project-function' uses `project-root' from project.el.
  ;; Optionally configure a different project root function.
  ;; There are multiple reasonable alternatives to chose from.
  ;;;; 1. project.el (the default)
  ;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. projectile.el (projectile-project-root)
  ;; (autoload 'projectile-project-root "projectile")
  ;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 3. vc.el (vc-root-dir)
  ;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 4. locate-dominating-file
  ;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
  )
;; --------------------------------------------------------------------------------
;; Enable richer annotations using the Marginalia package
(use-package marginalia
  ;; Either bind `marginalia-cycle` globally or only in the minibuffer
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))
;; --------------------------------------------------------------------------------
(use-package embark
  :ensure t

  :bind
  (("C-." . embark-act)         ;; pick some comfortable binding
   ("C-;" . embark-dwim)        ;; good alternative: M-.
   ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'

  :init

  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)

  :config

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

;; Consult users will also want the embark-consult package.
(use-package embark-consult
  :ensure t
  :after (embark consult)
  :demand t ; only necessary if you have the hook below
  ;; if you want to have consult previews as you move around an
  ;; auto-updating embark collect buffer
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
;; --------------------------------------------------------------------------------
;; symbol-overlay
;;;  a highlight-symbol replacement.
(use-package symbol-overlay
  :config
  (setq symbol-overlay-map (make-sparse-keymap))
  (setq my/symbol-overlay-keymap (make-sparse-keymap))
  ;;(define-key my/symbol-overlay-keymap (kbd "h") 'symbol-overlay-put)
  ;;(define-key (kbd "<f3>") 'symbol-overlay-put)
  ;;(define-key my/symbol-overlay-keymap (kbd "n") 'symbol-overlay-jump-next)
  (define-key my/symbol-overlay-keymap (kbd "p") 'symbol-overlay-jump-prev)
  (define-key my/symbol-overlay-keymap (kbd "w") 'symbol-overlay-save-symbol)
  (define-key my/symbol-overlay-keymap (kbd "t") 'symbol-overlay-toggle-in-scope)
  (define-key my/symbol-overlay-keymap (kbd "e") 'symbol-overlay-echo-mark)
  (define-key my/symbol-overlay-keymap (kbd "d") 'symbol-overlay-jump-to-definition)
  (define-key my/symbol-overlay-keymap (kbd "s") 'symbol-overlay-isearch-literally)
  (define-key my/symbol-overlay-keymap (kbd "q") 'symbol-overlay-query-replace)
  (define-key my/symbol-overlay-keymap (kbd "r") 'symbol-overlay-rename)
  (global-set-key (kbd "C-c h") my/symbol-overlay-keymap)
  :bind
  ("C-<f3>" . symbol-overlay-put)
  ("<f3>" . symbol-overlay-jump-next)
  )
;; --------------------------------------------------------------------------------
(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically nil))

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))
;; --------------------------------------------------------------------------------
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(provide 'init-packages)
;;; init-packages.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
