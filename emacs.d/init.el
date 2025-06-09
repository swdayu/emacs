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

;; https://github.com/DarwinAwardWinner/ido-completing-read-plus
;; ido - fancy completion all over emacs, not just for buffers and files
(use-package ido :ensure t)
(ido-mode 1)
(ido-everywhere 1)
(use-package ido-completing-read+ :ensure t)
(ido-ubiquitous-mode 1) ; install from MELPA then turn on ido-ubiquitous-mode
;; amx - completion system for M-x, putting most-used commands at the front of the list
(use-package amx :ensure t)
(amx-mode 1) ; install amx from MELPA then turn on amx-mode

;; https://github.com/abo-abo/ace-window
;; ace-window - quickly switch windows in emacs (elpa/melpa)
(use-package ace-window
    :ensure t
    :bind ("M-o" . 'ace-window))

;; https://github.com/alezost/mwim.el
;; mwin - install from melpa (with M-x package-install or M-x list-packages)
(use-package mwim
    :ensure t
    :bind
    (("C-a" . mwim-beginning-of-code-or-line) ; 首先切换到行第一个非空字符再切换到行首
     ("C-e" . mwim-end-of-code-or-line))) ; 首先跳转到代码末尾行注释之前再切换到行尾

;; https://github.com/justbur/emacs-which-key
;; which-key - display available keybindings (elpa/melpa)
(use-package which-key
    :ensure t
    :config
    (which-key-mode))

;; https://github.com/abo-abo/avy
;; https://karthinks.com/software/avy-can-do-anything/
;; avy - jump to visible text using a char-based decision tree (epla/melpa)
;; stop typing for avy-timeout-seconds (0.5s by default), you'll be able to select one of the candidates
(use-package avy
    :ensure t
    :bind
    (("C-:" . avy-goto-char)            ; input one char, jump to it with a tree
     ("C-'" . avy-goto-char-2)          ; input two consecutive chars, jump to the first one with a tree
     ("M-g a" . avy-goto-char-timer)    ; input consecutive chars, jump to the first one with a tree
     ("M-g g" . avy-goto-line)          ; input zero chars, jump to a line start with a tree
     ("M-g w" . avy-goto-word-1)        ; input one char at word start, jump to a word start with a tree
    ))

;; https://github.com/abo-abo/hydra
;; https://github.com/abo-abo/hydra/wiki
;; https://github.com/abo-abo/hydra/wiki/Binding-Styles
;; hydra - tie related commands into a family of short bindings with a common prefix
;; For any Hydra: digit-argument can be called with 0-9, negative-argument can be called with -,
;; universal-argument can be called with C-u.
(use-package hydra :ensure t)
(use-package use-package-hydra :ensure t :after hydra) ; 插件可以让我们的 use-package 多一个 :hydra 关键字，可以更方便地配置

;; text-scale-adjust 只会调整本 window 中字体的大小，当窗口无法显示当前所有行时，窗口内容会向下滚动，当恢复原样后窗口位置会与原来不一致
;; global-text-scale-adjust 会可选的调整整个 frame 的大小以保证显示相同的行数，并保证显示每行相同的字符个数
(defhydra hydra-zoom (:hint nil)
    "
zoom: _i_ in _o_ out _0_ reset _q_ quit"
    ("i" text-scale-increase) ; increase the height of the default face
    ("o" text-scale-decrease) ; decrease the height of the default face
    ("0" (lambda () (interactive) (let ((inhibit-message t)) (text-scale-adjust 0)))) ; reset the height
    ("q" hydra-root/body :exit t))

;; https://www.emacswiki.org/emacs/UndoTree
;; https://www.dr-qubit.org/undo-tree.html
;; 默认会为每个文件生成一个隐藏文件保存之前的历史记录，这会污染项目。因此，这里
;; :custom 中设置了变量 undo-tree-auto-save-history 为空，就是关闭这个保存功能。
;; 此外，也可以将所有的 undo-tree 历史记录保存到一个专门的文件夹，需要通过变量
;; undo-tree-history-directory-alist 来设置。
;; 每个提示词的颜色，有的为红色，有的为蓝色。事实上颜色是有相对应的设置的，红色的表示
;; 按过了之后依然可以继续按，不会退出 hydra；蓝色表示按了一次就会退出 hydra。例如下面
;; 的例子，我们可能需要多次 undo 和 redo，所以 p 和 n 都是红色的。而 u 可以展示出
;; undo-tree，而展示出来之后我们就不再需要 hydra 了，所以我们把 u 配置成了蓝色。不想
;; 用颜色的话也可以直接用 :exit t 表示按完后就退出，或者超时退出。
;; 红色 red         默认
;; 蓝色 blue        设置 :exit t
;; 紫色 amaranth    设置 :foreign-keys warn
;; 深蓝 teal        设置 :foreign-keys warn :exit t
;; 粉色 pink        设置 :foreign-keys run
(use-package undo-tree
    :ensure t
    :config (global-undo-tree-mode)
    :custom (undo-tree-auto-save-history nil)
    :after hydra
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; :bind ("C-c h" . hydra-undo-tree/body)
    :hydra (hydra-undo-tree (:hint nil)
    "
undo-tree: _p_ undo _n_ redo _s_ save _l_ load _v_ visualize _q_ quit"
    ("p"  undo-tree-undo)
    ("n"  undo-tree-redo)
    ("s"  undo-tree-save-history)
    ("l"  undo-tree-load-history)
    ("v"  undo-tree-visualize)
    ("q"  hydra-root/body :exit t)))

;; query-replace
;; KMacro

;; https://github.com/magnars/multiple-cursors.el
;; The package depends on the cl-lib package, cl-lib is common lisp extensions for emacs, it is a built-in package.
;; Multiple-Cursors 使用两个命令列表来确定如何操作：一次性运行列表（run-once list）
;; 和为所有光标运行列表（run-for-all list）。因此，Multiple-Cursors 有时会询问如何
;; 处理某个命令。然后，它会通过将你的选择保存在 ~/.emacs.d/.mc-lists.el 文件中来记住
;; 你的选择。你也可以更改保存位置，但确保在加载 Multiple-Cursors 之前进行此设置。可以
;; 所有的命令都设成 run-for-all，除了已经设置在 mc/cmds-to-run-once 中的命令。可以
;; 将 mc/always-run-for-all 设置成非 nil 打开这个功能，并且将运行一次的命令添加到
;; mc/cmds-to-run-once 列表中。
;; 已知限制：不支持将 isearch-forward 和 isearch-backward 与 Multiple-Cursors 一起
;; 使用，如果你需要此功能，可以使用 phi-search。所有引用 lambda 的键绑定总是为所有光标
;; 运行，如果需要限制它，你必须给它一个名字。重做（Redo）可能会干扰你的光标，撤销
;;（Undo）工作得很好。
(setq mc/list-file (expand-file-name "mc-list-file.el" user-emacs-directory))
(setq mc/always-run-for-all t)
(use-package multiple-cursors :ensure t)
(defhydra hydra-multiple-cursors (:hint nil)
    "
multiple-cursors:
_<_   prev match  _>_   next match  _l_ edit lines _0_ insert numbers
_p_   prev word   _n_   next word   _a_ mark all   _A_ insert letters
_P_   prev symbol _N_   next symbol _s_ search     _q_ quit
_o_   skip prev   _m_   skip next
_M-p_ unmark prev _M-n_ unmark next [click] cursor at point
_|_   align with input CHAR"
    ("<"   mc/mark-previous-like-this)
    ("p"   mc/mark-previous-like-this-word)
    ("P"   mc/mark-previous-like-this-symbol)
    ("M-p" mc/unmark-previous-like-this)
    ("o"   mc/skip-to-previous-like-this)
    (">"   mc/mark-next-like-this)        ; add a cursor and region forward in the buffer that matches the current region
    ("n"   mc/mark-next-like-this-word)   ; add a cursor and region forward, if no region it selects the word at the point
    ("N"   mc/mark-next-like-this-symbol) ; add a cursor and region forward, if no region it selects the symbol at the point
    ("M-n" mc/unmark-next-like-this)
    ("m"   mc/skip-to-next-like-this)
    ("|"   mc/vertical-align)
    ("l"   mc/edit-lines :exit t)         ; add a cursor to each line for the active region that spans multiple lines
    ("a"   mc/mark-all-like-this :exit t)
    ("s"   mc/mark-all-in-region-regexp :exit t)
    ("0"   mc/insert-numbers :exit t)
    ("A"   mc/insert-letters :exit t)
    ("<mouse-1>" mc/add-cursor-on-click)
    ;; Help with click recognition in this hydra
    ("<down-mouse-1>" ignore)
    ("<drag-mouse-1>" ignore)
    ("q" nil))

(global-set-key (kbd "C-S-<mouse-1>") 'mc/toggle-cursor-on-click)

;; https://github.com/nschum/highlight-symbol.el
;; highlight-symbol automatic and manual symbol highlighting.
;; 高亮出当前 Buffer 中所有的、与光标所在处的符号相同的符号。
;; highlight-symbol-mode：启用此模式后，光标所在的符号将始终保持高亮。
;; Query replacing regexp \_<foo\_> with foobafoo.
;; Type SPC or y to replace one match, Delete or n to skip to next,
;; RET or q to exit, Period to replace one match and exit,
;; , to replace but not move point immediately,
;; C-r to enter recursive edit (C-M-c to get out again),
;; C-w to delete match and recursive edit,
;; C-l to clear the screen, redisplay, and offer same replacement again,
;; ! to replace all remaining matches in this buffer with no more questions,
;; ^ to move point back to previous match,
;; u to undo previous replacement,
;; U to undo all replacements,
;; e to edit the replacement string.
;; E to edit the replacement string with exact case.
;; In multi-buffer replacements type Y to replace all remaining
;; matches in all remaining buffers with no more questions,
;; N to skip to the next buffer without replacing remaining matches
;; in the current buffer.
(use-package highlight-symbol :ensure t)
(defhydra hydra-highlight-symbol (:hint nil)
    "
highlight-symbol: _h_ highlight _p_ prev _<_ prev in defun _n_ next _>_ next in defun _r_ replace _q_ quit"
    ("h" highlight-symbol)       ; 全词匹配查找高亮
    ("p" highlight-symbol-prev)
    ("<" highlight-symbol-prev-in-defun)
    ("n" highlight-symbol-next)
    (">" highlight-symbol-next-in-defun)
    ("r" highlight-symbol-query-replace)
    ("q" hydra-root/body :exit t))
; (setq highlight-symbol-mode 1) ; 如果启用了 highlight-symbol-mode，当前符号将自动高亮
; (setq highlight-symbol-on-navigation-p t) ; 设置在导航时自动高亮

(defhydra hydra-root (:hint nil)
    "
hydra: _p_ prev match _n_ next match _r_ replace _h_ highlight _m_ multi-cursors _u_ undo-tree _z_ zoom _q_ quit"
    ("p" highlight-symbol-prev)
    ("n" highlight-symbol-next)
    ("r" highlight-symbol-query-replace)
    ("h" hydra-highlight-symbol/body :exit t)
    ("m" hydra-multiple-cursors/body :exit t)
    ("u" hydra-undo-tree/body :exit t)
    ("z" hydra-zoom/body :exit t)
    ("q" nil :exit t))

(global-set-key (kbd "C-;") 'hydra-root/body)

;; https://github.com/emacsorphanage/key-chord
(use-package key-chord
    :ensure t
    :config
    (key-chord-mode 1))
(key-chord-define-global "hh" 'hydra-root/body)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:

(provide 'init)

;;; init.el ends here