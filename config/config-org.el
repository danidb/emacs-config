;;; config-org --- Org setup for personap productivity/GTD.
;;; Commentary:
;;; Based on/inspired by the following...
;;; https://github.com/rougier/emacs-gtd
;;; https://www.philnewton.net/blog/how-i-get-work-done-with-emacs/
;;; https://www.lucacambiaghi.com/posts/org-gtd.html
;;; https://www.reddit.com/r/emacs/comments/i1x0d3/gtd_and_orgmode_how_do_you_organize_your_files/
;;; https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
;;;
;;; WORK IN PROGRESS
;;;
;;; Code:
(setq org-directory "~/org")
(setq org-agenda-files '("~/org/inbox.org"))

(setq org-capture-templates
      `(("i" "Inbox" entry (file "inbox.org")
	 ,(concat "* TODO %?\n"
		  "/Entered on/ %U"))))
(define-key global-map (kbd "C-c c") 'org-capture)

(defun org-capture-inbox ()
  (interactive)
  (call-interactively 'org-store-link)
  (org-capture nil "i"))

(define-key global-map (kbd "C-c i") 'org-capture-inbox)

(provide 'config-org)
;;; config-org.el ends here
