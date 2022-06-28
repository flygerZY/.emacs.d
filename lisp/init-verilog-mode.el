;;; init-verilog-mode.el --- configs for startup -*- lexical-binding: t -*-
;;; Commentary:
;; (c) zhangyang, 2022-

;;; Code:



;;;;my verilog mode config
;;(add-to-list 'auto-mode-alist' ("\\.vp\\'" . verilog-mode))   ;;open *.vp file with verilog-mode
;;(add-to-list 'auto-mode-alist' ("\\.svp\\'" . verilog-mode))  ;;open *.svp file with verilog-mode
;;
;;(setq verilog-date-scientific-format t)   ;;dates are written in scientific format (e.g.  1997/09/17)
;;
(setq-default indent-tabs-mode nil)       ;;false tab indent mode
(setq-default tab-width 4)
(setq verilog-indent-level 4)             ;;Indentation of Verilog statements with respect to containing block
(setq verilog-indent-level-module 4)      ;;Indentation of Module level Verilog statements (eg always, initial)
(setq verilog-indent-level-declaration 4) ;;Indentation of declarations with respect to containing block
(setq verilog-case-indent 4)              ;;Indentation for case statements
(setq verilog-cexp-indent 4)              ;;Indentation of Verilog statements split across lines
(setq verilog-indent-lists t)             ;;Indentation of lists, look the under content.
;;;;  "How to treat indenting items in a list.
;;;;If t (the default), indent as:
;;;;	always @( posedge a or
;;;;                reset ) begin
;;;;
;;;;If nil, treat as:
;;;;	always @( posedge a or
;;;;	   reset ) begin"
;;
(setq verilog-indent-level-behavioral 4)  ;;Absolute indentation of first begin in a task or function block
(setq verilog-indent-level-directive 4)   ;;Indentation to add to each level of \\=`ifdef declarations
;;(setq verilog-auto-indent-on-newline t)   ;;Non-nil means automatically indent line after newline
;;(setq verilog-tab-always-indent t)        ;;Non-nil means TAB should always re-indent the current line.
;;                                          ;;A nil value means TAB will only reindent when at the beginning of the line.
;;
;;(setq verilog-indent-begin-after-if t)    ;;Non-nil means indent begin statements following if, else, while, etc. Otherwise, line them up.
;;(setq verilog-auto-newline t)             ;;Non-nil means automatically newline after semicolons and the punctuation mark after an end
;;(setq verilog-auto-endcomments t)         ;;Non-nil means a comment /* ... */ is set after the ends which ends cases, tasks, functions and modules.  The type and name of the object will be set between the braces.
;;(setq verilog-auto-reset-widths t)        ;;True means AUTORESET should determine the width of signals
;;(setq verilog-assignment-delay "#1 ")     ;;Text used for delays in delayed assignments.  Add a trailing space if set
;;(setq verilog-auto-lineup 'all)           ;;
;;;; "Type of statements to lineup across multiple lines.
;;;;If `all' is selected, then all line ups described below are done.
;;;;
;;;;If `declarations', then just declarations are lined up with any
;;;;preceding declarations, taking into account widths and the like,
;;;;so or example the code:
;;;;	reg [31:0] a;
;;;;	reg b;
;;;;would become
;;;;	reg [31:0] a;
;;;;	reg        b;
;;;;
;;;;If `assignment', then assignments are lined up with any preceding
;;;;assignments, so for example the code
;;;;	a_long_variable <= b + c;
;;;;	d = e + f;
;;;;would become
;;;;	a_long_variable <= b + c;
;;;;	d                = e + f;

(provide 'init-verilog-mode)
;;; init-verilog-mode.el ends here
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
