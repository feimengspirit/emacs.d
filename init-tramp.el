;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'tramp)
(setq tramp-default-method "ssh")
;(setq tramp-debug-buffer t) ;; Debug Buffer 
(cond
 ((string-match "linux" system-configuration)
  (nconc  (cadr (assq 'tramp-login-args
         (assoc "ssh" tramp-methods))) '("/bin/zsh" "-i"))
  (setcdr       (assq 'tramp-remote-sh
         (assoc "ssh" tramp-methods))  '("/bin/zsh -i"))
  (setq tramp-completion-without-shell-p t)))
