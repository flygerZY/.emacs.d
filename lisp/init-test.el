;; --------------------------------------------------------------------------------
(use-package evil-matchit
  :defer t
  :bind ("C-c j" . evilmi-jump-items-native)
  )
;; --------------------------------------------------------------------------------
;;;(use-package corfu
;;;  ;; Optional customizations
;;;  ;; :custom
;;;  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
;;;   (corfu-auto t)                 ;; Enable auto completion
;;;  ;; (corfu-separator ?\s)          ;; Orderless field separator
;;;  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
;;;  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
;;;  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
;;;  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
;;;  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
;;;  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
;;;  ;; (corfu-scroll-margin 5)        ;; Use scroll margin
;;;
;;;  ;; Enable Corfu only for certain modes.
;;;  ;; :hook ((prog-mode . corfu-mode)
;;;  ;;        (shell-mode . corfu-mode)
;;;  ;;        (eshell-mode . corfu-mode))
;;;
;;;  ;; Recommended: Enable Corfu globally.
;;;  ;; This is recommended since Dabbrev can be used globally (M-/).
;;;  ;; See also `corfu-excluded-modes'.
;;;  :init
;;;  (global-corfu-mode))
;; --------------------------------------------------------------------------------
(defun wttr/prepend-to-exec-path (path)
  "prepand the path to the emacs intenral `exec-path' and \"PATH\" env variable.
Return the updated `exec-path'"
  (setenv "PATH" (concat (expand-file-name path)
                         path-separator
                         (getenv "PATH")))
  (setq exec-path
        (cons (expand-file-name path)
              exec-path)))
(wttr/prepend-to-exec-path "C:\\Program Files\\GnuWin32\\bin")
;; --------------------------------------------------------------------------------
(provide 'init-test)
