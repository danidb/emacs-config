;;; config-editing --- Editing mechanics
;;; Commentary:
;;; Code:

;; File
(use-package f
  :ensure t)

;;; Backups
(setq temporary-file-directory "~/.emacs.backups")
(setq backup-directory-alist `(("." . "~/.saves")))

;; Undo/Redo (Emacs 28), undo-tree
(use-package undo-tree
  :ensure t)

;;; Automatically delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Helpful Hydras
(use-package hydra
  :ensure t)

(add-to-list 'load-path (f-join (file-name-directory load-file-name) "hydras"))
(require 'config-hydras-hideshow)
(require 'config-hydras-tabbar)
(require 'config-hydras-projectile)
(require 'config-hydras-window)

;;; Multiple cursors
(use-package multiple-cursors
  :ensure t)

;; Un-indent
(defun un-indent-by-removing-4-spaces ()
  "Remove 4 spaces from beginning of of line."
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))


;; Autocomplete
(use-package company
  :defer 2
  :diminish
  :custom
  (company-begin-commands '(self-insert-command))
  (company-idle-delay .1)
  (company-minimum-prefix-length 2)
  (company-show-numbers t)
  (company-tooltip-align-annotations 't)
  (global-company-mode t))
(use-package company-box
  :after company
  :diminish
  :hook (company-mode . company-box-mode))


;; Linting
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


;; Line Numebers
(global-display-line-numbers-mode)
(add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))


(provide 'config-editing)
;;; config-editing.el ends here
