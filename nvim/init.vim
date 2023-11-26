set nu
set rnu

call plug#begin()
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Linting
Plug 'dense-analysis/ale'

Plug 'nvim-lua/completion-nvim'

Plug 'sbdchd/neoformat'

Plug 'morhetz/gruvbox'

Plug 'f-person/git-blame.nvim'

" Plug 'Vigemus/iron.nvim'

" Plug 'github/copilot.vim'

" Plug 'deoplete-plugins/deoplete-clang'

Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
let g:magma_image_provide = "kitty"
" let g:magma_automatically_open_output = v:false

call plug#end()


colorscheme gruvbox

set colorcolumn=80
