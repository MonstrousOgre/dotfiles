local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.prettier.with({
        args = { "--print-width", "120", "--bracket-same-line", "--stdin-filepath", "$FILENAME" },
    }),
    null_ls.builtins.formatting.black,
    --null_ls.builtins.formatting.stylua,
}

--[[null_ls.config({
	sources = sources,
})
]]
null_ls.setup({
    sources = sources,
})

--require("lspconfig")["null-ls"].setup({})
