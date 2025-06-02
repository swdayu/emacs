;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

(setq custom-nw-file (expand-file-name "custom-nw.el" user-emacs-directory))
(setq custom-ui-file (expand-file-name "custom-ui.el" user-emacs-directory))
(if (display-graphic-p)
    (setq custom-file custom-ui-file)
    (setq custom-file custom-nw-file))
(load custom-file)

(when (display-graphic-p)
   (tool-bar-mode -1)       ; 工具栏只在图形界面可用，它十分丑陋且功能又很基本，可以关掉
   (scroll-bar-mode -1))    ; 图形界面滚动条，事实上Emacs中根本不需要用滚动条，可以关闭让界面更清爽
(setq make-backup-files nil)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

; (add-to-list 'default-frame-alist '(font . "Iosevka-20"))
(add-to-list 'default-frame-alist '(width . 170)) ; 设定启动图形界面时的初始 Frame 宽度（字符数）
(add-to-list 'default-frame-alist '(height . 40)) ; 设定启动图形界面时的初始 Frame 高度（字符数）

;(global-set-key (kbd "RET") 'newline-and-indent) ; 回车键 - 新起一行并做缩进
(global-set-key (kbd "C-c C-k") 'kill-whole-line) ; 移除整行
(defun prev-ten-lines()
    "Move cursor 10 lines backward"
    (interactive)
    (previous-line 10))
(defun next-ten-lines()
    "Move cursor 10 lines forward"
    (interactive)
    (next-line 10))
(global-set-key (kbd "M-p") 'prev-ten-lines) ; 光标向前移动 10 行
(global-set-key (kbd "M-n") 'next-ten-lines) ; 光标向后移动 10 行

;; 添加插件仓库，开始使用外部插件代码
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired. See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(eval-when-compile (require 'use-package))


;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:

(provide 'init)

;;; init.el ends here