(defgroup flatwhite-theme nil
  "Flatwhite theme customization options."
  :group 'faces)

(defcustom flatwhite-comment-italic t
  "Enable italics for comments."
  :type 'boolean
  :group 'flatwhite-theme)

(defcustom flatwhite-keyword-italic t
  "Enable italics for keywords."
  :type 'boolean
  :group 'flatwhite-theme)

(defun flatwhite-theme-define (theme-name palette)
  "Define a theme using the given THEME-NAME and color PALETTE."
  (let ((base1 (plist-get palette :base1))
        (base2 (plist-get palette :base2))
        (base3 (plist-get palette :base3))
        (base4 (plist-get palette :base4))
        (base5 (plist-get palette :base5))
        (base6 (plist-get palette :base6))
        (base7 (plist-get palette :base7))
        (accent (plist-get palette :accent))
        (orange-text (plist-get palette :orange-text))
        (orange-text-sec (plist-get palette :orange-text-sec))
        (orange-bg (plist-get palette :orange-bg))
        (green-text (plist-get palette :green-text))
        (green-text-sec (plist-get palette :green-text-sec))
        (green-bg (plist-get palette :green-bg))
        (teal-text (plist-get palette :teal-text))
        (teal-text-sec (plist-get palette :teal-text-sec))
        (teal-bg (plist-get palette :teal-bg))
        (blue-text (plist-get palette :blue-text))
        (blue-text-sec (plist-get palette :blue-text-sec))
        (blue-bg (plist-get palette :blue-bg))
        (purple-text (plist-get palette :purple-text))
        (purple-text-sec (plist-get palette :purple-text-sec))
        (purple-bg (plist-get palette :purple-bg))
        ;; Additional colors for Git/diff/etc
        (added "#2db448")
        (modified "#f2a60d")
        (removed "#ff1414")
        (renamed "#52aeff")
        (info "#2db448")
        (hint "#52aeff")
        (warn "#f2a60d")
        (error "#ff1414"))
    
    (custom-theme-set-faces
     theme-name

     ;; Basic faces
     `(default ((t (:foreground ,base1 :background ,base7))))
     `(cursor ((t (:background ,accent))))
     `(region ((t (:background ,base5))))
     `(secondary-selection ((t (:background ,base4))))
     `(highlight ((t (:background ,base4))))
     `(hl-line ((t (:background ,base6))))
     `(fringe ((t (:foreground ,base3 :background ,base7))))
     `(vertical-border ((t (:foreground ,base6))))
     `(window-divider ((t (:foreground ,base6))))
     `(window-divider-first-pixel ((t (:foreground ,base6))))
     `(window-divider-last-pixel ((t (:foreground ,base6))))

     ;; Mode line
     `(mode-line ((t (:foreground ,base1 :background ,base6 :box (:line-width 1 :color ,base4)))))
     `(mode-line-inactive ((t (:foreground ,base3 :background ,base7 :box (:line-width 1 :color ,base4)))))
     `(mode-line-buffer-id ((t (:weight bold))))
     `(mode-line-emphasis ((t (:weight bold))))
     `(mode-line-highlight ((t (:box (:line-width 2 :color ,accent)))))

     ;; Font lock (syntax highlighting)
     `(font-lock-builtin-face ((t (:foreground ,teal-text :background ,teal-bg))))
     `(font-lock-comment-face ((t (:foreground ,base3 :slant ,(if flatwhite-comment-italic 'italic 'normal)))))
     `(font-lock-constant-face ((t (:foreground ,blue-text :background ,blue-bg))))
     `(font-lock-function-name-face ((t (:foreground ,base1))))
     `(font-lock-keyword-face ((t (:foreground ,purple-text :background ,purple-bg :slant ,(if flatwhite-keyword-italic 'italic 'normal)))))
     `(font-lock-string-face ((t (:foreground ,green-text :background ,green-bg))))
     `(font-lock-type-face ((t (:foreground ,orange-text :background ,orange-bg :weight bold :slant italic))))
     `(font-lock-variable-name-face ((t (:foreground ,base1))))
     `(font-lock-warning-face ((t (:foreground ,warn :weight bold))))
     `(font-lock-doc-face ((t (:foreground ,green-text-sec))))
     `(font-lock-preprocessor-face ((t (:foreground ,purple-text :background ,purple-bg :slant italic))))
     `(font-lock-regexp-grouping-backslash ((t (:foreground ,orange-text-sec))))
     `(font-lock-regexp-grouping-construct ((t (:foreground ,orange-text))))

     ;; Line numbers
     `(line-number ((t (:foreground ,base3 :background ,base7))))
     `(line-number-current-line ((t (:foreground ,base1 :background ,base6 :weight bold))))

     ;; Search
     `(isearch ((t (:foreground ,accent :weight bold :underline t))))
     `(lazy-highlight ((t (:foreground ,accent :underline t))))
     `(match ((t (:foreground ,accent :weight bold))))

     ;; Error/warning faces
     `(error ((t (:foreground ,error :underline t))))
     `(warning ((t (:foreground ,warn :underline t))))
     `(success ((t (:foreground ,info :weight bold))))

     ;; Minibuffer
     `(minibuffer-prompt ((t (:foreground ,accent :weight bold))))

     ;; Completions
     `(completions-annotations ((t (:foreground ,base3))))
     `(completions-common-part ((t (:foreground ,accent :weight bold))))
     `(completions-first-difference ((t (:foreground ,base2))))

     ;; Dired
     `(dired-directory ((t (:foreground ,purple-text :background ,purple-bg))))
     `(dired-header ((t (:foreground ,base1 :weight bold))))
     `(dired-ignored ((t (:foreground ,base3))))
     `(dired-flagged ((t (:foreground ,removed :weight bold))))
     `(dired-marked ((t (:foreground ,added :weight bold))))
     `(dired-symlink ((t (:foreground ,teal-text))))
     `(dired-warning ((t (:foreground ,warn :weight bold))))

     ;; Diff mode
     `(diff-added ((t (:background ,added :foreground ,base7))))
     `(diff-removed ((t (:background ,removed :foreground ,base7))))
     `(diff-changed ((t (:background ,modified :foreground ,base7))))
     `(diff-header ((t (:foreground ,base1 :background ,base5))))
     `(diff-file-header ((t (:foreground ,base1 :background ,base4 :weight bold))))
     `(diff-context ((t (:foreground ,base2))))
     `(diff-hunk-header ((t (:foreground ,base3 :background ,base5))))

     ;; Magit (if available)
     `(magit-section-heading ((t (:foreground ,base1 :weight bold))))
     `(magit-section-highlight ((t (:background ,base6))))
     `(magit-diff-added ((t (:foreground ,added))))
     `(magit-diff-removed ((t (:foreground ,removed))))
     `(magit-diff-context ((t (:foreground ,base3))))
     `(magit-diff-hunk-heading ((t (:foreground ,base3 :background ,base5))))
     `(magit-diff-hunk-heading-highlight ((t (:foreground ,base1 :background ,base4))))
     `(magit-branch-local ((t (:foreground ,blue-text :weight bold))))
     `(magit-branch-remote ((t (:foreground ,green-text :weight bold))))
     `(magit-tag ((t (:foreground ,orange-text :weight bold))))
     `(magit-hash ((t (:foreground ,base3))))

     ;; Company (if available)
     `(company-tooltip ((t (:foreground ,base3 :background ,base6))))
     `(company-tooltip-selection ((t (:foreground ,base1 :background ,base5))))
     `(company-tooltip-common ((t (:foreground ,accent :weight bold))))
     `(company-tooltip-common-selection ((t (:foreground ,accent :weight bold))))
     `(company-tooltip-annotation ((t (:foreground ,base3))))
     `(company-scrollbar-fg ((t (:background ,base4))))
     `(company-scrollbar-bg ((t (:background ,base5))))

     ;; Org mode
     `(org-level-1 ((t (:foreground ,purple-text :background ,purple-bg :weight bold))))
     `(org-level-2 ((t (:foreground ,blue-text :weight bold))))
     `(org-level-3 ((t (:foreground ,green-text :weight bold))))
     `(org-level-4 ((t (:foreground ,orange-text :weight bold))))
     `(org-level-5 ((t (:foreground ,teal-text :weight bold))))
     `(org-level-6 ((t (:foreground ,purple-text-sec :weight bold))))
     `(org-level-7 ((t (:foreground ,blue-text-sec :weight bold))))
     `(org-level-8 ((t (:foreground ,green-text-sec :weight bold))))
     `(org-link ((t (:foreground ,blue-text :background ,blue-bg :underline t))))
     `(org-code ((t (:foreground ,orange-text :background ,orange-bg))))
     `(org-verbatim ((t (:foreground ,orange-text :background ,orange-bg))))
     `(org-block ((t (:foreground ,base1 :background ,base6))))
     `(org-block-begin-line ((t (:foreground ,base3 :background ,base5))))
     `(org-block-end-line ((t (:foreground ,base3 :background ,base5))))
     `(org-todo ((t (:foreground ,removed :weight bold))))
     `(org-done ((t (:foreground ,added :weight bold))))
     `(org-special-keyword ((t (:foreground ,base3))))
     `(org-meta-line ((t (:foreground ,base3))))
     `(org-document-title ((t (:foreground ,base1 :weight bold :height 1.2))))

     ;; Markdown mode
     `(markdown-header-face-1 ((t (:foreground ,purple-text :background ,purple-bg :weight bold))))
     `(markdown-header-face-2 ((t (:foreground ,blue-text :weight bold))))
     `(markdown-header-face-3 ((t (:foreground ,green-text :weight bold))))
     `(markdown-header-face-4 ((t (:foreground ,orange-text :weight bold))))
     `(markdown-header-face-5 ((t (:foreground ,teal-text :weight bold))))
     `(markdown-header-face-6 ((t (:foreground ,purple-text-sec :weight bold))))
     `(markdown-code-face ((t (:foreground ,orange-text :background ,orange-bg))))
     `(markdown-inline-code-face ((t (:foreground ,orange-text :background ,orange-bg))))
     `(markdown-pre-face ((t (:foreground ,base1 :background ,base6))))
     `(markdown-link-face ((t (:foreground ,blue-text :background ,blue-bg :underline t))))
     `(markdown-url-face ((t (:foreground ,blue-text-sec :underline t))))

     ;; Web mode
     `(web-mode-html-tag-face ((t (:foreground ,purple-text :background ,purple-bg))))
     `(web-mode-html-attr-name-face ((t (:foreground ,base2))))
     `(web-mode-html-attr-value-face ((t (:foreground ,green-text :background ,green-bg))))
     `(web-mode-css-property-name-face ((t (:foreground ,base1))))
     `(web-mode-css-selector-face ((t (:foreground ,purple-text :background ,purple-bg))))

     ;; Tree-sitter (Emacs 29+)
     `(tree-sitter-hl-face:variable ((t (:foreground ,base1))))
     `(tree-sitter-hl-face:function ((t (:foreground ,base1))))
     `(tree-sitter-hl-face:function.call ((t (:foreground ,base1))))
     `(tree-sitter-hl-face:method ((t (:foreground ,base1))))
     `(tree-sitter-hl-face:method.call ((t (:foreground ,base1))))
     `(tree-sitter-hl-face:type ((t (:foreground ,orange-text :background ,orange-bg :weight bold :slant italic))))
     `(tree-sitter-hl-face:type.builtin ((t (:foreground ,orange-text :background ,orange-bg :weight bold :slant italic))))
     `(tree-sitter-hl-face:constructor ((t (:foreground ,base1))))
     `(tree-sitter-hl-face:constant ((t (:foreground ,teal-text :background ,teal-bg))))
     `(tree-sitter-hl-face:constant.builtin ((t (:foreground ,blue-text :background ,blue-bg))))
     `(tree-sitter-hl-face:string ((t (:foreground ,green-text :background ,green-bg))))
     `(tree-sitter-hl-face:string.special ((t (:foreground ,green-text :background ,green-bg :weight bold))))
     `(tree-sitter-hl-face:comment ((t (:foreground ,base3 :slant ,(if flatwhite-comment-italic 'italic 'normal)))))
     `(tree-sitter-hl-face:keyword ((t (:foreground ,purple-text :background ,purple-bg :slant ,(if flatwhite-keyword-italic 'italic 'normal)))))
     `(tree-sitter-hl-face:operator ((t (:foreground ,base1))))
     `(tree-sitter-hl-face:property ((t (:foreground ,base1))))
     `(tree-sitter-hl-face:punctuation ((t (:foreground ,base2))))
     `(tree-sitter-hl-face:punctuation.bracket ((t (:foreground ,base2))))
     `(tree-sitter-hl-face:punctuation.delimiter ((t (:foreground ,green-text-sec))))

     ;; Show paren
     `(show-paren-match ((t (:foreground ,accent :weight bold :underline t))))
     `(show-paren-mismatch ((t (:foreground ,error :background ,base5 :weight bold))))

     ;; Whitespace
     `(whitespace-space ((t (:foreground ,base4))))
     `(whitespace-tab ((t (:foreground ,base4))))
     `(whitespace-newline ((t (:foreground ,base4))))
     `(whitespace-trailing ((t (:background ,removed))))

     ;; Flycheck/Flymake
     `(flycheck-error ((t (:underline (:style wave :color ,error)))))
     `(flycheck-warning ((t (:underline (:style wave :color ,warn)))))
     `(flycheck-info ((t (:underline (:style wave :color ,info)))))
     `(flymake-error ((t (:underline (:style wave :color ,error)))))
     `(flymake-warning ((t (:underline (:style wave :color ,warn)))))
     `(flymake-note ((t (:underline (:style wave :color ,info)))))

     ;; Which-key
     `(which-key-key-face ((t (:foreground ,accent :weight bold))))
     `(which-key-group-description-face ((t (:foreground ,base1))))
     `(which-key-command-description-face ((t (:foreground ,base2))))
     `(which-key-separator-face ((t (:foreground ,base3))))

     ;; Ivy/Counsel
     `(ivy-current-match ((t (:foreground ,base1 :background ,base5 :weight bold))))
     `(ivy-minibuffer-match-face-1 ((t (:foreground ,accent))))
     `(ivy-minibuffer-match-face-2 ((t (:foreground ,accent :weight bold))))
     `(ivy-minibuffer-match-face-3 ((t (:foreground ,accent :weight bold))))
     `(ivy-minibuffer-match-face-4 ((t (:foreground ,accent :weight bold))))

     ;; Helm
     `(helm-selection ((t (:foreground ,base1 :background ,base5 :weight bold))))
     `(helm-match ((t (:foreground ,accent :weight bold))))
     `(helm-header ((t (:foreground ,base1 :background ,base6 :weight bold))))
     `(helm-source-header ((t (:foreground ,base1 :background ,base4 :weight bold))))

     ;; Term/shell
     `(term-color-black ((t (:foreground ,base7 :background ,base7))))
     `(term-color-red ((t (:foreground ,removed :background ,removed))))
     `(term-color-green ((t (:foreground ,added :background ,added))))
     `(term-color-yellow ((t (:foreground ,warn :background ,warn))))
     `(term-color-blue ((t (:foreground ,info :background ,info))))
     `(term-color-magenta ((t (:foreground ,purple-text :background ,purple-text))))
     `(term-color-cyan ((t (:foreground ,teal-text :background ,teal-text))))
     `(term-color-white ((t (:foreground ,base1 :background ,base1)))))))
     

;; Light theme
(deftheme flatwhite "A clean, minimal light theme")

(flatwhite-theme-define
 'flatwhite
 '(:base1 "#605a52"
   :base2 "#93836c"
   :base3 "#b9a992"
   :base4 "#dcd3c6"
   :base5 "#e4ddd2"
   :base6 "#f1ece4"
   :base7 "#f7f3ee"
   :accent "#6a4dff"
   :orange-text "#5b5143"
   :orange-text-sec "#957f5f"
   :orange-bg "#f7e0c3"
   :green-text "#525643"
   :green-text-sec "#81895d"
   :green-bg "#e2e9c1"
   :teal-text "#465953"
   :teal-text-sec "#5f8c7d"
   :teal-bg "#d2ebe3"
   :blue-text "#4c5361"
   :blue-text-sec "#7382a0"
   :blue-bg "#dde4f2"
   :purple-text "#614c61"
   :purple-text-sec "#9c739c"
   :purple-bg "#f1ddf1"))

(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'flatwhite)

;; Dark theme
(deftheme flatdark "A clean, minimal dark theme")

(flatwhite-theme-define
 'flatdark
 '(:base1 "#D7DCE2"
   :base2 "#AAB4C0"
   :base3 "#88919E"
   :base4 "#4B5563"
   :base5 "#374151"
   :base6 "#1F2937"
   :base7 "#111827"
   :accent "#7C7FFF"
   :orange-text "#E0A96D"
   :orange-text-sec "#F0C591"
   :orange-bg "#5A4127"
   :green-text "#9BD97C"
   :green-text-sec "#B6E8A1"
   :green-bg "#2E4632"
   :teal-text "#6ED8C4"
   :teal-text-sec "#94E7D8"
   :teal-bg "#2A4543"
   :blue-text "#7DA6F5"
   :blue-text-sec "#A7C4FA"
   :blue-bg "#263B5A"
   :purple-text "#B893F6"
   :purple-text-sec "#D4B6FA"
   :purple-bg "#3B2D4D"))

(provide-theme 'flatdark)
