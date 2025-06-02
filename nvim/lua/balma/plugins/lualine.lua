return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		-- Optional: define fallback icons
		local icons = {
			diagnostics = {
				Error = "",
				Warn = "",
				Info = "",
				Hint = "",
			},
			git = {
				added = "+",
				modified = "~",
				removed = "-",
			},
		}

		local function get_dap_status()
			local ok, dap = pcall(require, "dap")
			if ok and dap.status() ~= "" then
				return "  " .. dap.status()
			end
			return ""
		end

		local function get_lazy_updates()
			local ok, lazy_status = pcall(require, "lazy.status")
			if ok and lazy_status.has_updates() then
				return lazy_status.updates()
			end
			return ""
		end

		local function get_noice_command()
			local ok, noice = pcall(require, "noice")
			if ok and noice.api.status.command.has() then
				return noice.api.status.command.get()
			end
			return ""
		end

		local function get_noice_mode()
			local ok, noice = pcall(require, "noice")
			if ok and noice.api.status.mode.has() then
				return noice.api.status.mode.get()
			end
			return ""
		end

		lualine.setup({
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "starter" },
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							info = icons.diagnostics.Info,
							hint = icons.diagnostics.Hint,
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{ "filename", path = 1 },
				},
				lualine_x = {
					get_dap_status,
					get_noice_command,
					get_noice_mode,
					get_lazy_updates,
					{
						"diff",
						symbols = {
							added = icons.git.added,
							modified = icons.git.modified,
							removed = icons.git.removed,
						},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = { "neo-tree", "fzf", "quickfix", "nvim-dap-ui" },
		})
	end,
}
