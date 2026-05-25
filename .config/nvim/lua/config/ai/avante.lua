require("avante").setup({
  -- add any opts here
  -- for example
  provider = "claude",
  -- auto_suggestions_provider = "ollama",
  providers = {
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-sonnet-20241022",
      timeout = 30000,      -- Timeout in milliseconds
      disable_tools = true, -- disable tools!
      extra_request_body = {
        temperature = 0,
        max_tokens = 4096,

      }
    },
    -- ollama = {
    --   model = "qwen2.5-coder:7b",
    -- },
  },

  behaviour = {
    auto_suggestions = true, -- Experimental stage
  }
})
