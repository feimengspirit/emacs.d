;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; lang, encoding
(set-language-environment "japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

;; base
(setq inhibit-startup-message t)
(setq ring-bell-function nil)
(setq visible-bell nil)
(blink-cursor-mode 0)
(menu-bar-mode nil)
(tool-bar-mode nil)
(line-number-mode t)
(column-number-mode t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(delete-selection-mode 1)
(setq-default indent-tabs-mode nil)
(setq require-final-newline t)
(setq next-line-add-newlines nil)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x?" 'help)
(auto-image-file-mode t)
(auto-compression-mode t)

;; window
(setq frame-title-format `(" %b ", " @ ",(system-name) " -- " ,emacs-version))
(setq truncate-partial-width-windows nil)
(setq scroll-conservatively 1)
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))
(define-key global-map "\C-q" (make-sparse-keymap))
(global-set-key "\C-q\C-q" 'quoted-insert)
(global-set-key "\C-q\C-r" 'window-resizer)
(global-set-key "\C-ql" 'windmove-right)
(global-set-key "\C-qh" 'windmove-left)
(global-set-key "\C-qj" 'windmove-down)
(global-set-key "\C-qk" 'windmove-up)
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))
(global-linum-mode t)

;; mini buffer, mode line
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq-default mode-line-format
              '("-" mode-line-mule-info mode-line-modified
                mode-line-frame-identification  mode-line-buffer-identification
                " " global-mode-string " %[(" mode-name mode-line-process
                minor-mode-alist "%n" ")%]-" (which-func-mode ("" which-func-format "-"))
                (line-number-mode "L%l-")(column-number-mode "C%c-")(-3 . "%p")"-%-")
              )
(column-number-mode 1)
(line-number-mode t)
(setq display-time-string-forms
      '(month "/" day "(" dayname ")" 24-hours ":" minutes))
(display-time)
(add-hook 'lisp-interaction-mode-hook '(lambda () (setq mode-name "Lisp-Int")))
(add-hook 'emacs-lisp-mode-hook       '(lambda () (setq mode-name "Elisp")))
(let ((elem (assq 'encoded-kbd-mode minor-mode-alist)))
  (when elem    (setcar (cdr elem) "")))
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
(setq line-number-display-limit 1000000)

;; dired (ls-lisp)
;(add-hook 'dired-load-hook
;          '(lambda ()
;             (load-library "ls-lisp")
;             (setq ls-lisp-dirs-first t)
;             (setq dired-listing-switches "-AFl")
;             (setq find-ls-option '("-exec ls -AFGl {} \\;" . "-AFGl"))
;             (setq grep-find-command "find . -type f -print0 | xargs -0 -e grep -ns ")
;             (require 'wdired)
;             (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
;             ))

;; highlight
(global-font-lock-mode t)
(show-paren-mode t)
;(set-face-background 'show-paren-match-face "RoyalBlue1")
;(set-face-foreground 'show-paren-match-face "AntiqueWhite")
;(set-face-background 'show-paren-mismatch-face "Red")
;(set-face-foreground 'show-paren-mismatch-face "black")
;(setq show-paren-ring-bell-on-mismatch t)
;(setq show-paren-style 'mixed)
(transient-mark-mode t)
(setq search-highlight t)
(setq query-replace-highlight t)
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
;(defface my-face-b-2 '((t (:background "gray"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
;(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("　" 0 my-face-b-1 append)
;     ("\t" 0 my-face-b-2 append)
     ("\t" 0 my-face-u-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(hl-line-mode 1)
(setq hl-line-face 'underline)
(defface my-face-f-2 '((t (:foreground "GreenYellow"))) nil)
(defvar my-face-f-2 'my-face-f-2)
(defun my-dired-today-search (arg)
  "Fontlock search function for dired."
  (search-forward-regexp
   (concat (format-time-string "%b %e" (current-time)) " [0-9]....") arg t))
(add-hook 'dired-mode-hook
          '(lambda ()
             (font-lock-add-keywords
              major-mode
              (list
               '(my-dired-today-search . my-face-f-2)
            ))))
