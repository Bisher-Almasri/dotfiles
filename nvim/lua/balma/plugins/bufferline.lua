return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs",
			separator_style = "thin",
			show_buffer_close_icons = true,
			show_close_icon = false,
			color_icons = true,
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(_, _, diag)
				local icons = {
					error = " ",
					warn = " ",
					info = " ",
				}
				local ret = (diag.error and icons.error .. diag.error .. " " or "")
					.. (diag.warning and icons.warn .. diag.warning or "")
				return vim.trim(ret)
			end,
			offsets = {
				{
					filetype = "neo-tree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
		highlights = {
			fill = {
				bg = { attribute = "bg", highlight = "MoonflyBackground" },
			},
			tab = {
				bg = { attribute = "bg", highlight = "MoonflyBackground" },
			},
			tab_selected = {
				bg = { attribute = "bg", highlight = "MoonflyBackground" },
				fg = { attribute = "fg", highlight = "MoonflyBlue" },
				bold = true,
			},
		},
	},
}
