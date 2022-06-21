;;; config-theme --- Emacs theme config.
;;; Commentary:
;;; The color theme and font.
;;; I change this all the time...
;;; The "Hack" font has to be installed separately.
;;; https://github.com/source-foundry/Hack
;;;
;;; Code:

;;; Colors
(defun theme-load (theme)
  "Configured and load the theme."
  (load-theme theme t t)
  (enable-theme theme))

;; (use-package zenburn-theme
;;   :ensure t
;;   :defer t
;;   :init (theme-load 'zenburn))

;; (use-package apropospriate-theme
;;   :ensure t
;;   :config (load-theme 'apropospriate-dark t))


(use-package atom-one-dark-theme
  :ensure t
  :defer t
  :init (theme-load 'atom-one-dark))

 ;;; Font
 (set-face-attribute 'default nil
 		    :height 160
 		    :family "Hack")

(provide 'config-theme)
;;; config-theme.el ends here
