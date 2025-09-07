local M = {}

local colors = require("flatwhite.palette")
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
local spec = {}
local trans = {}
local inactive = {}
local inv = {}
local stl = {}
local syn = {}

M.setup = function()
	return {
		--
		-- editor
		--
		ColorColumn = { bg = spec.bg2 }, -- used for the columns set with 'colorcolumn'
		Conceal = { fg = spec.bg4 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = spec.bg1, bg = spec.fg1 }, -- character under the cursor
		lCursor = { link = "Cursor" }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM = { link = "Cursor" }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { link = "CursorLine" }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine = { bg = spec.bg3 }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory = { fg = spec.syntax.func }, -- directory names (and other special names in listings)
		DiffAdd = { bg = spec.diff.add }, -- diff mode: Added line |diff.txt|
		DiffChange = { bg = spec.diff.change }, -- diff mode: Changed line |diff.txt|
		DiffDelete = { bg = spec.diff.delete }, -- diff mode: Deleted line |diff.txt|
		DiffText = { bg = spec.diff.text }, -- diff mode: Changed text within a changed line |diff.txt|
		EndOfBuffer = { fg = spec.bg1 }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
		ErrorMsg = { fg = spec.diag.error }, -- error messages on the command line
		WinSeparator = { fg = spec.bg0 }, -- the column separating vertically split windows
		VertSplit = { link = "WinSeparator" }, -- the column separating vertically split windows
		Folded = { fg = spec.fg3, bg = spec.bg2 }, -- line used for closed folds
		FoldColumn = { fg = spec.fg3 }, -- 'foldcolumn'
		SignColumn = { fg = spec.fg3 }, -- column where |signs| are displayed
		SignColumnSB = { link = "SignColumn" }, -- column where |signs| are displayed
		Substitute = { fg = spec.bg1, bg = spec.diag.error }, -- |:substitute| replacement text highlighting
		LineNr = { fg = spec.fg3 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		CursorLineNr = { fg = spec.diag.warn, style = "bold" }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		MatchParen = { fg = spec.diag.warn, style = inv.match_paren and "reverse,bold" or "bold" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg = { fg = spec.diag.warn, style = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
		MoreMsg = { fg = spec.diag.info, style = "bold" }, -- |more-prompt|
		NonText = { fg = spec.bg4 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal = { fg = spec.fg1, bg = trans and "NONE" or spec.bg1 }, -- normal text
		NormalNC = { fg = spec.fg1, bg = (inactive and spec.bg0) or (trans and "NONE") or spec.bg1 }, -- normal text in non-current windows
		NormalFloat = { fg = spec.fg1, bg = spec.bg0 }, -- Normal text in floating windows.
		FloatBorder = { fg = spec.fg3 }, -- TODO
		Pmenu = { fg = spec.fg1, bg = spec.sel0 }, -- Popup menu: normal item.
		PmenuSel = { bg = spec.sel1 }, -- Popup menu: selected item.
		PmenuSbar = { link = "Pmenu" }, -- Popup menu: scrollbar.
		PmenuThumb = { bg = spec.sel1 }, -- Popup menu: Thumb of the scrollbar.
		Question = { link = "MoreMsg" }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine = { link = "CursorLine" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search = inv.search and { style = "reverse" } or { fg = spec.fg1, bg = spec.sel1 }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		IncSearch = inv.search and { style = "reverse" } or { fg = spec.bg1, bg = spec.diag.hint }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		CurSearch = { link = "IncSearch" }, -- Search result under cursor (available since neovim >0.7.0 (https://github.com/neovim/neovim/commit/b16afe4d556af7c3e86b311cfffd1c68a5eed71f)).
		SpecialKey = { link = "NonText" }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad = { sp = spec.diag.error, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap = { sp = spec.diag.warn, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal = { sp = spec.diag.info, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare = { sp = spec.diag.info, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
		StatusLine = { fg = spec.fg2, bg = spec.bg0 }, -- status line of current window
		StatusLineNC = { fg = spec.fg3, bg = spec.bg0 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

		TabLine = { fg = spec.fg2, bg = spec.bg2 }, -- tab pages line, not active tab page label
		TabLineFill = { bg = spec.bg0 }, -- tab pages line, where there are no labels
		TabLineSel = { fg = spec.bg1, bg = spec.fg3 }, -- tab pages line, active tab page label
		Title = { fg = spec.syntax.func, style = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
		Visual = inv.visual and { style = "reverse" } or { bg = spec.sel0 }, -- Visual mode selection
		VisualNOS = inv.visual and { style = "reverse" } or { link = "visual" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg = { fg = spec.diag.warn }, -- warning messages
		Whitespace = { fg = spec.bg3 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		WildMenu = { link = "Pmenu" }, -- current match in 'wildmenu' completion
		WinBar = { fg = spec.fg3, bg = trans and "NONE" or spec.bg1, style = "bold" }, -- Window bar of current window.
		WinBarNC = { fg = spec.fg3, bg = trans and "NONE" or inactive and spec.bg0 or spec.bg1, style = "bold" }, --Window bar of not-current windows.

		--
		-- syntax
		--
		Comment = { fg = syn.comment, style = stl.comments }, -- any comment
		Constant = { fg = syn.const, style = stl.constants }, -- (preferred) any constant
		String = { fg = syn.string, style = stl.strings }, -- a string constant: "this is a string"
		Character = { link = "String" }, -- a character constant: 'c', '\n'
		Number = { fg = syn.number, style = stl.numbers }, -- a number constant: 234, 0xff
		Float = { link = "Number" }, -- a floating point constant: 2.3e10
		Boolean = { link = "Number" }, -- a boolean constant: TRUE, false

		Identifier = { fg = syn.ident, style = stl.variables }, -- (preferred) any variable name
		Function = { fg = syn.func, style = stl.functions }, -- function name (also: methods for classes)

		Statement = { fg = syn.keyword, style = stl.keywords }, -- (preferred) any statement
		Conditional = { fg = syn.conditional, style = stl.conditionals }, -- if, then, else, endif, switch, etc.
		Repeat = { link = "Conditional" }, -- for, do, while, etc.
		Label = { link = "Conditional" }, -- case, default, etc.

		Operator = { fg = syn.operator, style = stl.operators }, -- "sizeof", "+", "*", etc.
		Keyword = { fg = syn.keyword, style = stl.keywords }, -- any other keyword
		Exception = { link = "Keyword" }, -- try, catch, throw

		PreProc = { fg = syn.preproc, style = stl.preprocs }, -- (preferred) generic Preprocessor
		Include = { link = "PreProc" }, -- preprocessor #include
		Define = { link = "PreProc" }, -- preprocessor #define
		Macro = { link = "PreProc" }, -- same as Define
		PreCondit = { link = "PreProc" }, -- preprocessor #if, #else, #endif, etc.

		Type = { fg = syn.type, style = stl.types }, -- (preferred) int, long, char, etc.
		StorageClass = { link = "Type" }, -- static, register, volatile, etc.
		Structure = { link = "Type" }, -- struct, union, enum, etc.
		Typedef = { link = "Type" }, -- A typedef

		Special = { fg = syn.func }, -- (preferred) any special symbol
		SpecialChar = { link = "Special" }, -- special character in a constant
		Tag = { link = "Special" }, -- you can use CTRL-] on this
		Delimiter = { link = "Special" }, -- character that needs attention
		SpecialComment = { link = "Special" }, -- special things inside a comment
		Debug = { link = "Special" }, -- debugging statements

		Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
		Bold = { style = "bold" },
		Italic = { style = "italic" },

		Error = { fg = spec.diag.error }, -- (preferred) any erroneous construct
		Todo = { fg = spec.bg1, bg = spec.diag.info }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		qfLineNr = { link = "lineNr" },
		qfFileName = { link = "Directory" },

		-- Diff filetype (runtime/syntax/diff.vim) diffAdded = { fg = spec.git.add }, -- Added lines ("^+.*" | "^>.*")
		diffRemoved = { fg = spec.git.removed }, -- Removed lines ("^-.*" | "^<.*")
		diffChanged = { fg = spec.git.changed }, -- Changed lines ("^! .*")
		diffOldFile = { fg = spec.diag.warn }, -- Old file that is being diff against
		diffNewFile = { fg = spec.diag.hint }, -- New file that is being compared to the old file
		diffFile = { fg = spec.diag.info }, -- The filename of the diff ("diff --git a/readme.md b/readme.md")
		diffLine = { fg = spec.syntax.builtin2 }, -- Line information ("@@ -169,6 +169,9 @@")
		diffIndexLine = { fg = spec.syntax.preproc }, -- Index line of diff ("index bf3763d..94f0f62 100644")

		typescriptParens = { fg = syn.bracket }, -- For typescript

		--
		-- treesitter
		--
	}
end

return M
