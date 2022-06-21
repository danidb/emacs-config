;;; config-core --- Dan's core emacs config
;;; Commentary:
;;; Code:
(setq user-full-name "Daniel Del Balso"
      user-mail-address "daniel@dataopera.io")

(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t))

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs `exec-path` and PATH environment variables.
Should match that used by the user's shell.  This is particularly useful
under Mac OS X and macOS, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string
			  "[ \t\n]*$" "" (shell-command-to-string
					  "$SHELL --login -c 'echo $PATH'"
					  ))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(add-to-list 'load-path (file-name-directory load-file-name))

(require 'config-theme)
(require 'config-projects)
(require 'config-editing)
(require 'config-ui)
(require 'config-envs)
(require 'config-org)


;; Automatically reload buffers that change on disk
(global-auto-revert-mode t)

;;; Input
(setq mouse-wheel-tilt-scroll t)
(setq mouse-wheel-flip-direction t)


;;; Hydras
(global-set-key (kbd "C-c h") 'hydra-hideshow/body)
(global-set-key (kbd "C-c t") 'hydra-tabbar/body)
(global-set-key (kbd "C-c p") 'hydra-projectile/body)
(global-set-key (kbd "C-c w") 'hydra-window/body)

;;; Undo/Redo
(global-set-key (kbd "C-z") 'undo-only)
(global-set-key (kbd "C-S-z") 'undo-redo)

;;; Ivy/Swiper
(global-set-key (kbd "C-<return>") 'ivy-immediate-done)
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-c 1 f") 'counsel-describe-function)
(global-set-key (kbd "C-c 1 v") 'counsel-describe-variable)
(global-set-key (kbd "C-c 1 l") 'counsel-find-library)
(global-set-key (kbd "C-c 2 i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "C-c 2 u") 'counsel-unicode-char)
(global-set-key (kbd "C-c 2 j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

;;; Multiple cursors - TODO should make a hydra for this
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "M-n")  'mc/mark-next-like-this)
(global-set-key (kbd "M-p")  'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a")  'mc/mark-all-like-this)

;;; Indentation
(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)

;; Shell
(use-package exec-path-from-shell
  :ensure t)
(exec-path-from-shell-initialize)

(provide 'config-core)
;;; config-core.el ends here
