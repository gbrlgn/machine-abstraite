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
             '(font . "Fira Code-20"))

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(when window-system (set-frame-size (selected-frame) 300 200))

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-verbose t))

(use-package benchmark-init
  :ensure t)

(require 'time-date)
(require 'rust-mode)
(require 'go-mode)