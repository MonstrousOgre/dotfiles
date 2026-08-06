return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "romus204/tree-sitter-manager.nvim",
  },
  opts = {
    interactions = {
      chat = {
        adapter = "groq",
        start_in_insert_mode = true,
      },
      inline = {
        enabled = false,
        -- adapter = 'cerebras',
        -- adapter = 'gemini',
      },
    },
    adapters = {
      http = {
        cerebras = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://api.cerebras.ai",
              api_key = vim.env.CEREBRAS_API_KEY,
            },
            schema = {
              model = {
                default = "gpt-oss-120b",
              },
            },
          })
        end,
        groq = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://api.groq.com/openai",
              api_key = vim.env.GROQ_API_KEY,
            },
            schema = {
              model = {
                -- default = "llama-3.3-70b-versatile",
                default = "qwen/qwen3.6-27b",
              },
            },
          })
        end,
      },
    },
  },
}
