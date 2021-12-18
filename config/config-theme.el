;;; config-theme --- Emacs theme config.
;;; Commentary:
;;; The color theme and font. Lately I'm really into
;;; the "nord" color palette. https://www.nordtheme.com/
;;;
;;; The "Hack" font has to be installed separately.
;;; https://github.com/source-foundry/Hack
;;;
;;; Code:

;;; Colors
(defun theme-load (theme)
  "Configured and load the theme."
  (load-theme theme t t)
  (enable-theme theme))

(use-package nord-theme
  :ensure t
  :defer t
  :init (theme-load 'nord))

;;; Font
(set-face-attribute 'default nil
		    :height 140
		    :family "Hack")


(provide 'config-theme)
;;; config-theme.el ends here
