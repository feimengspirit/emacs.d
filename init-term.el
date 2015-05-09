;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'term)
;; term-modeで、C-xがC-cに割り当てられるのを防ぐ
(term-set-escape-char ?\C-x)
;; term-modeが、C-z(elscreenのプレフィックスキー)をパクるのを防ぐ
(add-hook 'term-mode-hook
          '(lambda ()
             (define-key term-raw-map "\C-z"
               (lookup-key (current-global-map) "\C-z"))))
