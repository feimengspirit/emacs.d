;; -- *Mode: Emacs-Lisp ; Coding: utf-8 --*

(autoload 'gtags-mode "gtags" "" t)

(setq gtags-mode-hook

'(lambda ()
 (local-set-key "\M-t" 'gtags-find-tag)
 (local-set-key "\M-r" 'gtags-find-rtag)
 (local-set-key "\M-s" 'gtags-find-symbol)
 (local-set-key "\M-p" 'gtags-find-pattern)
 (local-set-key "\M-f" 'gtags-find-file)
 (local-set-key "\M-q" 'gtags-pop-stack)
 ))
 (add-hook 'c-mode-common-hook
 '(lambda()
 (gtags-mode t)
 (gtags-make-complete-list)
 ))
