vim.cmd([[colorscheme badwolf]])

function Badwolf()
	HIGHLIGHT("Normal", { ctermbg = "NONE", guibg = "NONE" })
	HIGHLIGHT("LineNr", { ctermbg = "NONE", guibg = "NONE" })
	HIGHLIGHT("SignColumn", { ctermbg = "NONE", guibg = "NONE" })
	HIGHLIGHT("PMenu", { ctermbg = "238", guibg = "#444444" })
	-- HIGHLIGHT('CursorLine', { ctermbg = '238', guibg = '#444444' })
end

CREATE_AUGROUP("Badwolf", { { "ColorScheme", "*", "lua Badwolf()" } })
