"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible | filetype indent plugin on | syntax on               
" set filetype off

"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.

"See help completion for source,
""Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
":set dictionary="/usr/dict/words"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Vim Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmode=longest,list,full
set wildmenu

"Enable Filetypes"     Moved to Plugins
"filetype on
"filetype plugin on
"filetype indent on
"syntax on

:set dictionary=/usr/share/dict/words

set nofoldenable
set scrolloff=10                        " scroll the window so there are 10 lines around the cursor
set cursorline                          " highlight the current line
set laststatus=2                        " always show the statusbar

set backspace=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" color scheme
syntax enable
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized

"Displays current cursor position in lower right corner"
set ruler

"Show command in bottom right portion of the screen"
set showcmd

"Set font type and size"
"set guifont=Menlo:h14"

"Show line numbers"
"set number
set relativenumber

"Line length marker"
if exists('+colorcolumn')
    let &colorcolumn="80,".join(range(120,500),",")
else 
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"Highlight searching"
set hlsearch

"Show matching brackets"
set showmatch 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

set shiftwidth=4
set modeline
set ls=2

"Tab options"
set softtabstop=4
set tabstop=4
set expandtab

"Indenting options"
set autoindent
set smartindent

"Better line wrapping"
set wrap 
set textwidth=79
set formatoptions=qrn1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow to save file without permission"
cmap w!! w !sudo tee >/dev/null %
map <F4> :ls<CR>:buffer<space>

" maps ,, to esc
imap ,, <ESC>
xmap ,, <ESC>

" Scrolling 
"nnoremap j <C-e>j
"nnoremap k <C-y>k

" next and previous tab
map ,jf :tabp<CR>
map ,fj :tabn<CR>

" Toggle paste mode ( no formatting )
set pastetoggle=<F2>

