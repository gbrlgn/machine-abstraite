;;; Inconfidente
;;; Version: 0.0
;;; Commentary:
;;; Nonada
;;; Code:

(deftheme Inconfidente "LIBERTAS QUAE SERA TAMEN")
  (custom-theme-set-faces 'Inconfidente
   '(default ((t (:foreground "#a89f93" :background "#242424" ))))
   '(cursor ((t (:background "#6b7a62" ))))
   '(fringe ((t (:background "#1e1e1e" ))))
   '(mode-line ((t (:foreground "#1e1e1e" :background "#a89f93" ))))
   '(region ((t (:background "#504945" ))))
   '(secondary-selection ((t (:background "#7f796f" ))))
   '(font-lock-builtin-face ((t (:foreground "#4e5366" ))))
   '(font-lock-comment-face ((t (:foreground "#303030" ))))
   '(font-lock-function-name-face ((t (:foreground "#4e5366" ))))
   '(font-lock-keyword-face ((t (:foreground "#664949" ))))
   '(font-lock-string-face ((t (:foreground "#56664c" ))))
   '(font-lock-type-face ((t (:foreground "#664949" ))))
   '(font-lock-constant-face ((t (:foreground "#6d614a" ))))
   '(font-lock-variable-name-face ((t (:foreground "#4d6664" ))))
   '(minibuffer-prompt ((t (:foreground "#56664c" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "664949" :bold t ))))
   )

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'Inconfidente)

;;; Inconfidente-theme.el ends here
