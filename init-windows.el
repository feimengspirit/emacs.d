;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;; windows.el
;; 分割されたウィンドウを切り替えることができる。
;; さらに、分割形態を保存することもできる。
;;
;; キーバインド C-z にを変更。デフォルトは C-c C-w。
;; 変更しない場合は，以下の 3 行を削除する。
;; C-z n   前のウィンドウ
;; C-z p   後のウィンドウ
;; C-z !   現在のウィンドウを破棄
;; C-z C-m メニューの表示
;; C-z ;   ウィンドウの一覧を表示
(setq win:switch-prefix "\C-z")
(define-key global-map win:switch-prefix nil)
(define-key global-map "\C-z1" 'win-switch-to-window)
;; 1-9 ではなく a-z でウィンドウを管理する
(setq win:base-key ?`) ;; ` は「直前の状態」
(setq win:max-configs 27) ;; ` ～ z は 27 文字
(setq win:quick-selection nil) ;; C-c 英字 に割り当てない
(require 'windows)
;; 新規にフレームを作らない
(setq win:use-frame nil)
(win:startup-with-window)
;; C-x C-c で終了するとそのときのウィンドウの状態を保存する
;; C-x C なら保存しない
(define-key ctl-x-map "\C-c" 'see-you-again)
(define-key ctl-x-map "C" 'save-buffers-kill-emacs)
;; *migemo* のようなバッファも保存
(setq revive:ignore-buffer-pattern "^ \\*")
