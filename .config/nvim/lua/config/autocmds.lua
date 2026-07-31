vim.api.nvim_create_autocmd('LspAttach', {

  callback = function(ev)
    -- Unset 'formatexpr'
    local opts = { buffer = ev.buf }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

    -- For signature help
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)


    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)

    -- For renaming
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("v", "<space>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<F2>", vim.lsp.buf.rename, opts)


    -- Code Actions
    -- vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set({ "v", "n" }, "<space>ca", require("actions-preview").code_actions)

    -- vim.keymap.set("n", "<space>ci", "<cmd>:Lspsaga incoming_calls, opts)
    -- vim.keymap.set("n", "<space>co", "<cmd>:Lspsaga outgoing_calls, opts)

    -- Diagnostic stuff
    vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<C-p>", function() vim.diagnostic.jump({ count = -1 }) end, opts)
    vim.keymap.set("n", "<C-n>", function() vim.diagnostic.jump({ count = 1 }) end, opts)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    -- vim.keymap.set("n", "<space>f", vim.lsp.buf.format { async = true }, opts)
    vim.keymap.set("n", "<space>f", function() require('conform').format({ async = true, lsp_fallback = true }) end, opts)
    -- For formatting selected text
    -- vim.keymap.set("v", "<space>f", vim.lsp.buf.format { async = true }, opts)
    vim.keymap.set("v", "<space>f", function() require('conform').format({ async = true, lsp_fallback = true }) end, opts)
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
