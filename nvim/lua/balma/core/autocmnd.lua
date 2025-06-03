-- Consistent UI styling
vim.cmd([[  
    highlight TabLineFill guibg=NONE
    highlight TabLine guibg=NONE
    highlight TabLineSel guibg=NONE gui=bold
    
    highlight BufferLineFill guibg=NONE ctermbg=NONE
    highlight BufferLineBackground guibg=NONE
    highlight BufferLineBufferSelected guifg=#82aaff gui=bold
    
    highlight NormalFloat guibg=#011627
    highlight FloatBorder guifg=#1d3b53 guibg=#011627
    
    highlight TelescopeBorder guifg=#1d3b53
    highlight TelescopePromptBorder guifg=#1d3b53
    highlight TelescopeResultsBorder guifg=#1d3b53
    highlight TelescopePreviewBorder guifg=#1d3b53
]])

-- Disable folding on alpha buffer
vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
