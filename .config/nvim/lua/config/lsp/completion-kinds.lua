local M = {}

--M.icons = {
--	Class = " ",
--	Color = " ",
--	Constant = " ",
--	Constructor = " ",
--	Enum = "了 ",
--	EnumMember = " ",
--	Field = " ",
--	File = " ",
--	Folder = " ",
--	Function = " ",
--	Interface = "ﰮ ",
--	Keyword = " ",
--	Method = "ƒ ",
--	Module = " ",
--	Property = " ",
--	Snippet = "﬌ ",
--	Struct = " ",
--	Text = " ",
--	Unit = " ",
--	Value = " ",
--	Variable = " ",
--}

M.icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

function M.setup()
	--vim.lsp.protocol.CompletionItemKind = M.icons
	local kinds = vim.lsp.protocol.CompletionItemKind
	for i, kind in ipairs(kinds) do
		kinds[i] = M.icons[kind] or kind
	end
end

return M
