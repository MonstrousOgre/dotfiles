return {
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      -- checkOnSave = true,
      diagnostics = {
        enable = true,
        experimental = {
          enable = true,
        },
      },
    },
  },
}
