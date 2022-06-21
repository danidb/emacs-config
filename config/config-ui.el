;;; config-ui --- User interface customization
;;; Commentary:
;;; The default position of ivy-posframe, hydras, swiper,
;;; is changed because I have a very wide monitor.  Having
;;; this information in the center of the screen is far
;;; more comfortable for me.
;;; Code:

;;; No startup scren (I'll configure this
(use-package dashboard
  :ensure t
  :config (progn
	    (dashboard-setup-startup-hook)
	    (setq dashboard-projects-backend 'projectile)
	    (add-to-list 'dashboard-items '(projects . 3) t)
	    (setq dashboard-set-heading-icons t)
	    (setq dashboard-set-file-icons t)
	    (setq dashboard-set-navigator t)))


(use-package treemacs-projectile
  :ensure t)

(use-package treemacs-all-the-icons
  :ensure t)
(treemacs-load-all-the-icons-with-workaround-font "Hermit")

(use-package treemacs-magit
  :ensure t)

;; Treemacs
(use-package treemacs
  :ensure t
  :config (progn
	    (setq treemacs-indent-guide-style 'line)
	    (treemacs-indent-guide-mode t)))


;;; no blinking cursor
(blink-cursor-mode -1)

;;; menubar, toolbar, etc.
(scroll-bar-mode -1)
(tool-bar-mode -1)

;;; nice scroll behavior (got this from emacs-prelude)
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

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
	   (setq ivy-use-selectable-prompt t)
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

(define-key ivy-minibuffer-map (kbd "<ESC>") 'minibuffer-keyboard-quit)
(define-key swiper-map (kbd "<ESC>") 'minibuffer-keyboard-quit)

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
(toggle-scroll-bar -1)
(provide 'config-ui)
;;; config-ui.el ends here
