;;; config-envs --- Programming environments
;;; Commentary:
;;; Code:

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

(use-package js2-mode
  :ensure t)

(require 'web-mode)
(use-package tide
  :ensure t
  :custom (progn (interactive)
		 (tide-setup)
		 (setq flycheck-check-syntax-automatically '(save mode-enabled))
		 (eldoc-mode 1)
		 (tide-hl-identifier-mode 1)
		 (add-hook 'before-save-hook 'tide-format-before-save)
		 (add-hook 'typescript-mode-hook #'setup-tide-mode)
		 (add-hook 'js2-mode-hook #'setup-tide-mode)
		 (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
		 (add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
		 (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
		 (add-hook 'web-mode-hook
			   (lambda ()
			     (when (string-equal "jsx" (file-name-extension buffer-file-name))
			       (setup-tide-mode))))


		 (flycheck-add-mode 'javascript-eslint 'web-mode)
		 (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)))

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
