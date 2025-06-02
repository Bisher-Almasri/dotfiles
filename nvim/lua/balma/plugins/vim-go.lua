return {
	"fatih/vim-go",
	ft = { "go", "gomod", "gosum" },
	config = function()
		vim.g.go_code_completion_enabled = 0 -- disable extras
		vim.g.go_fmt_autosave = 0
	end,
}
