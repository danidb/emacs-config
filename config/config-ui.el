;;; config-ui --- User interface customization
;;; Commentary:
;;; The default position of ivy-posframe, hydras, swiper,
;;; is changed because I have a very wide monitor.  Having
;;; this information in the center of the screen is far
;;; more comfortable for me.
;;; Code:

;;; scroll bar, tool bar, etc.
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;;; disable the bells
(setq visible-bell 'nil)
;; TODO: should have something here, consider flashing the modline
(setq ring-bell-function 'ignore)

;;; modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;; counsel, ivy, swiper
(use-package counsel
  :ensure t
  :init (ivy-mode)
  :custom (progn
	   (setq ivy-use-virtual-buffers t)
	   (setq ivy-count-format "(%d/%d) ")
	   (setq enable-recursive-minibuffers t)))
(use-package ivy-posframe
  :ensure t
  :custom
  (ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
  (ivy-posframe-width 130)
  (ivy-posframe-height 11)
  (ivy-posframe-parameters
   '((left-fringe . 5)
     (right-fringe . 5)))
  :custom-face
  (ivy-posframe ((t (:background "#282a36"))))
  (ivy-posframe-border ((t (:background "#6272a4"))))
  (ivy-posframe-cursor ((t (:background "#61bfff"))))
  :init (ivy-posframe-mode 1))

(use-package hydra-posframe
  :load-path "~/.emacs.d/packages/hydra-posframe/"
 :custom
 (hydra-posframe-parameters
  '((left-fringe . 5)
    (right-fringe . 5)))
 :custom-face
 (hydra-posframe ((t (:background "#282a36"))))
 (hydra-posframe-border-face ((t (:background "#6272a4"))))
 :hook (after-init . hydra-posframe-enable))
(setq hydra-hint-display-type 'posframe)


;; Highlight TODO etc.
(use-package hl-todo
  :ensure t
  :init (global-hl-todo-mode))

(provide 'config-ui)
;;; config-ui.el ends here
