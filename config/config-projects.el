;;; config-projects --- Configuration for dealing with projects
;;; Commentary:
;;; Code:

(setq projectile-paths '("~/dev/repos"
			 "~/dev/client-repos"
			 "~/.emacs.d"))
(use-package projectile
  :ensure t
  :init (projectile-mode 1)
  :bind
  (:map projectile-mode-map ("s-p" . projectile-command-map))
  :custom
  (setq projectile-project-search-path projectile-paths))


(provide 'config-projects)
;;; config-projects.el ends here
