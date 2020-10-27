
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(require-package 'company)

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
(setq company-tooltip-limit 20)

(setq company-dabbrev-downcase nil)
(setq company-dabbrev-ignore-case t)

(setq company-dabbrev-code-ignore-case t)
(setq company-dabbrev-code-everywhere t)

(setq company-etags-ignore-case t)

(setq company-global-modes
      '(not
	comint-mode
	erc-mode
	eshell-mode
	fundamental-mode
	org-mode
	term-char-mode
	term-line-mode
	term-mode
	text-mode))

(global-company-mode)

(require-package 'company-quickhelp)
(setq company-quickhelp-delay 0.1)
(company-quickhelp-mode 1)

(provide 'init-company)
