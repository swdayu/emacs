(unless (>= emacs-major-version 24)
    (error "jbdark theme requires Emacs 24 or later"))

(deftheme jbdark "jbdark color theme")

;; Monokai colors
(defcustom jbdark-theme-yellow "#E6DB74" "Primary colors - yellow" :type 'string :group 'monokai)
(defcustom jbdark-theme-orange "#FD971F" "Primary colors - orange" :type 'string :group 'monokai)
(defcustom jbdark-theme-red "#F92672" "Primary colors - red" :type 'string :group 'monokai)
(defcustom jbdark-theme-magenta "#FD5FF0" "Primary colors - magenta" :type 'string :group 'monokai)
(defcustom jbdark-theme-blue "#66D9EF" "Primary colors - blue" :type 'string :group 'monokai)
(defcustom jbdark-theme-green "#A6E22E" "Primary colors - green" :type 'string :group 'monokai)
(defcustom jbdark-theme-cyan "#A1EFE4" "Primary colors - cyan" :type 'string :group 'monokai)
(defcustom jbdark-theme-violet "#AE81FF" "Primary colors - violet" :type 'string :group 'monokai)

(let
   ((background         "#062329")
    (gutters            "#062329")
    (gutter-fg          "#062329")
    (gutters-active     "#062329")
    (builtin            "#ffffff")
    (selection          "#0000ff")
    (text               "#d1b897")
    (comments           "#44b340")
    (punctuation        "#8cde94")
    (keywords           "#ffffff")
    (variables          "#c1d1e3")
    (functions          "#ffffff")
    (methods            "#c1d1e3")
    (strings            "#2ec09c")
    (constants          "#7ad0c6")
    (macros             "#8cde94")
    (numbers            "#7ad0c6")
    (white              "#ffffff")
    (light-green        "#93e899")
    (error              "#ff0000")
    (warning            "#ffaa00")
    (highlight-line     "#0b3335")
    (line-fg            "#126367"))

  (custom-theme-set-faces
   'jbdark

   ;; Default colors
   ;; *****************************************************************************

   `(default    ((t (:foreground ,text :background ,background, :weight normal))))
   `(region     ((t (:foreground nil :background ,selection))))
   `(cursor     ((t (:background ,light-green))))
   `(fringe     ((t (:background ,background :foreground ,white))))
   `(linum      ((t (:background ,background :foreground ,gutter-fg))))
   `(highlight  ((t (:foreground nil :background ,selection))))

   ;; Font lock faces
   ;; *****************************************************************************

   `(font-lock-keyword-face           ((t (:foreground ,keywords))))
   `(font-lock-type-face              ((t (:foreground ,punctuation))))
   `(font-lock-constant-face          ((t (:foreground ,constants))))
   `(font-lock-variable-name-face     ((t (:foreground ,variables))))
   `(font-lock-builtin-face           ((t (:foreground ,builtin))))
   `(font-lock-string-face            ((t (:foreground ,strings))))
   `(font-lock-comment-face           ((t (:foreground ,comments))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comments))))
   `(font-lock-doc-face               ((t (:foreground ,comments))))
   `(font-lock-function-name-face     ((t (:foreground ,functions))))
   `(font-lock-doc-string-face        ((t (:foreground ,strings))))
   `(font-lock-preprocessor-face      ((t (:foreground ,macros))))
   `(font-lock-warning-face           ((t (:foreground ,warning))))

   ;; Plugins
   ;; *****************************************************************************
   `(trailing-whitespace ((t (:foreground nil :background ,warning))))
   `(whitespace-trailing ((t (:background nil :foreground ,warning :inverse-video t))))

   `(linum ((t (:foreground ,line-fg :background ,background))))
   `(linum-relative-current-face ((t (:foreground ,white :background ,background))))
   `(line-number ((t (:foreground ,line-fg :background ,background))))
   `(line-number-current-line ((t (:foreground ,white :background ,background))))

   ;; compilation
   `(compilation-info ((t ,(list :foreground jbdark-theme-green
                                 :inherit 'unspecified))))
   `(compilation-warning ((t ,(list :foreground jbdark-theme-yellow
                                    :bold t
                                    :inherit 'unspecified))))
   `(compilation-error ((t (:foreground, error))))
   `(compilation-mode-line-fail ((t ,(list :foreground error
                                           :weight 'bold
                                           :inherit 'unspecified))))
   `(compilation-mode-line-exit ((t ,(list :foreground jbdark-theme-green
                                           :weight 'bold
                                           :inherit 'unspecified))))

   ;; hl-line-mode
   `(hl-line ((t (:background ,highlight-line))))
   `(hl-line-face ((t (:background ,highlight-line))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,jbdark-theme-violet))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,jbdark-theme-blue))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,jbdark-theme-green))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,jbdark-theme-yellow))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,jbdark-theme-orange))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,jbdark-theme-red))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,jbdark-theme-violet))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,jbdark-theme-blue))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,jbdark-theme-green))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,jbdark-theme-yellow))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,jbdark-theme-orange))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,jbdark-theme-red))))

   ;; which-func
   `(which-func ((t (:inverse-video unspecified
                                    :underline unspecified
                                    :foreground ,background
                                    :weight bold
                                    :box nil))))

   ;; mode-line and powerline
   `(mode-line-buffer-id ((t (:foreground ,background :distant-foreground ,text :text ,text :weight bold))))
   `(mode-line ((t (:inverse-video unspecified
                                   :underline unspecified
                                   :foreground ,background
                                   :background ,text
                                   :box nil))))
   `(powerline-active1 ((t (:background ,text :foreground ,background))))
   `(powerline-active2 ((t (:background ,text :foreground ,background))))

   `(mode-line-inactive ((t (:inverse-video unspecified
                                            :underline unspecified
                                            :foreground ,text
                                            :background ,background
                                            :box nil))))
   `(powerline-inactive1 ((t (:background ,background :foreground ,text))))
   `(powerline-inactive2 ((t (:background ,background :foreground ,text))))

    ;; better compatibility with default DOOM mode-line
   `(error ((t (:foreground nil :weight normal))))
   `(doom-modeline-project-dir ((t (:foreground nil :weight bold))))

   ;; js2-mode
   `(js2-function-call ((t (:inherit (font-lock-function-name-face)))))
   `(js2-function-param ((t (:foreground ,text))))
   `(js2-jsdoc-tag ((t (:foreground ,keywords))))
   `(js2-jsdoc-type ((t (:foreground ,constants))))
   `(js2-jsdoc-value((t (:foreground ,text))))
   `(js2-object-property ((t (:foreground ,text))))
   `(js2-external-variable ((t (:foreground ,constants))))
   `(js2-error ((t (:foreground ,error))))
   `(js2-warning ((t (:foreground ,warning))))

   ;; highlight numbers
   `(highlight-numbers-number ((t (:foreground ,numbers))))

   ;; tab-bar-mode
   `(tab-bar ((t (:inherit modeline))))
   `(tab-bar-tab ((t (:foreground ,background :background ,text))))
   `(tab-bar-tab-inactive ((t (:foreground ,text :background ,background))))
  )

  (custom-theme-set-variables
    'jbdark
    '(linum-format " %5i ")
  )
)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
    (add-to-list 'custom-theme-load-path
        (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'jbdark)