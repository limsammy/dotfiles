"""" Vim Customization

" Adapted from: https://chrisyeh96.github.io/2017/12/18/vimrc.html 


""" Basic behaviour 
set number                      " show line numbers
set wrap                        " enable word wrapping
set encoding=utf-8      " set encoding to utf-8
"set mouse=a                    " enable mouse support (disable until comfortable with no-mouse)
set wildmenu            " visual autocomplete in command prompt
set laststatus=2        " always show statusline (even with only single window)
set ruler                       " show line and column number of cursor on right of statusline

""" Tab settings
set tabstop=4           " tab size width is 4 spaces
set expandtab           " convert tabs to spaces
set shiftwidth=4        " # of spaces for each step of autoindent
set softtabstop=4       " backsace after tab will rm this many spaces

set autoindent          " copy indent from current line on new line
set smartindent         " even better indent

""" vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'rhysd/vim-clang-format'           " Clang-Format. Available Styles: https://clang.llvm.org/docs/ClangFormatStyleOptions.html#basedonstyle
Plug 'vim-syntastic/syntastic'
Plug 'dracula/vim', {'as': 'dracula' }  " Dracula color scheme

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""" Dracula theme settings
colorscheme dracula

""" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" Clang-Format options
let g:clang_format#code_style = 'google'

