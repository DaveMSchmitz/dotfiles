" Doesn't need to be Vi compatible the improved part of Vim
set nocompatible
filetype plugin indent on

" Syntax coloring
syntax enable
" Faster redraw
set ttyfast
" Quick redraw
set lazyredraw
" Always show the statusline
set laststatus=2
" Load a file if edited by an external source
set autoread
" Allow the backspace to delete anything
set backspace=2
" Show line numbers
set number
" Soft wrap
set wrap
" show position in the document reg statusline
set ruler
" Always report changed lines
set report=0
" Autocomplete commands menu
set wildmenu
" Quick timer
set updatetime=250
" give support for 256bit coloring
set t_Co=256
set background=light

" Enable mouse suppourt
set mouse=a
" Mouse fix for tmux
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
endif
" Smooth scroll
nnoremap <ScrollWheelUp> <C-Y>
nnoremap <ScrollWheelDown> <C-E>
" Arrow don't skip lines
nnoremap <Up> gk
nnoremap <Down> gj

" Spacing
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
autocmd Filetype haskell setlocal expandtab

" Use system clipboard
if !exists('$TMUX')
	set clipboard=unnamed "unnamedplus
endif

set display+=lastline

autocmd BufWritePre * :%s/\s\+$//e

" Remove splash
" set shortmess=I

" highlighting
set cursorline
set scrolloff=2
set colorcolumn=81
set hlsearch
set incsearch

colorscheme OneDarcula
let &fillchars=''
let &showbreak='↳ '
let &listchars='tab:│ '
" let &listchars='tab:│ ,eol:¬,nbsp:␣,trail:•,extends:⟩,precedes:⟨'
set list

" Omnicomplete
set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=0
let g:loaded_sql_completion=0
let g:omni_sql_no_default_maps=1

" Spellcheck
set spell spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add

"---------- Statusline ----------"
let g:mode_map = {
			\ '__' : '------',
			\ 'n'  : 'NORMAL',
			\ 'i'  : 'INSERT',
			\ 'R'  : 'REPLACE',
			\ 'v'  : 'VISUAL',
			\ 'V'  : 'V-LINE',
			\ 'c'  : 'COMMAND',
			\ '' : 'V-BLOCK',
			\ 's'  : 'SELECT',
			\ 'S'  : 'S-LINE',
			\ '' : 'S-BLOCK',
			\ 't'  : 'TERMINAL',
			\ }

" Automatically change the statusline color depending on mode
hi User1 term=bold cterm=bold ctermbg=235 ctermfg=207
func! ChangeStatuslineColor()
	if (mode() =~# '\v(n|no)')
		exe 'hi! User1 ctermfg=207'
	elseif (mode() =~# '\v(v|V|)')
		exe 'hi! User1 ctermfg=082'
	elseif (mode() ==# 'i')
		exe 'hi! User1 ctermfg=220'
	else
		exe 'hi! User1 ctermfg=045'
	endif
	return ''
endfunc
hi User2 term=none cterm=none ctermbg=235 ctermfg=254
hi User3 term=bold cterm=bold ctermbg=235 ctermfg=082
hi User4 term=none cterm=none ctermbg=235 ctermfg=203

set noshowmode
set statusline=%{ChangeStatuslineColor()}%1* " Changing the statusline color
set statusline+=\ %{g:mode_map[mode()]}%m\ %< " Current mode and modified flag
set statusline+=%4*%h%r "help file flag and read only flag
" set statusline+=\ %2*%n\  " buffernr
set statusline+=%2*%y\ %0*%F " Language and file path
set statusline+=\ %= " Left and right divide
set statusline+=%2*%{strlen(&fenc)?&fenc:'none'}[%{&ff}]\  "file encoding
set statusline+=%3*%P\ ␤\ %l/%L☰\ :\ %2v\  " end

"------   Plugin Setup   ------"
" Enable vim-plug
execute plug#begin()
Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle', 'NERDTree' ] }
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim', { 'on': ['GundoShow', 'GundoRenderGraph', 'GundoToggle'] }
Plug 'ap/vim-css-color'
Plug 'gregsexton/matchtag'
" Git
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': [ 'NERDTreeToggle', 'NERDTree' ] }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" Languages
Plug 'keith/swift.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'othree/html5.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-git'
" TMUX
if exists('$TMUX')
	Plug 'tpope/vim-tbone'
	Plug 'tmux-plugins/vim-tmux-focus-events'
	Plug 'roxma/vim-tmux-clipboard'
endif
execute plug#end()

"------   Plugin Settings   ------"
" Maps nerd tree for easy access
inoremap <silent> <C-\> <C-o>:NERDTreeToggle<cr>
noremap <silent> <C-\> :NERDTreeToggle<cr>
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_console_startup=1

noremap <silent> // :call NERDComment(0,"toggle")<cr>
let g:NERDSpaceDelims=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1

" Ale Setup
let g:ale_sign_column_always=1
let g:ale_statusline_format=['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error='>>'
let g:ale_sign_warning='--'
let g:ale_lint_delay=250
set statusline+=%4*%{exists('*ALEGetStatusLine')?ALEGetStatusLine():''}\ %*

" YCM
let g:ycm_auto_trigger=1
let g:ycm_min_num_of_chars_for_completion=0
let g:ycm_show_diagnostics_ui=0
let g:ycm_error_symbol=g:ale_sign_error
let g:ycm_warning_symbol=g:ale_sign_warning
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_extra_conf.py'

" Gitgutter signs
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='﹍'
let g:gitgutter_sign_removed_first_line='﹉'
let g:gitgutter_sign_modified_removed='┃'

" let g:NERDTreeIndicatorMapCustom = {
    " \ 'Modified'  : '✹',
    " \ 'Staged'    : '✚',
    " \ 'Untracked' : '✭',
    " \ 'Renamed'   : '➜',
    " \ 'Unmerged'  : '═',
    " \ 'Deleted'   : '✖',
    " \ 'Dirty'     : '✗',
    " \ 'Clean'     : '✔︎',
    " \ 'Ignored'   : '☒',
    " \ 'Unknown'   : '?'
    " \ }
