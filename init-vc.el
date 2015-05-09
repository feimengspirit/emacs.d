;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(add-hook 'dired-mode-hook
          '(lambda ()
             (require 'dired-x)
             ;(define-key dired-mode-map "V" 'cvs-examine)
             (define-key dired-mode-map "V" 'vc-dir)
             (turn-on-font-lock)
             ))
(setq svn-status-hide-unmodified t)
(setq process-coding-system-alist
      (cons '("svn" . utf-8) process-coding-system-alist))
(setq svn-status-svn-process-coding-system 'utf-8)
