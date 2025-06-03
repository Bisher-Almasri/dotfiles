return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {
		input = {
			default_prompt = "➤ ",
			prompt_align = "left",
			relative = "editor",
			border = "rounded",
			prefer_width = 40,
			width = nil,
			max_width = { 140, 0.9 },
			min_width = { 20, 0.2 },
			winblend = 0,
			winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
		},
		select = {
			backend = { "telescope", "fzf", "builtin" },
			telescope = nil,
			fzf = {
				window = {
					width = 0.5,
					height = 0.4,
				},
			},
			builtin = {
				border = "rounded",
				relative = "editor",
				winblend = 0,
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
	},
}