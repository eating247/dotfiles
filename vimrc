call plug#begin('~/.vim/bundle')

Plug 'rakr/vim-one' " colorscheme
Plug 'morhetz/gruvbox' " another color thing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " fuzzy finder
Plug 'christoomey/vim-run-interactive'
Plug 'vim-airline/vim-airline' " status line
Plug 'janko-m/vim-test'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/tComment'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'

call plug#end()

let g:is_posix = 1
let g:jsx_ext_required = 0
let mapleader = " "
set autowrite     " Automatically :write before running commands
set background=dark
colorscheme gruvbox
" colorscheme one
set backspace=2   " Backspace deletes like most programs in insert mode
set clipboard=unnamed " copy pasta
set colorcolumn=+1
set cursorline
set diffopt+=vertical
set expandtab
set history=50
<<<<<<< Updated upstream
if has('nvim')
  set inccommand=split
endif
=======
>>>>>>> Stashed changes
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set list listchars=tab:»·,trail:·,nbsp:·
set mouse=a
set nobackup
set nojoinspaces
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup
set number relativenumber
set numberwidth=5
set ruler         " show the cursor position all the time
set shiftround
set shiftwidth=2
set showcmd       " display incomplete commands
set splitbelow
set splitright
set tabstop=2
set textwidth=80
set wildignore+=tmp/** " ignore stuff that can't be opened
set wildmenu " enables a menu at the bottom of the vim window.
set wildmode=list:longest,list:full
syntax on
filetype plugin indent on

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" ale
let g:ale_linters = {
      \ 'javascript': ['prettier-standard', 'standard'],
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint'],
      \ 'ruby': ['rubocop', 'reek']
      \ }

let g:ale_fixers = {
      \ 'css': ['stylelint'],
      \ 'javascript': ['prettier-standard'],
      \ 'ruby': ['rubocop'],
      \ 'scss': ['stylelint']
      \ }

nnoremap <Leader>f :ALEFix<CR>

" let g:ale_javascript_prettier_options = '--single-quote --no-semi'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 0
let g:ale_statusline_format = ['✕ %d', '△ %d', '=_=']
let g:ale_sign_warning = '△'
let g:ale_sign_error = '✕'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" get out
inoremap jk <esc>

" smoother nav between lines
nnoremap j gj
nnoremap k gk

" fuzzyfinder
nnoremap <C-p> :Files<CR>

" nav between tabs
nnoremap J gT
nnoremap K gt

" i'm blind
nnoremap <Leader>blind :hi CursorLine ctermbg=125

" shortcuts
nnoremap <C-n> :nohl<cr>
nnoremap <C-t> <esc>:tabe<CR><C-p>
nnoremap <C-c> <esc>:tabc<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>b :wa<CR>:Buffers<CR>
nnoremap <Leader>rel :set relativenumber!<CR>
nnoremap <Leader>col :set cursorcolumn!<CR>
nnoremap v <C-v>e
nnoremap <Leader>a :Ag<space>

nnoremap top zt
nmap <Leader>source :source ~/.vimrc<cr>
nmap <Leader>plug :PlugInstall<cr>

" autocomplete parentheses/brackets
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>tt :TestNearest<CR>

" update jest snapshots
let g:test#runner_commands = ['Jest']
nnoremap <Leader>u :Jest <C-r>=escape(expand("%"), ' ') . ' ' . '--updateSnapshot'<CR><CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
