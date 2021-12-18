;;; config-hydras-hideshow --- Helpful hydra for hide-show
;;; Commentary:
;;; Code:
(defhydra hydra-hideshow (:idle 1.0)
   "
Hide^^            ^Show^            ^Toggle^    ^Navigation^
----------------------------------------------------------------
_h_ hide all      _s_ show all      _t_oggle    _n_ext line
_d_ hide block    _a_ show block              _p_revious line
_l_ hide level

_SPC_ cancel
"
   ("s" hs-show-all)
   ("h" hs-hide-all)
   ("a" hs-show-block)
   ("d" hs-hide-block)
   ("t" hs-toggle-hiding)
   ("l" hs-hide-level)
   ("n" forward-line)
   ("p" (forward-line -1))
   ("SPC" nil)
)


(provide 'config-hydras-hideshow)
;;; config-hydras-hideshow.el ends here
