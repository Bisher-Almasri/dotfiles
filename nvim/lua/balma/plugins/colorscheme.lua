return {
	"bluz71/vim-moonfly-colors",
	priority = 1000,
	config = function()
		vim.g.moonflyTransparent = true

		vim.cmd([[colorscheme moonfly]])
	end,
}
