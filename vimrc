" Vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'danilo-augusto/vim-afterglow'
Plug 'ntk148v/vim-horizon'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
" }}}

" Colors {{{
syntax enable               " enable syntax highlighting
set background=dark
colorscheme PaperColor
" }}}

" Spaces and Tabs {{{
set tabstop=4               " number of visual spaces per tab
set expandtab               " tabs are spaces
set modelines=1             " only check final line for a modeline
filetype indent on          " load filetype-specific indent files
" }}}

" UI Layout {{{
set number                  " show line numbers
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when we need to
set showmatch               " highlight matching [{()}]
" }}}

" Searching {{{
set path+=**                " Subfolder search / tab-completion for file-related tasks
set ignorecase              " ignore case when searching
set incsearch               " search as characters are entered
set hlsearch                " highlight all matches
" }}}

" Folding {{{
set foldmethod=indent       " fold based on indent level
set foldenable              " don't fold files by default on open
set foldnestmax=10          " max 10 depth
set foldlevelstart=10       " start with fold level of 1
" }}}

" Line Shortcuts {{{
"nnoremap j gj              
"nnoremap k gk
                            " (gV) highlight last inserted block
nnoremap gV `[v`]
" }}}

" Leader Shortcuts {{{
let mapleader=","           " leader is comma
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Insert Shortcuts {{{
inoremap kj <esc>
" }}}

" FZF & RG {{{

" Define own Find command
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
" }}}

" Lightline {{{
"
set laststatus=2
" }}}

" COC {{{
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" }}}

" vim:foldmethod=marker:foldlevel=0
