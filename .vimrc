set number	
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set backspace=indent,eol,start
set guifont=monaco

" Plugins (vim plug)

call plug#begin()

Plug 'https://github.com/leafgarland/typescript-vim' " vim - typescript
Plug 'https://github.com/lervag/vimtex' " vim for latex
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/sirver/ultisnips' " Vim + Snippets
Plug 'https://github.com/honza/vim-snippets' " Vim predefined snippets
Plug 'https://github.com/neoclide/coc.nvim' " Conquer of Completion vim

set encoding=UTF-8

call plug#end()

" KEY BINDINGS

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='general'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

" NERD Tree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F7> :TagbarToggle <CR>

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" F8 for compile without warning
noremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -O2 -o %< % && ./%< <CR>
inoremap <F8> <ESC> :w <CR> :!g++ -std=c++17 -O2 -o "%<" "%" && "./%<" <CR>

" F9 for compile with warning
noremap <F9> <ESC> :w <CR>:!g++ -std=c++17 -O2 -o %< % && ./%< < inp <CR>
inoremap <F9><ESC>:w<CR>:!g++ -std=c++17 -O2 -o "%<" "%" && "./%<" < inp <CR>

" F10 for interacive compile
noremap <F10> <ESC> :w <CR> :!g++ -Wshadow -Wextra -Wall -std=c++17 -O2 -o %< % && ./%< < inp <CR>
inoremap <F10> <ESC> :w <CR> :!g++ -Wshadow -Wextra -Wall -std=c++17 -O2 -o "%<" "%" && "./%<" < inp <CR>

" ultisnips 
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = '<c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-b>'
let g:UltiSnipsJumpBackwardTrigger = '<c-z>'

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
