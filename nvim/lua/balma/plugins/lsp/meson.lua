return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"rust_analyzer",
				"zls",
				"jdtls",
				"gopls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"rustfmt", -- rust formatter
				"gofumpt", -- Go formatter
				"goimports", -- Go import sorter
				"golines", -- Go line formatter
				"revive", -- Go linter
			},
		})

		local lspconfig = require("lspconfig")

		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = {
						version = "Lua 5.4.7",
						path = vim.split(package.path, ";"),
					},
					diagnostics = {
						globals = { "love" },
					},
					workspace = {
						checkThirdParty = false,
						telemetry = { enable = false },
						library = {
							"${3rd}/love2d/library",
						},
					},
					completion = {
						enable = true,
						callSnippet = "Both",
					},
				},
			},
		})
	end,
}
