" The list of bundles included
" ----------------------------
" vim_bundle_manager:   https://github.com/gmarik/vundle
" vim_rtags: 		https://github.com/lyuts/vim-rtags
" vim_emmnet:           https://github.com/mattn/emmet-vim
" vim_tabular:		https://github.com/godlygeek/tabular
" vim_tcomment:		https://github.com/tomtom/tcomment_vim
" vim_ultisnips:	https://github.com/SirVer/ultisnips
" vim_indent_guides:    https://github.com/nathanaelkane/vim-indent-guides
" vim_auto_pairs: 	https://github.com/jiangmiao/auto-pairs
" vim_buffer_explorer:	https://github.com/fholgado/minibufexpl.vim
" vim_you_complete_me:  https://github.com/Valloric/YouCompleteMe
" vim_color_railscasts: https://github.com/vim-scripts/Railscasts-Theme-GUIand256color


" Forget being compatible with good ol' vi
set nocompatible

" Initialize Vim Bundle Manager - forked clone of vundle 
filetype off

" Setting up the vim bundle manager 
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vim_bundle_manager/README.md')

" If vundle is not installed install it
if !filereadable(vundle_readme)
    echo "Installing vim_bundle_manager.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/vinod-mv/vim_bundle_manager ~/.vim/bundle/vim_bundle_manager
    let iCanHazVundle=0
endif

" Set the path to the vundle manager 
set rtp+=~/.vim/bundle/vim_bundle_manager
call vundle#rc("~/.vim/bundle/")

"  Manage all bundles
call vundle#begin()

	" Manage Vundle
	Plugin 'vinod-mv/vim_bundle_manager'

	" Let Vundle manage other bundles
	" Repositories on github
	Plugin 'vinod-mv/vim_rtags'
	Plugin 'vinod-mv/vim_emmet'
	Plugin 'vinod-mv/vim_tabular'
	Plugin 'vinod-mv/vim_tcomment'
	Plugin 'vinod-mv/vim_ultisnips'
	Plugin 'vinod-mv/vim_git_gutter'
	Plugin 'vinod-mv/vim_auto_pairs'
	Plugin 'vinod-mv/vim_color_hybrid'
	Plugin 'vinod-mv/vim_ycm_generator'
	Plugin 'vinod-mv/vim_indent_guides'
	Plugin 'vinod-mv/vim_buffer_explorer'
	Plugin 'vinod-mv/vim_you_complete_me'
	Plugin 'vinod-mv/vim_color_jellybean'
	Plugin 'vinod-mv/vim_color_railscasts'

	" vim-scripts repos
	" Bundle 'Railscasts-Theme-GUIand256color'

	" non github repos
	" Bundle 'git://git.wincent.com/command-t.git'

call vundle#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype on
filetype plugin on
filetype indent on

" Turn off the annoying sounds and flicker
set visualbell 
autocmd VimEnter * set vb t_vb=

" Turn on that syntax highlighting
syntax on

" For color schemes
" set t_Co=256
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu
set wildmode=list:longest,full

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled,
" keep the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent

" Turn on line numbering
set number

" No backup and swap files
set nobackup
set noswapfile

" Setup the history of commands
set history=100

" Undo levels
set undolevels=1000

" Use this color scheme
" colorscheme railscasts
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
colorscheme jellybeans 
let g:jellybeans_overrides = {'background': {'guibg': '000000'},}
" Set background to dark
set background=dark

" Colour setting for Git-gutter
hi LineNr 			ctermfg=darkgrey ctermbg=black guifg=#555555 guibg=black
hi clear SignColumn
hi GitGutterAdd 		ctermfg=34       ctermbg=black guifg=#1a9850  guibg=black
hi GitGutterChange 		ctermfg=208      ctermbg=black guifg=#ff7000  guibg=black
hi GitGutterDelete 		ctermfg=196      ctermbg=black guifg=#f22f08  guibg=black
hi GitGutterChangeDelete 	ctermfg=196      ctermbg=black guifg=#f22f08  guibg=black  

" Git-gutter settings
let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '>'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_sign_removed_first_line = '*'
let g:gitgutter_sign_modified_removed   = 'x'

let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-p>"

let g:UltiSnipsSnippetsDir         = "~/.vim/snippet"
let g:UltiSnipsSnippetDirectories  = ['snippet']
let g:UltiSnipsMappingsToIgnore    = ['autocomplete']

" YouCompleteMe settings
let g:ycm_confirm_extra_conf           = 0
let g:ycm_extra_conf_vim_data          = ['&filetype']
let g:ycm_global_ycm_extra_conf        = "~/.vim/ycm_files/.ycm_extra_conf.py"
let g:ycm_enable_diagnostic_signs      = 0
" let g:ycm_path_to_python_interpreter   = 'python'
let g:ycm_python_binary_path           = 'python'
let g:ycm_seed_identifiers_with_syntax = 1

let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_key_list_accept_completion   = ['<C-y>']

" Emmet settings
let g:user_emmet_leader_key='<C-Z>'

" Some modification of the status line
function! CurDir()
    let curdir = substitute(getcwd(), '/home/vinod/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ Type:\ %Y\ \ CWD:\ %r%{CurDir()}%h\ \ Line:\ %l/%L:%c

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" ---------------------------------------------------------------------------------------------
" Change the mapleader from \ to ,
let mapleader=","

" Mapping - Toggle line numbers and fold columns for easy copying: 
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Temporarily switch to paste mode
set pastetoggle=<F3>

" Remapping so as to avoid arrow keys
nnoremap <up>     <nop>
nnoremap <down>   <nop>
nnoremap <left>   <nop>
nnoremap <right>  <nop>
inoremap <up>     <nop>
inoremap <down>   <nop>
inoremap <left>   <nop>
inoremap <right>  <nop>

" Fast editing of the .vimrc
nmap <leader>e :e ~/.vimrc 

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Setup MiniBufferExplorer
if &diff
	let g:miniBufExplorerMoreThanOne = 10
else
	" Set up the minibuf setting
	let g:miniBufExplMapWindowNavVim = 1
	let g:miniBufExplMapWindowNavArrows = 1
	let g:miniBufExplMapCTabSwitchBufs = 1
	let g:miniBufExplModSelTarget = 1

	" Map Ctrl+n to display the next buffer
	map <C-n> :bn<cr>
	" Map Ctrl+p to display the previous buffer
	map <C-p> :bp<cr>

	" Dont show the buffur numbers
	let g:miniBufExplShowBufNumbers = 0
endif
if &diff
	nnoremap :q<cr> :qa<cr>
	nnoremap :q!<cr> :qa!<cr>
endif

nmap <C-B> :pyf /usr/local/share/clang/clang-format.py<cr>
imap <C-B> <c-o>:pyf /usr/local/share/clang/clang-format.py<cr>

" Function to abbreviate a command
function! CommandCabbr(abbreviation, expansion)
	execute 'cabbr ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
endfunction
command! -nargs=+ CommandCabbr call CommandCabbr(<f-args>)

" Use it on itself to define a simpler abbreviation for itself.
CommandCabbr ccab CommandCabbr

" Command alias for convertion to and from hex
CommandCabbr hex %!xxd
CommandCabbr dex %!xxd<space>-r

" Latex is the flavour
let g:tex_flavor='latex'

if has("autocmd")
  " When Vim is in a console window, set the title bar to the name
  " name of the buffer being edited
  if !has("gui_running")
    auto BufEnter * let &titlestring="VIM - ".expand("%:p")
  endif
endif

au BufRead,BufNewFile *.tpp setfiletype cpp
au BufRead,BufNewFile *.tpp set filetype=cpp
