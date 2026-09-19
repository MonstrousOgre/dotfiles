return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- track latest; avante moves fast
	build = "make", -- compiles the diff/apply engine
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- icons
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = { embed_image_as_base64 = false, prompt_for_file_name = false },
			},
		},
	},
	opts = {
		provider = "openai", -- OpenRouter exposes an OpenAI-compatible API
		providers = {
			openai = {
				endpoint = "https://openrouter.ai/api/v1",
				model = "deepseek/deepseek-v4-flash-0731",
				api_key_name = "OPENROUTER_API_KEY",
				timeout = 60000,
				extra_request_body = {
					temperature = 0,
					max_tokens = 16384,
				},
			},
		},
		file_selector = {
			provider = "telescope", -- or "snacks"
		},
		completion = {
			enabled = false, -- neocodium covers inline completion
		},
	},
}
