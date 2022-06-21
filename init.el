;;; init.el --- Emacs init file
;;; Commentary:
;;; Dan's Emacs init file.
;;; Code:
(add-to-list 'load-path "~/.emacs.d/config/")

(require 'config-core)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(exec-path-from-shell yaml-mode zenburn-theme distinguished-theme minimap prettier-js rjsx-mode web-mode undo-tree treemacs-projectile timu-spacegrey-theme tide tangotango-theme spacegray-theme quelpa-use-package nord-theme nano-theme multiple-cursors mood-line markdown-mode magit json-mode js2-mode jazz-theme ivy-posframe hl-todo highlight-indent-guides gruvbox-theme graphql-mode ess doom-modeline counsel company-jedi company-box atom-one-dark-theme alect-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hydra-posframe ((t (:background "#282a36"))))
 '(hydra-posframe-border-face ((t (:background "#6272a4"))))
 '(ivy-posframe ((t (:background "#282a36"))))
 '(ivy-posframe-border ((t (:background "#6272a4"))))
 '(ivy-posframe-cursor ((t (:background "#61bfff")))))
