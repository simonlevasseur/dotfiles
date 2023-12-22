"###############################################################################
"# Neovim Configuration ########################################################
"###############################################################################

" This Neovim config uses the vim-plug plugin manager and requires the following tools:
" - vim-plug
" - font with devicons
" - fzf
" - git
" - nvim
" - ripgrep
" - tmux

" Leader
let mapleader = "\<Space>"

"###############################################################################
"# Plugins #####################################################################
"###############################################################################

" Install vim-plug if it's not already present
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Start plugin block
call plug#begin(stdpath('data') . '/plugged')

"###############################################################################
"# Vim Defaults Plugins ########################################################
"###############################################################################

" Sensible defaults
Plug 'tpope/vim-sensible'

" Improves netrw
Plug 'tpope/vim-vinegar'

" Better buffer closing
Plug 'moll/vim-bbye'

"###############################################################################
"# Visual Plugins ##############################################################
"###############################################################################

" Status line
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" Nice theme, use this theme with terminal too
Plug 'arcticicestudio/nord-vim'

" Theme packs
"Plug 'rafi/awesome-vim-colorschemes' | Plug 'xolox/vim-misc' | Plug 'flazz/vim-colorschemes'

" Makes tmux use airline colors
"Plug 'edkolev/tmuxline.vim'

" Show git info in sidebar
"Plug 'mhinz/vim-signify'

" Dev icons
Plug 'ryanoasis/vim-devicons'

" Nicer scrolling
" Plug 'psliwka/vim-smoothie'

" Show indentation
Plug 'Yggdroot/indentLine'

"###############################################################################
"# Code Formatting Plugins #####################################################
"###############################################################################

" Rails in vim
Plug 'tpope/vim-rails'

" Language pack
Plug 'sheerun/vim-polyglot'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Automatically add end for if, do, def structures
Plug 'tpope/vim-endwise'

" Git plugin
Plug 'tpope/vim-fugitive'

" Continuously save the VIM session
Plug 'tpope/vim-obsession'

" Change surrounding tags quickly
Plug 'tpope/vim-surround'

" Change surrounding tags quickly
Plug 'tpope/vim-unimpaired'

" Code folding
" Plug 'Konfekt/FastFold'

" Visual *
Plug 'thinca/vim-visualstar'

"###############################################################################
"# Testing #####################################################################
"###############################################################################

" Run tests from vim
Plug 'janko-m/vim-test'

" Send commands from VIM to TMUX in a separate pane
Plug 'christoomey/vim-tmux-runner'

"###############################################################################
"# Navigation/Search Plugins ###################################################
"###############################################################################

" Ruby text object
Plug 'kana/vim-textobj-user'
Plug 'tek/vim-textobj-ruby'

Plug 'dewyze/vim-ruby-block-helpers'

" Fuzzy file finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Navigate between VIM and TMUX panes
Plug 'christoomey/vim-tmux-navigator'

" Project drawer
Plug 'preservim/nerdtree'

" LSP
" Plug 'neovim/nvim-lspconfig'

"###############################################################################
"# Miscellaneous ###############################################################
"###############################################################################

" Todo list
Plug 'aserebryakov/vim-todo-lists'

call plug#end()

"###############################################################################
"# Functions ###################################################################
"###############################################################################

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

" Send FZF results to the quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" Show Obsession status in airline
function! AirlineInit()
    let g:airline_section_z = airline#section#create(['%{ObsessionStatus(''$'', '''')}', 'windowswap', '%3p%% ', 'linenr', ':%3v '])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

"###############################################################################
"# Variables ###################################################################
"###############################################################################

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_type = 0

let g:fzf_preview_window = 'right:50%'
let g:fzf_action = { 'ctrl-q': function('s:build_quickfix_list') }

let g:VimTodoListsMoveItems = 0

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeMouseMode = 2
let NERDTreeShowHidden = 1
let NERDTreeStatusline = -1
let NERDTreeWinSize = 50

"###############################################################################
"# Automatic Commands ##########################################################
"###############################################################################

" q to close help files
autocmd Filetype help nnoremap <buffer> q :q<cr>

"###############################################################################
"# Settings ####################################################################
"###############################################################################

" System clipboard
set clipboard=unnamed

