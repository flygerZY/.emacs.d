;;; init-org.el --- configs for startup -*- lexical-binding: t -*-
;;; Commentary:
;; (c) zhangyang, 2022-

;;; Code:

;;(setq org-ellipsis "⤵")
(defun my/org-mode-setup ()
    "Setup orgmode."
    (org-indent-mode)
    (variable-pitch-mode 1)
    (auto-fill-mode 0)
    (visual-line-mode 1))

(use-package org
  :hook (org-mode . my/org-mode-setup)
  :config
  (setq org-ellipsis " ▼")
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-states-order-reversed t)
  (setq org-log-into-drawer t)
  ;;(setq org-agenda-files
  ;;      (file-expand-wildcards "~/TODO/*.org"))
  (setq org-todo-keywords
      '(
        (sequence "IDEA(i)" "TODO(t)" "STARTED(s)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")))
  )

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode))
(setq org-bullets-bullet-list '( "⦿" "○" "◆" "✿" "✸" ))

(provide 'init-org)
;;; init-org.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
