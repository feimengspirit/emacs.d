;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'gtags)

(global-set-key "\M-t" 'gtags-find-tag)
(global-set-key "\M-r" 'gtags-find-rtag)
(global-set-key "\M-s" 'gtags-find-symbol)
(global-set-key "\M-p" 'gtags-find-pattern)
(global-set-key "\M-f" 'gtags-find-file)
(global-set-key "\M-q" 'gtags-pop-stack)
