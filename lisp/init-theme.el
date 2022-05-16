;;; init-theme.el --- configs for startup -*- lexical-binding: t -*-
;;; Commentary:
;; (c) zhangyang, 2022-

;;; Code:

(use-package emacs
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-region '(bg-only no-extend))
  :config
  ;; Load the theme of your choice:
  (load-theme 'modus-operandi) ;; OR (load-theme 'modus-vivendi)
  ;;:bind ("<f5>" . modus-themes-toggle)
  )

(provide 'init-theme)
;;; init-theme.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
