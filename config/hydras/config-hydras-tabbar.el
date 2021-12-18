;;; config-hydras-tabbar --- Helpful hydra for tabbar
;;; Commentary:
;;; Code:
(defhydra hydra-tabbar (:color amaranth)
  "Tab Bar Operations"
    ("t" tab-new "Create a new tab" :column "Creation")
    ("d" dired-other-tab "Open Dired in another tab")
    ("f" find-file-other-tab "Find file in another tab")
    ("0" tab-close "Close current tab")
    ("m" tab-move "Move current tab" :column "Management")
    ("r" tab-rename "Rename Tab")
    ("<return>" tab-bar-select-tab-by-name "Select tab by name" :column "Navigation")
    ("l" tab-next "Next Tab")
    ("j" tab-previous "Previous Tab")
      ("w" (progn
           (hydra-window/body)
           (hydra-push '(hydra-tab-bar/body)))
     "Manage Windows" :exit t :column "Others")
    ("SPC" nil "Cancel" :exit t))


(provide 'config-hydras-tabbar)
;;; config-hydras-tabbar.el ends here
