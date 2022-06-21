;;; config-envs --- Programming environments
;;; Commentary:
;;; Code:

;; YAML
(use-package yaml-mode
  :ensure t)

;; js, ts, React, markdown
(use-package json-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package graphql-mode
  :ensure t)

;; JS, JSX, TS, TSX
(setq-default lsp-log-io nil)
(setq-default lsp-print-io nil)
(setq-default lsp-keymap-prefix "C-c l")
(setq-default lsp-restart 'auto-restart)
(setq-default lsp-ui-sideline-show-diagnostics t)
(setq-default lsp-ui-sideline-show-hover t)
(setq-default lsp-ui-sideline-show-code-actions t)

(use-package lsp-mode
  :ensure t
  :hook ((web-mode . lsp-deferred)
	 (lsp-mode . ksp-enable-which-key-integration))

  :commands lsp-deffered)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(setq-default web-mode-markup-indent-offset 2)
(setq-default web-mode-code-indent-offset 2)
(setq-default web-mode-css-indent-offset 2)
(setq-default web-mode-enable-auto-indentation nil) ;; Don't indent when I yank etc.
(setq-default web-mode-enable-auto-quoting nil) ;; Don't add quotes after =
(use-package web-mode
  :ensure t
  :mode (("\\.js\\'" . web-mode)
	 ("\\.jsx\\'" .  web-mode)
	 ("\\.ts\\'" . web-mode)
	 ("\\.tsx\\'" . web-mode)
	 ("\\.html\\'" . web-mode))
  :commands web-mode)

(use-package prettier-js
  :ensure t)

(defun enable-minor-mode (my-pair)
  "Enable minor mode if filename match the regexp.  MY-PAIR is a cons cell (regexp . minor-mode)."
  (if (buffer-file-name)
      (if (string-match (car my-pair) buffer-file-name)
	  (funcall (cdr my-pair)))))

(use-package prettier-js
  :ensure t)
(add-hook 'web-mode-hook #'(lambda ()
                             (enable-minor-mode
                              '("\\.jsx?\\'" . prettier-js-mode))
			     (enable-minor-mode
                              '("\\.js?\\'" . hs-minor-mode)) ;; hideshow
			     (enable-minor-mode
                              '("\\.jsx?\\'" . hs-minor-mode))
			     (enable-minor-mode
			      '("\\.tsx?\\'" . prettier-js-mode))
			     (enable-minor-mode
			      '("\\.ts?\\'" . hs-minor-mode))
			     (enable-minor-mode
                              '("\\.tsx?\\'" . hs-minor-mode))))



;; python
(use-package company-jedi
  :ensure t
  :custom (progn (add-to-list 'company-backends 'company-jedi)
		 (add-hook 'python-mode-hook 'my/python-mode-hook)))

;; R <3
(use-package ess
  :ensure t
  :init (require 'ess-site))

(provide 'config-envs)
;;; config-envs.el ends here
