(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(global-linum-mode 1)

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(add-to-list 'default-frame-alist
             '(font . "Go Mono-20"))

(when window-system
  (set-frame-size (selected-frame) 93 93))

(load-theme 'Inconfidente t)
