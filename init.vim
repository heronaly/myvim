set number
set ruler
syntax enable


"===========
"coc setting
"===========
set hidden
set updatetime=100
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"========
"vim-plug
"========
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter' 
Plug 'jacoborus/tender.vim'

call plug#end()
"color theme
if (has("termguicolors"))
	 set termguicolors
endif
syntax enable
colorscheme tender


"nerdcommenter settings
nmap <C-/>   <Plug>NERDCommenterToggle
vmap <C-/>   <Plug>NERDCommenterToggle<CR>gv


"airlinesetting
let g:airline_powerline_fonts=1
let g:airline#extensiln#tabline#enabled = 1

"terminal setting
:tnoremap <Esc> <C-\><C-n>
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
autocmd TermOpen * startinsert


"NERDTreeSetting
""open a NERDTree automatically when vim starts up if nofiles were specified
autocmd StdinReadPre * let s:std_in=1    
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif    

""open a NERDTree automatically when vim starts up on opening directory
autocmd StdinReadPre * let s:std_in=1    
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nmap <C-f> :NERDTreeToggle<CR>

""close vim if the only windows lfet open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Let NERDTree ignore files
let NERDTreeIgnore = ['\.pyc$', '\.swp$']
 
