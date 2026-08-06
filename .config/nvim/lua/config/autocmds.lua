vim.api.nvim_create_autocmd("LspAttach", {

	callback = function(ev)
		-- Unset 'formatexpr'
		local default_opts = { buffer = ev.buf }

		local function map(mode, lhs, rhs, extra)
			vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", default_opts, extra))
		end

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
		map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to definition" })
		map("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })

		map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
		map("n", "<space>D", vim.lsp.buf.type_definition, { desc = "Type definition" })

		-- For signature help
		map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
		map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

		map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
		map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
		map("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { desc = "List workspace folders" })

		-- For renaming
		map("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })
		map("v", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })
		map("i", "<F2>", vim.lsp.buf.rename, { desc = "Rename" })

		-- Code Actions
		-- map("n", "<space>ca", vim.lsp.buf.code_action, {desc = ""})
		map({ "v", "n" }, "<space>ca", require("actions-preview").code_actions, { desc = "Code actions" })

		-- map("n", "<space>ci", "<cmd>:Lspsaga incoming_calls, {desc = ""})
		-- map("n", "<space>co", "<cmd>:Lspsaga outgoing_calls, {desc = ""})

		-- Diagnostic stuff
		map("n", "<space>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })

		map("n", "gp", function()
			vim.diagnostic.jump({ count = -1, on_jump = vim.diagnostic.open_float })
		end, { desc = "Previous diagnostic" })

		map("n", "gn", function()
			vim.diagnostic.jump({ count = 1, on_jump = vim.diagnostic.open_float })
		end, { desc = "Next diagnostic" })

		map("n", "<space>q", vim.diagnostic.setloclist, { desc = "" })

		-- map("n", "<space>f", vim.lsp.buf.format { async = true }, {desc = ""})
		map("n", "<space>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format" })
		-- For formatting selected text
		-- map("v", "<space>f", vim.lsp.buf.format { async = true }, {desc = ""})
		map("v", "<space>f", function()
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format" })
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local arg = vim.fn.argv(0)
		if type(arg) == "string" and arg ~= "" and vim.fn.isdirectory(arg) == 1 then
			vim.cmd.cd(arg)
		end
	end,
})
