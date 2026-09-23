return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"romus204/tree-sitter-manager.nvim",
	},
	opts = {
		display = {
			chat = {
				window = {
					layout = "vertical",
					width = 0.3,
				},
				show_settings = true,
			},
		},
		interactions = {
			chat = {
				-- adapter = "groq",
				-- adapter = "cerebras",
				adapter = "openrouter",
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
				openrouter = function()
					return require("codecompanion.adapters").extend("openrouter", {
						schema = {
							model = {
								default = "deepseek/deepseek-v4-flash-0731",
							},
							reasoning_effort = {
								default = "high",
							},
							max_tokens = {
								default = 16384, -- Scale this up safely (max output limit is 384,000)
							},
							-- preset = { default = "email-copywriter" },
						},
					})
				end,
				cerebras = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://api.cerebras.ai",
							api_key = vim.env.CEREBRAS_API_KEY,
						},
						schema = {
							model = {
								-- default = "gpt-oss-120b",
								default = "gemma-4-31b",
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
