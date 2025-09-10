local M = {}

M.setup = function(theme)
	local colors = require("flatwhite.palette")[theme]
	local spec = {
		text = colors.base1,
		cursor = colors.accent,
		selection = colors.base5,
		selection_flash = colors.accent,
		background = colors.base7,

		wrap_guide = colors.base4,
		indent_guide = colors.base4,
		invisible_character = colors.base4,

		result_marker = colors.accent, -- should fade 30%?
		result_marker_selected = colors.accent,

		gutter_text = colors.base3,
		gutter_text_selected = colors.base1,
		gutter_background = colors.base7,
		gutter_background_selected = colors.base6,

		renamed = "#52aeff",
		added = "#2db448",
		modified = "#f2a60d",
		removed = "#ff1414",

		info = "#2db448",
		hint = "#52aeff",
		warn = "#f2a60d",
		error = "#ff1414",

		base = { fg = colors.base1 },
		sec = { fg = colors.base2 },

		orange = { fg = colors.orange_text, bg = colors.orange_bg },
		orange_sec = { fg = colors.orange_text_sec },
		green = { fg = colors.green_text, bg = colors.green_bg },
		green_sec = { fg = colors.green_text_sec },
		teal = { fg = colors.teal_text, bg = colors.teal_bg },
		teal_sec = { fg = colors.teal_text_sec },
		blue = { fg = colors.blue_text, bg = colors.blue_bg },
		blue_sec = { fg = colors.blue_text_sec },
		purple = { fg = colors.purple_text, bg = colors.purple_bg },
		purple_sec = { fg = colors.purple_text_sec },
	}
	local syn = {
		variable = spec.base,
		constant = spec.base,
		property = spec.base,
		value = spec.base,
		func = spec.base,
		method = spec.base,
		class = spec.base,
		tag = spec.base,
		attribute = spec.base,
		import = spec.base,
		snippet = spec.base,

		keyword = spec.purple,
		constant_keyword = spec.blue,
		constant_symbol = spec.blue,
		numeric = spec.teal,
		language = spec.teal,
		string = spec.green,
		type = spec.orange,
		punctuation_definition = spec.green_sec,
		comment = { fg = colors.base3 },
	}

	return {
		--
		-- editor
		--
		ColorColumn = { bg = spec.wrap_guide }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = spec.invisible_character }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { bg = spec.cursor }, -- character under the cursor
		lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = spec.wrap_guide }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = syn.keyword.fg, bg = syn.keyword.bg }, -- directory names (and other special names in listings)
		DiffAdd = { bg = spec.added }, -- diff mode: Added line |diff.txt|
		DiffChange = { bg = spec.modifed }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = spec.removed }, -- diff mode: Deleted line |diff.txt|
		DiffText = { bg = spec.renamed }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = spec.gutter_text }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		ErrorMsg = { fg = spec.error }, -- error messages on the command line
		WinSeparator = { fg = spec.gutter_background }, -- the column separating vertically split windows
		VertSplit = { link = "WinSeparator" }, -- the column separating vertically split windows
		Folded = { fg = spec.gutter_text, bg = spec.gutter_background }, -- line used for closed folds
		FoldColumn = { fg = spec.gutter_text }, -- 'foldcolumn'
		SignColumn = { fg = spec.gutter_text }, -- column where |signs| are displayed
		SignColumnSB = { link = "SignColumn" }, -- column where |signs| are displayed
		Substitute = { fg = spec.result_marker }, -- |:substitute| replacement text highlighting
		LineNr = { fg = spec.gutter_text }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = spec.gutter_text_selected, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = { fg = spec.selection_flash, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = spec.warn, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MoreMsg = { fg = spec.info, bold = true }, -- |more-prompt|
		NonText = { fg = spec.invisible_character }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = spec.text, bg = "NONE" }, -- normal text
		NormalNC = { link = "Normal" }, -- normal text in non-current windows
		NormalFloat = { fg = spec.text, bg = spec.background }, -- Normal text in floating windows.
		FloatBorder = { fg = spec.gutter_text }, -- TODO
		Pmenu = { fg = spec.gutter_text, bg = spec.gutter_background }, -- Popup menu: normal item.
		PmenuSel = { fg = spec.gutter_text_selected, bg = spec.gutter_background_selected }, -- Popup menu: selected item.
		PmenuSbar = { link = "Pmenu" }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = spec.gutter_background_selected }, -- Popup menu: Thumb of the scrollbar.
		Question = { link = "MoreMsg" }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { link = "CursorLine" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = { fg = spec.result_marker }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = { fg = spec.result_marker }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { fg = spec.result_marker_selected }, -- Search result under cursor (available since neovim >0.7.0 (https://github.com/neovim/neovim/commit/b16afe4d556af7c3e86b311cfffd1c68a5eed71f)).
		SpecialKey = { link = "NonText" }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = spec.error, underline = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = spec.warn, underline = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = spec.info, underline = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = spec.info, underline = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = spec.gutter_text_selected, bg = spec.gutter_background_selected }, -- status line of current window
		StatusLineNC = { fg = spec.gutter_text, bg = spec.gutter_background }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

		TabLine = { fg = spec.gutter_text, bg = spec.gutter_background }, -- tab pages line, not active tab page label
		TabLineFill = { bg = spec.gutter_background }, -- tab pages line, where there are no labels
		TabLineSel = { fg = spec.gutter_text_selected, bg = spec.gutter_background_selected }, -- tab pages line, active tab page label
		Title = { fg = syn.variable.fg }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = { bg = spec.selection }, -- Visual mode selection
		VisualNOS = { link = "visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = spec.warn }, -- warning messages
		Whitespace = { fg = spec.invisible_character }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { link = "Pmenu" }, -- current match in 'wildmenu' completion
		WinBar = { fg = spec.gutter_text_selected, bg = "NONE", bold = true }, -- Window bar of current window.
		WinBarNC = { fg = spec.gutter_text, bg = "NONE", bold = true }, --Window bar of not-current windows.

		-- --
		-- -- syntax
		-- --
		Comment = { fg = syn.comment.fg, italic = true }, -- any comment
		Constant = { fg = syn.language.fg, bg = syn.language.bg }, -- (preferred) any constant
		String = { fg = syn.string.fg, bg = syn.string.bg }, -- a string constant: "this is a string"
		Character = { link = "Comment" }, -- a character constant: 'c', '\n'
		Number = { fg = syn.numeric.fg, bg = syn.numeric.bg }, -- a number constant: 234, 0xff
		Float = { link = "Number" }, -- a floating point constant: 2.3e10
		Boolean = { link = "Number" }, -- a boolean constant: TRUE, false

		Identifier = { fg = syn.variable.fg }, -- (preferred) any variable name
		Function = { fg = syn.func.fg }, -- function name (also: methods for classes)
		Statement = { fg = syn.keyword.fg, bg = syn.keyword.bg, italic = true }, -- (preferred) any statement
		Conditional = { fg = syn.keyword.fg, bg = syn.keyword.bg, bold = true }, -- if, then, else, endif, switch, etc.
		Repeat = { link = "Conditional" }, -- for, do, while, etc.
		Label = { link = "Conditional" }, -- case, default, etc.

		Operator = { fg = spec.base.fg }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = syn.keyword.fg, bg = syn.keyword.bg, italic = true }, -- any other keyword
		Exception = { link = "Keyword" }, -- try, catch, throw

		PreProc = { link = "Keyword" }, -- (preferred) generic Preprocessor
		Include = { link = "PreProc" }, -- preprocessor #include
		Define = { link = "PreProc" }, -- preprocessor #define
		Macro = { link = "PreProc" }, -- same as Define
		PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.

		Type = { fg = syn.type.fg, bg = syn.type.bg, bold = true, italic = true }, -- (preferred) int, long, char, etc.
		StorageClass = { link = "Type" }, -- static, register, volatile, etc.
		Structure = { link = "Type" }, -- struct, union, enum, etc.
		Typedef = { link = "Type" }, -- A typedef

		Special = { fg = spec.sec.fg }, -- (preferred) any special symbol
		SpecialChar = { link = "Special" }, -- special character in a constant
		Tag = { link = "Special" }, -- you can use CTRL-] on this
		Delimiter = { link = "Special" }, -- character that needs attention
		SpecialComment = { link = "Special" }, -- special things inside a comment
		Debug = { link = "Special" }, -- debugging statements

		Underlined = { underline = true }, -- (preferred) text that stands out, HTML links
		Bold = { bold = true },
		Italic = { italic = true },

		Error = { sp = spec.error, underline = true }, -- (preferred) any erroneous construct
		Todo = { fg = spec.base.fg, bold = true }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		qfLineNr = { link = "LineNr" },
		qfFileName = { link = "Directory" },

		-- -- Diff filetype (runtime/syntax/diff.vim) diffAdded = { fg = spec.git.add }, -- Added lines ("^+.*" | "^>.*")
		diffRemoved = { fg = spec.removed }, -- Removed lines ("^-.*" | "^<.*")
		diffChanged = { fg = spec.modified }, -- Changed lines ("^! .*")
		diffOldFile = { fg = spec.warn }, -- Old file that is being diff against
		diffNewFile = { fg = spec.hint }, -- New file that is being compared to the old file
		diffFile = { fg = spec.info }, -- The filename of the diff ("diff --git a/readme.md b/readme.md")
		diffLine = { fg = spec.gutter_text }, -- Line information ("@@ -169,6 +169,9 @@")
		diffIndexLine = { fg = spec.gutter_text }, -- Index line of diff ("index bf3763d..94f0f62 100644")

		typescriptParens = { fg = spec.sec.fg }, -- For typescript

		-- --
		-- -- treesitter
		-- --
		-- Identifiers ------------------------------------------------------------
		["@variable"] = { fg = syn.variable.fg }, -- various variable names
		["@variable.builtin"] = { fg = spec.orange.fg, bg = spec.orange.bg }, -- built-in variable names (e.g. `this`)
		["@variable.parameter"] = { fg = syn.variable.fg }, -- parameters of a function
		["@variable.member"] = { fg = syn.method.fg }, -- object and struct fields

		["@constant"] = { link = "Constant" }, -- constant identifiers
		["@constant.builtin"] = { link = "Constant" }, -- built-in constant values
		["@constant.macro"] = { link = "Macro" }, -- constants defined by the preprocessor

		["@module"] = { fg = syn.import.fg }, -- modules or namespaces
		-- ["@module.builtin"] = { }, -- built-in modules or namespaces
		["@label"] = { link = "Label" }, -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

		-- Literals ---------------------------------------------------------------
		["@string"] = { fg = syn.string.fg, bg = syn.string.bg }, -- string literals
		-- ["@string.documentation"] = { }, -- string documenting code ()
		["@string.regexp"] = { link = "String" }, -- regular expressions
		["@string.escape"] = { fg = syn.string.fg, bg = syn.string.bg, bold = true }, -- escape sequences
		["@string.special"] = { link = "Special" }, -- other special strings (e.g. dates)
		["@string.special.symbol"] = { fg = spec.blue.fg, bg = spec.blue.bg }, -- symbols or atoms
		["@string.special.url"] = { fg = syn.string.fg, bg = syn.string.bg, italic = true, underline = true }, -- URIs (e.g. hyperlinks)
		-- ["@string.special.path"] = { }, -- filenames

		["@character"] = { link = "Character" }, -- character literals
		["@character.special"] = { link = "SpecialChar" }, -- special characters (e.g. wildcards)

		["@boolean"] = { link = "Boolean" }, -- boolean literals
		["@number"] = { link = "Number" }, -- numeric literals
		["@number.float"] = { link = "Float" }, -- floating-point number literals

		-- Types ------------------------------------------------------------------
		["@type"] = { link = "Type" }, -- type or class definitions and annotations
		["@type.builtin"] = { link = "Type" }, -- built-in types
		-- ["@type.definition"] = { }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
		-- ["@type.qualifier"] = { }, -- type qualifiers (e.g. `const`)

		["@attribute"] = { link = "Constant" }, -- attribute annotations (e.g. Python decorators)
		["@property"] = { fg = syn.property.fg }, -- the key in key/value pairs

		-- Functions --------------------------------------------------------------
		["@function"] = { link = "Function" }, -- function definitions
		["@function.builtin"] = { link = "Function" }, -- built-in functions
		-- ["@function.call"] = { }, -- function calls
		["@function.macro"] = { link = "Function" }, -- preprocessor macros

		-- ["@function.method"] = { }, -- method definitions
		-- ["@function.method.call"] = { }, -- method calls

		["@constructor"] = { fg = syn.class.fg }, -- constructor calls and definitions
		["@operator"] = { link = "Operator" }, -- symbolic operators (e.g. `+` / `*`)

		-- Keywords ---------------------------------------------------------------
		["@keyword"] = { link = "Keyword" }, -- keywords not fitting into specific categories
		-- ["@keyword.coroutine"] = { }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		["@keyword.function"] = { link = "Keyword" }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		["@keyword.operator"] = { link = "Keyword" }, -- operators that are English words (e.g. `and` / `or`)
		["@keyword.import"] = { link = "Include" }, -- keywords for including modules (e.g. `import` / `from` in Python)
		["@keyword.storage"] = { link = "StorageClass" }, -- modifiers that affect storage in memory or life-time
		["@keyword.repeat"] = { link = "Repeat" }, -- keywords related to loops (e.g. `for` / `while`)
		["@keyword.return"] = { link = "Keyword" }, -- keywords like `return` and `yield`
		-- ["@keyword.debug"] = { }, -- keywords related to debugging
		["@keyword.exception"] = { link = "Exception" }, -- keywords related to exceptions (e.g. `throw` / `catch`)

		["@keyword.conditional"] = { link = "Conditional" }, -- keywords related to conditionals (e.g. `if` / `else`)
		["@keyword.conditional.ternary"] = { link = "Conditional" }, -- ternary operator (e.g. `?` / `:`)

		-- ["@keyword.directive"] = { }, -- various preprocessor directives & shebangs
		-- ["@keyword.directive.define"] = { }, -- preprocessor definition directives

		-- Punctuation ------------------------------------------------------------
		["@punctuation.delimiter"] = { link = "Delimiter" }, -- delimiters (e.g. `;` / `.` / `,`)
		["@punctuation.bracket"] = { fg = spec.sec.fg }, -- brackets (e.g. `()` / `{}` / `[]`)
		["@punctuation.special"] = { fg = syn.punctuation_definition.fg }, -- special symbols (e.g. `{}` in string interpolation)

		-- Comments ---------------------------------------------------------------
		["@comment"] = { link = "Comment" }, -- line and block comments
		-- ["@comment.documentation"] = { link = "" }, -- comments documenting code

		["@comment.error"] = { fg = spec.error, bold = true }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED:`)
		["@comment.warning"] = { fg = spec.warn, bold = true }, -- warning-type comments (e.g. `WARNING:`, `FIX:`, `HACK:`)
		["@comment.todo"] = { fg = spec.hint, bold = true }, -- todo-type comments (e.g. `TODO:`, `WIP:`, `FIXME:`)
		["@comment.note"] = { fg = spec.info, bold = true }, -- note-type comments (e.g. `NOTE:`, `INFO:`, `XXX`)

		-- Markup -----------------------------------------------------------------
		["@markup"] = { fg = spec.base.fg }, -- For strings considerated text in a markup language.
		["@markup.strong"] = { link = "Bold" }, -- bold text
		["@markup.italic"] = { link = "Italic" }, -- italic text
		["@markup.strikethrough"] = { strikethrough = true }, -- struck-through text
		["@markup.underline"] = { link = "Underline" }, -- underlined text (only for literal underline markup!)

		["@markup.heading"] = { fg = spec.purple.fg, bg = spec.purple.bg, bold = true }, -- headings, titles (including markers)

		["@markup.quote"] = { link = "String" }, -- block quotes
		["@markup.math"] = { link = "Number" }, -- math environments (e.g. `$ ... $` in LaTeX)
		-- ["@markup.environment"] = { }, -- environments (e.g. in LaTeX)

		["@markup.link"] = { fg = syn.constant_symbol.fg, bg = syn.constant_symbol.bg, underline = true }, -- text references, footnotes, citations, etc.
		-- ["@markup.link.label"] = { link = "Special" }, -- link, reference descriptions
		-- ["@markup.link.url"] = { fg = syn.string.fg, bg = syn.string.bg, italic = true, underline = true }, -- URL-style links

		["@markup.raw"] = { fg = syn.type.fg, bg = syn.type.bg }, -- literal or verbatim text (e.g. inline code)
		["@markup.raw.block"] = { fg = syn.type.fg, bg = syn.type.bg }, -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)

		["@markup.list"] = { fg = spec.sec.fg }, -- list markers
		["@markup.list.checked"] = { fg = spec.added }, -- checked todo-style list markers
		["@markup.list.unchecked"] = { fg = spec.removed }, -- unchecked todo-style list markers

		["@diff.plus"] = { link = "diffAdded" }, -- added text (for diff files)
		["@diff.minus"] = { link = "diffRemoved" }, -- deleted text (for diff files)
		["@diff.delta"] = { link = "diffChanged" }, -- changed text (for diff files)

		["@tag"] = { fg = spec.purple.fg, bg = spec.purple.bg }, -- XML-style tag names (and similar)
		["@tag.attribute"] = { fg = spec.sec.fg }, -- XML-style tag attributes
		["@tag.delimiter"] = { fg = syn.attribute.fg }, -- XML-style tag delimiters

		-- Misc -------------------------------------------------------------------
		-- ["@none"] = { }, -- completely disable the highlight
		-- ["@conceal"] = { }, -- captures that are only meant to be concealed

		-- ["@spell"] = { }, -- for defining regions to be spellchecked
		-- ["@nospell"] = { }, -- for defining regions that should NOT be spellchecked

		-- Language specific -------------------------------------------------------

		-- json
		["@label.json"] = { fg = syn.language.fg, bg = syn.language.bg }, -- For labels: label: in C and :label: in Lua.

		-- lua
		["@constructor.lua"] = { fg = spec.sec.fg }, -- Lua's constructor is { }

		-- rust
		["@field.rust"] = { fg = syn.attribute.fg },

		-- yaml
		["@variable.member.yaml"] = { fg = syn.func.fg }, -- For fields.
	}
end

return M
