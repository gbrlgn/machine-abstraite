;; Place your bindings here.

(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontal)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontal)

(define-key global-map (kbd "RET") 'newline-and-indent)