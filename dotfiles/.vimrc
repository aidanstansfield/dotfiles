" Begin plugins
call plug#begin('~/.vim/plugged')

" One Dark theme
" Plug 'joshdick/onedark.vim'

" Dracula
Plug 'dracula/vim', {'as': 'dracula'}

" Plug 'sheerun/vim-polyglot'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fugitive
" Plug 'tpope/vim-fugitive'

" fzf
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" Bracket pairs
Plug 'jiangmiao/auto-pairs'
"
" LanguageClient-neovim
" Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

" Neoformat
" Plug 'sbdchd/neoformat'

" Deoplete
" if has('nvim')
    " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
    " Plug 'Shougo/deoplete.nvim'
    " Plug 'roxma/nvim-yarp'
    " Plug 'roxma/vim-hug-neovim-rpc'
" endif
"
" Plug 'Shougo/echodoc.vim'
call plug#end()

" Echodoc
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'signature'

" Deoplete
" let g:deoplete#enable_at_startup = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"
" " Change default toggle from alt-p
" let g:AutoPairsShortcutToggle = '<F3>'
"
" " Enable alignment
" let g:neoformat_basic_format_align = 1
"
" " Enable tab to spaces conversion
" let g:neoformat_basic_format_retab = 1
"
" " Enable trimmming of trailing whitespace
" let g:neoformat_basic_format_trim = 1

set hidden

" Other Settings
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
        set termguicolors
    endif
endif

" Remove ~ from empty lines
" let g:onedark_hide_endofbuffer = 1
" let g:onedark_terminal_italics = 1
let g:airline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0 
colorscheme dracula

" NERD Comment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" let g:LanguageClient_serverCommands = {
    " \ 'python': ['pyls'],
    " \ }
" let g:LanguageClient_autoStart = 1
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" " Use <TAB> to select the popup menu:
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <C-j> pumvisible() ? "\<C-p>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"
" Ensure the cursor is set back to a blinking vertical line
au VimLeave * set guicursor=a:ver25-blinkon1

" Automatically call neomake when writing or reading a buffer, and on changes
" in insert and normal mode (after 1s; no delay when writing).
" call neomake#configure#automake('nrwi', 500)

set number
set signcolumn=yes
set noshowmode
syntax on
set nocompatible
filetype plugin indent on
set wrap
set scrolloff=5
set ttyfast
set matchpairs+=<:>
set colorcolumn=80
set mouse=a
set backspace=2
set ruler
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround

set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

set listchars=tab:»·,trail:·,nbsp:·

imap jj <Esc>
" commands don't work in paste mode, so allow quick switch between
set pastetoggle=<M-p>
" write with sudo priveleges
cnoremap sudow w !sudo tee % >/dev/null

set splitbelow
set splitright
highlight ColorColumn ctermbg=236 guibg=#303030
let &colorcolumn=join(range(80,999),',')
