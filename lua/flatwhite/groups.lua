local M = {}

local styles = {
	comments = "italic",
	conditionals = "bold",
	constants = "NONE",
	functions = "NONE",
	keywords = "italic",
	numbers = "NONE",
	operators = "NONE",
	preprocs = "NONE",
	strings = "NONE",
	types = "italic,bold",
	variables = "NONE",
}
local trans = {}
local inactive = {}
local inv = {}
local P = {}

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
		type = spec.orange,
		constant_keyword = spec.blue,
		constant_symbol = spec.blue,
		numeric = spec.teal,
		string = spec.green,
		punctuation_definition = spec.green_sec,
		comment = { fg = colors.base3 },
	}

	return {
		--
		-- editor
		--
		-- ColorColumn = { bg = spec.bg2 }, -- used for the columns set with 'colorcolumn'
		-- Conceal = { fg = spec.bg4 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { bg = syn.cursor }, -- character under the cursor
		lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		-- CursorLine = { bg = spec.bg3 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = syn.keyword.fg, bg = syn.keyword.bg }, -- directory names (and other special names in listings)
		DiffAdd = { bg = spec.added }, -- diff mode: Added line |diff.txt|
		DiffChange = { bg = spec.modifed }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = spec.removed }, -- diff mode: Deleted line |diff.txt|
		DiffText = { bg = spec.renamed }, -- diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer = { fg = spec.bg1 }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		-- ErrorMsg = { fg = spec.diag.error }, -- error messages on the command line
		-- WinSeparator = { fg = spec.bg0 }, -- the column separating vertically split windows
		-- VertSplit = { link = "WinSeparator" }, -- the column separating vertically split windows
		-- Folded = { fg = spec.fg3, bg = spec.bg2 }, -- line used for closed folds
		-- FoldColumn = { fg = spec.fg3 }, -- 'foldcolumn'
		-- SignColumn = { fg = spec.fg3 }, -- column where |signs| are displayed
		-- SignColumnSB = { link = "SignColumn" }, -- column where |signs| are displayed
		-- Substitute = { fg = spec.bg1, bg = spec.diag.error }, -- |:substitute| replacement text highlighting
		LineNr = { fg = spec.gutter_text }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- CursorLineNr = { fg = spec.diag.warn, style = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- MatchParen = { fg = spec.diag.warn, style = inv.match_paren and "reverse,bold" or "bold" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		-- ModeMsg = { fg = spec.diag.warn, style = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MoreMsg = { fg = spec.diag.info, style = "bold" }, -- |more-prompt|
		-- NonText = { fg = spec.bg4 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = spec.text, bg = "NONE" }, -- normal text
		NormalNC = { link = "Normal" }, -- normal text in non-current windows
		NormalFloat = { fg = spec.text, bg = spec.background }, -- Normal text in floating windows.
		-- FloatBorder = { fg = spec.fg3 }, -- TODO
		-- Pmenu = { fg = spec.fg1, bg = spec.sel0 }, -- Popup menu: normal item.
		-- PmenuSel = { bg = spec.sel1 }, -- Popup menu: selected item.
		-- PmenuSbar = { link = "Pmenu" }, -- Popup menu: scrollbar.
		-- PmenuThumb = { bg = spec.sel1 }, -- Popup menu: Thumb of the scrollbar.
		-- Question = { link = "MoreMsg" }, -- |hit-enter| prompt and yes/no questions
		-- QuickFixLine = { link = "CursorLine" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		-- Search = inv.search and { style = "reverse" } or { fg = spec.fg1, bg = spec.sel1 }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		-- IncSearch = inv.search and { style = "reverse" } or { fg = spec.bg1, bg = spec.diag.hint }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- CurSearch = { link = "IncSearch" }, -- Search result under cursor (available since neovim >0.7.0 (https://github.com/neovim/neovim/commit/b16afe4d556af7c3e86b311cfffd1c68a5eed71f)).
		-- SpecialKey = { link = "NonText" }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad = { sp = spec.diag.error, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap = { sp = spec.diag.warn, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal = { sp = spec.diag.info, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare = { sp = spec.diag.info, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		-- StatusLine = { fg = spec.fg2, bg = spec.bg0 }, -- status line of current window
		-- StatusLineNC = { fg = spec.fg3, bg = spec.bg0 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		--
		-- TabLine = { fg = spec.fg2, bg = spec.bg2 }, -- tab pages line, not active tab page label
		-- TabLineFill = { bg = spec.bg0 }, -- tab pages line, where there are no labels
		-- TabLineSel = { fg = spec.bg1, bg = spec.fg3 }, -- tab pages line, active tab page label
		-- Title = { fg = spec.syntax.func, style = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
		-- Visual = inv.visual and { style = "reverse" } or { bg = spec.sel0 }, -- Visual mode selection
		-- VisualNOS = inv.visual and { style = "reverse" } or { link = "visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		-- WarningMsg = { fg = spec.diag.warn }, -- warning messages
		-- Whitespace = { fg = spec.bg3 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- WildMenu = { link = "Pmenu" }, -- current match in 'wildmenu' completion
		-- WinBar = { fg = spec.fg3, bg = trans and "NONE" or spec.bg1, style = "bold" }, -- Window bar of current window.
		-- WinBarNC = { fg = spec.fg3, bg = trans and "NONE" or inactive and spec.bg0 or spec.bg1, style = "bold" }, --Window bar of not-current windows.

		-- --
		-- -- syntax
		-- --
		Comment = { fg = syn.comment.fg, italic = true }, -- any comment
		Constant = { fg = syn.constant.fg }, -- (preferred) any constant
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

		Type = { fg = syn.type.fg, bg = syn.type.bg }, -- (preferred) int, long, char, etc.
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

		Error = { underline = true }, -- (preferred) any erroneous construct
		-- Todo = { fg = spec.bg1, bg = spec.diag.info }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		qfLineNr = { link = "LineNr" },
		qfFileName = { link = "Directory" },

		-- -- Diff filetype (runtime/syntax/diff.vim) diffAdded = { fg = spec.git.add }, -- Added lines ("^+.*" | "^>.*")
		diffRemoved = { fg = spec.removed }, -- Removed lines ("^-.*" | "^<.*")
		diffChanged = { fg = spec.modified }, -- Changed lines ("^! .*")
		-- diffOldFile = { fg = spec.diag.warn }, -- Old file that is being diff against
		-- diffNewFile = { fg = spec.diag.hint }, -- New file that is being compared to the old file
		-- diffFile = { fg = spec.diag.info }, -- The filename of the diff ("diff --git a/readme.md b/readme.md")
		-- diffLine = { fg = spec.syntax.builtin2 }, -- Line information ("@@ -169,6 +169,9 @@")
		-- diffIndexLine = { fg = spec.syntax.preproc }, -- Index line of diff ("index bf3763d..94f0f62 100644")

		-- typescriptParens = { fg = syn.bracket }, -- For typescript

		-- --
		-- -- treesitter
		-- --
		-- -- Identifiers ------------------------------------------------------------
		-- ["@variable"] = { fg = syn.variable, style = stl.variables }, -- various variable names
		-- ["@variable.builtin"] = { fg = syn.builtin0, style = stl.variables }, -- built-in variable names (e.g. `this`)
		-- ["@variable.parameter"] = { fg = syn.builtin1, stl.variables }, -- parameters of a function
		-- ["@variable.member"] = { fg = syn.field }, -- object and struct fields
		--
		-- ["@constant"] = { link = "Constant" }, -- constant identifiers
		-- ["@constant.builtin"] = { fg = syn.builtin2, style = stl.keywords }, -- built-in constant values
		-- ["@constant.macro"] = { link = "Macro" }, -- constants defined by the preprocessor
		--
		-- ["@module"] = { fg = syn.builtin1 }, -- modules or namespaces
		-- -- ["@module.builtin"] = { }, -- built-in modules or namespaces
		-- ["@label"] = { link = "Label" }, -- GOTO and other labels (e.g. `label:` in C), including heredoc labels
		--
		-- -- Literals ---------------------------------------------------------------
		-- ["@string"] = { fg = colors.green_text, bg = colors.green_bg }, -- string literals
		-- -- ["@string.documentation"] = { }, -- string documenting code ()
		-- ["@string.regexp"] = { fg = syn.regex, style = stl.strings }, -- regular expressions
		-- ["@string.escape"] = { fg = syn.regex, style = "bold" }, -- escape sequences
		-- ["@string.special"] = { link = "Special" }, -- other special strings (e.g. dates)
		-- -- ["@string.special.symbol"] = { }, -- symbols or atoms
		-- ["@string.special.url"] = { fg = syn.const, style = "italic,underline" }, -- URIs (e.g. hyperlinks)
		-- -- ["@string.special.path"] = { }, -- filenames
		--
		-- ["@character"] = { link = "Character" }, -- character literals
		-- ["@character.special"] = { link = "SpecialChar" }, -- special characters (e.g. wildcards)
		--
		-- ["@boolean"] = { link = "Boolean" }, -- boolean literals
		-- ["@number"] = { link = "Number" }, -- numeric literals
		-- ["@number.float"] = { link = "Float" }, -- floating-point number literals
		--
		-- -- Types ------------------------------------------------------------------
		-- ["@type"] = { link = "Type" }, -- type or class definitions and annotations
		-- ["@type.builtin"] = { fg = syn.builtin1, style = stl.types }, -- built-in types
		-- -- ["@type.definition"] = { }, -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
		-- -- ["@type.qualifier"] = { }, -- type qualifiers (e.g. `const`)
		--
		-- ["@attribute"] = { link = "Constant" }, -- attribute annotations (e.g. Python decorators)
		-- ["@property"] = { fg = syn.field }, -- the key in key/value pairs
		--
		-- -- Functions --------------------------------------------------------------
		-- ["@function"] = { link = "Function" }, -- function definitions
		-- ["@function.builtin"] = { fg = syn.builtin0, style = stl.functions }, -- built-in functions
		-- -- ["@function.call"] = { }, -- function calls
		-- ["@function.macro"] = { fg = syn.builtin0, style = stl.functions }, -- preprocessor macros
		--
		-- -- ["@function.method"] = { }, -- method definitions
		-- -- ["@function.method.call"] = { }, -- method calls
		--
		-- ["@constructor"] = { fg = syn.ident }, -- constructor calls and definitions
		-- ["@operator"] = { link = "Operator" }, -- symbolic operators (e.g. `+` / `*`)
		--
		-- -- Keywords ---------------------------------------------------------------
		-- ["@keyword"] = { link = "Keyword" }, -- keywords not fitting into specific categories
		-- -- ["@keyword.coroutine"] = { }, -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
		-- ["@keyword.function"] = { fg = syn.keyword, style = stl.functions }, -- keywords that define a function (e.g. `func` in Go, `def` in Python)
		-- ["@keyword.operator"] = { fg = syn.operator, style = stl.operators }, -- operators that are English words (e.g. `and` / `or`)
		-- ["@keyword.import"] = { link = "Include" }, -- keywords for including modules (e.g. `import` / `from` in Python)
		-- ["@keyword.storage"] = { link = "StorageClass" }, -- modifiers that affect storage in memory or life-time
		-- ["@keyword.repeat"] = { link = "Repeat" }, -- keywords related to loops (e.g. `for` / `while`)
		-- ["@keyword.return"] = { fg = syn.builtin0, style = stl.keywords }, -- keywords like `return` and `yield`
		-- -- ["@keyword.debug"] = { }, -- keywords related to debugging
		-- ["@keyword.exception"] = { link = "Exception" }, -- keywords related to exceptions (e.g. `throw` / `catch`)
		--
		-- ["@keyword.conditional"] = { link = "Conditional" }, -- keywords related to conditionals (e.g. `if` / `else`)
		-- ["@keyword.conditional.ternary"] = { link = "Conditional" }, -- ternary operator (e.g. `?` / `:`)
		--
		-- -- ["@keyword.directive"] = { }, -- various preprocessor directives & shebangs
		-- -- ["@keyword.directive.define"] = { }, -- preprocessor definition directives
		--
		-- -- Punctuation ------------------------------------------------------------
		-- ["@punctuation.delimiter"] = { fg = syn.bracket }, -- delimiters (e.g. `;` / `.` / `,`)
		-- ["@punctuation.bracket"] = { fg = syn.bracket }, -- brackets (e.g. `()` / `{}` / `[]`)
		-- ["@punctuation.special"] = { fg = syn.builtin1, style = stl.operators }, -- special symbols (e.g. `{}` in string interpolation)
		--
		-- -- Comments ---------------------------------------------------------------
		-- ["@comment"] = { link = "Comment" }, -- line and block comments
		-- -- ["@comment.documentation"] = { link = "" }, -- comments documenting code
		--
		-- ["@comment.error"] = { fg = spec.bg1, bg = spec.diag.error }, -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED:`)
		-- ["@comment.warning"] = { fg = spec.bg1, bg = spec.diag.warn }, -- warning-type comments (e.g. `WARNING:`, `FIX:`, `HACK:`)
		-- ["@comment.todo"] = { fg = spec.bg1, bg = spec.diag.hint }, -- todo-type comments (e.g. `TODO:`, `WIP:`, `FIXME:`)
		-- ["@comment.note"] = { fg = spec.bg1, bg = spec.diag.info }, -- note-type comments (e.g. `NOTE:`, `INFO:`, `XXX`)
		--
		-- -- Markup -----------------------------------------------------------------
		-- ["@markup"] = { fg = spec.fg1 }, -- For strings considerated text in a markup language.
		-- ["@markup.strong"] = { fg = P.red:subtle(), style = "bold" }, -- bold text
		-- ["@markup.italic"] = { link = "Italic" }, -- italic text
		-- ["@markup.strikethrough"] = { fg = spec.fg1, style = "strikethrough" }, -- struck-through text
		-- ["@markup.underline"] = { link = "Underline" }, -- underlined text (only for literal underline markup!)
		--
		-- ["@markup.heading"] = { link = "Title" }, -- headings, titles (including markers)
		--
		-- ["@markup.quote"] = { fg = spec.fg2 }, -- block quotes
		-- ["@markup.math"] = { fg = syn.func }, -- math environments (e.g. `$ ... $` in LaTeX)
		-- -- ["@markup.environment"] = { }, -- environments (e.g. in LaTeX)
		--
		-- ["@markup.link"] = { fg = syn.keyword, style = "bold" }, -- text references, footnotes, citations, etc.
		-- ["@markup.link.label"] = { link = "Special" }, -- link, reference descriptions
		-- ["@markup.link.url"] = { fg = syn.const, style = "italic,underline" }, -- URL-style links
		--
		-- ["@markup.raw"] = { fg = syn.ident, style = "italic" }, -- literal or verbatim text (e.g. inline code)
		-- ["@markup.raw.block"] = { fg = P.pink.base }, -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)
		--
		-- ["@markup.list"] = { fg = syn.builtin1, style = stl.operators }, -- list markers
		-- ["@markup.list.checked"] = { fg = P.green.base }, -- checked todo-style list markers
		-- ["@markup.list.unchecked"] = { fg = P.yellow.base }, -- unchecked todo-style list markers
		--
		-- ["@diff.plus"] = { link = "diffAdded" }, -- added text (for diff files)
		-- ["@diff.minus"] = { link = "diffRemoved" }, -- deleted text (for diff files)
		-- ["@diff.delta"] = { link = "diffChanged" }, -- changed text (for diff files)
		--
		-- ["@tag"] = { fg = syn.keyword }, -- XML-style tag names (and similar)
		-- ["@tag.attribute"] = { fg = syn.func, style = "italic" }, -- XML-style tag attributes
		-- ["@tag.delimiter"] = { fg = syn.builtin1 }, -- XML-style tag delimiters
		--
		-- -- Misc -------------------------------------------------------------------
		-- -- ["@none"] = { }, -- completely disable the highlight
		-- -- ["@conceal"] = { }, -- captures that are only meant to be concealed
		--
		-- -- ["@spell"] = { }, -- for defining regions to be spellchecked
		-- -- ["@nospell"] = { }, -- for defining regions that should NOT be spellchecked
		--
		-- -- Language specific -------------------------------------------------------
		--
		-- -- json
		-- ["@label.json"] = { fg = syn.func }, -- For labels: label: in C and :label: in Lua.
		--
		-- -- lua
		-- ["@constructor.lua"] = { fg = spec.fg2 }, -- Lua's constructor is { }
		--
		-- -- rust
		-- ["@field.rust"] = { fg = spec.fg2 },
		--
		-- -- yaml
		-- ["@variable.member.yaml"] = { fg = syn.func }, -- For fields.
	}
end

return M