" Show line at 120 chars
set colorcolumn=120

" Don't hide links in Markdown
set conceallevel=0

" Highlight line with cursor
" Disabled for performance
" set cursorline

" Use spaces when pressing tab
set expandtab

" Fold based on indent
set foldmethod=indent

" Use ripgrep for vim-grep
set grepprg=rg\ --vimgrep

" Change buffers without saving changes
set hidden

" Case-insensitive searching
set ignorecase

" Do not redraw for commands not typed
set lazyredraw

" Mouse support in all modes
set mouse=a

" Start with folds all open
set nofoldenable

" Show line numbers
set number

" Use relative line numbers
set relativenumber

" Number of rows before and after the cursor
set scrolloff=5

" Round indent to multiple of 'shiftwidth'
set shiftround

" Number of spaces to use for indents
set shiftwidth=2

" Case-sensitive searching when using uppercase
set smartcase

" Open horizontal splits below
set splitbelow

" Open vertical splits to the right
set splitright

" Number of spaces to use for tab
set tabstop=2

"###############################################################################
"# Mappings ####################################################################
"###############################################################################

" Source VIMRC
nnoremap <leader>so :source $MYVIMRC<cr>

" Esc out of any mode
nnoremap <silent> <C-Space> <Esc>:noh<cr>
vnoremap <silent> <C-Space> <Esc>gV
onoremap <silent> <C-Space> <Esc>
cnoremap <silent> <C-Space> <C-c>
inoremap <silent> <C-Space> <Esc>

" Terminal sees <C-@> as <C-Space>
nnoremap <silent> <C-@> <Esc>:noh<cr>
vnoremap <silent> <C-@> <Esc>gV
onoremap <silent> <C-@> <Esc>
cnoremap <silent> <C-@> <C-c>
inoremap <silent> <C-@> <Esc>

" Search for anything
nnoremap \ :Find<space>
" nnoremap <leader>f :Find<space>

" Search for word under cursor
nnoremap <leader>w :Find <C-R><C-W><cr>

" Fuzzy file finding
nnoremap <silent> <leader>p :call FZFOpen(':Files')<cr>
" nnoremap <silent> <leader>p :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR> :Files<cr>

" Replace in file
nnoremap <leader>r :%s///g<Left><Left>

" Highlight word without moving
nnoremap * *``

" Delete without yanking
nnoremap <BS> "_d
nnoremap <BS><BS> "_dd
vnoremap <BS> "_d

" Repeat dot over range
xnoremap . :norm.<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" <A-j> move line down
" <A-k> move line up
nnoremap ∆ :m .+1<cr>==
nnoremap ˚ :m .-2<cr>==
inoremap ∆ <Esc>:m .+1<cr>==gi
inoremap ˚ <Esc>:m .-2<cr>==gi
vnoremap ∆ :m '>+1<cr>gv=gv
vnoremap ˚ :m '<-2<cr>gv=gv

" Buffers
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>d :Bdelete<cr>
nnoremap <leader>D :bufdo Bdelete!<cr>

" Netrw
nnoremap <leader>e :call FZFOpen(':Explore')<cr>
nmap <tab> :call FZFOpen(':bnext')<cr>
nmap <S-tab> :call FZFOpen(':bprev')<cr>

" NERDTree
let g:NERDTreeWinPos = "right"
nmap <leader>t :NERDTree<cr>
nnoremap <leader>ff :NERDTreeFind<cr>

" Testing
let test#strategy = "vtr"

nmap <silent> tn :TestNearest<cr>
nmap <silent> tf :TestFile<cr>
nmap <silent> tl :TestLast<cr>

" vim-tmux-runner
nnoremap <leader>vk :VtrKillRunner<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>

" Resize windows
if bufwinnr(1)
  map + <C-W>10>
  map _ <C-W>10<
endif

"###############################################################################
"# Commands ####################################################################
"###############################################################################
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

let g:rg_command = "rg --column --line-number --no-heading --ignore-case --hidden --follow --glob '!{.git/*,node_modules/*, sorbet/*}' --color 'always' "
command! -bang -nargs=* Find call fzf#vim#grep(g:rg_command . shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%'), <bang>0)
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%'), <bang>0)
