" Modeline and Notes {
" vim:tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :
" }
" ======================================================
"   This is the personal .vimrc file of Nicolas Poulain.
" ------------------------------------------------------
" Instalation :
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" Launch vim with this .vimrc, then :BundleInstall
" ======================================================

" Bundle setup & Support {
" The next lines ensure that the ~/.vim/bundle/ system works
    set nocompatible " Must be first line
    filetype off " required!
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
" }

" Colorscheme per hostname
let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "msi"
  "colorscheme elflord
  Bundle 'tomasr/molokai'
  colorscheme molokai
elseif hostname == "daforbb"
  colorscheme elflord
  let g:conoline_color_normal_dark = "guibg=black guifg=white gui=bold "
                           \. "ctermbg=black ctermfg=yellow"
  let g:conoline_color_insert_dark = "guibg=black guifg=white gui=bold "
                           \. "ctermbg=black ctermfg=white"
elseif hostname == "waldorf"
  colorscheme elflord
  let g:conoline_color_normal_dark = "guibg=black guifg=white gui=bold "
                           \. "ctermbg=black ctermfg=yellow"
  let g:conoline_color_insert_dark = "guibg=black guifg=white gui=bold "
                           \. "ctermbg=black ctermfg=white"
endif

" Bundles and their configuration {

" Highlight the line of the cursor
Bundle 'miyakogi/conoline.vim'
"{
" Highlight the column of the cursor with F10
fu! ToggleCurcol ()
  if &cursorcolumn
    set nocursorcolumn
  else
    set cursorcolumn
  endif
endfunction
map <F10> :call ToggleCurcol()<CR>
"}

"Bundle 'vim-pandoc/vim-pandoc'
"Bundle 'vim-pandoc/vim-pandoc-syntax'

Bundle 'tpope/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" ??????????????????????
Bundle 'wikimatze/tocdown'

" Vim motions on speed!
Bundle 'Lokaltog/vim-easymotion'

" place, toggle and display marks
Bundle 'kshenoy/vim-signature'

" deleting, changing, and adding surroundings
Bundle 'tpope/vim-surround'

" Syntax checking on the fly has never been so pimp
Bundle 'scrooloose/syntastic'
"{
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1
let g:syntastic_auto_jump = 2         " Jump to syntax errors
let g:syntastic_auto_loc_list = 1     " Auto-open the error list
"}

" A Git wrapper so awesome, it should be illegal
Bundle 'tpope/vim-fugitive'

" Configurable, flexible, intuitive text aligning
Bundle 'godlygeek/tabular'

" Python {
Bundle 'python.vim'
Bundle 'pythoncomplete'
 " }

" A tree explorer plugin that owns your momma!
Bundle 'scrooloose/nerdtree'
"{
    nmap <F7> :NERDTreeToggle<CR>
"}

" Fuzzy file, buffer, mru, tag, ... finder
Bundle 'kien/ctrlp.vim'
"{
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    " r - the nearest ancestor that contains a .git directory
    " a - the directory of the current file, but only if the current working
    " directory outside of CtrlP is not a direct ancestor of the directory of
    " the current file.
    let g:ctrlp_working_path_mode = 'ra'
"}

" Lean and mean status/tabline that's light as air
Bundle 'bling/vim-airline'
"{
    " the last windows always have a status-line
    set laststatus=2
    " pretty display
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
" }

" Display tags of a file ordered by scope
"{
if executable('ctags')
    Bundle 'majutsushi/tagbar'
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
            \ 'h:headings',
            \ 'l:links',
            \ 'i:images'
        \ ],
        \ "sort" : 0
        \ }
    nmap <F8> :TagbarToggle<CR>
endif
"}

" UltiSnips is the ultimate solution for snippets in Vim.
Bundle 'SirVer/ultisnips'
"{
" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'

    let g:UltiSnipsListSnippets="<c-x><c-u>"
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Supertab allows you to use <Tab> for all your insert" completion needs
Bundle 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "<c-n>"
"}

"}

set number          " display line numbers
set numberwidth=5   " nuw: width of number column
set t_Co=256        " Colors in the terminal
set showcmd         " display incomplete commands
set scrolloff=4     " keep 4 lines between current line and screen edge
set sidescrolloff=2 " keep 2 cols between the current col screen edge
let mapleader=','   " change map leader from \ to ,
set list " Show invisible characters
let &listchars = "tab:>-,trail:\u2591,extends:>,precedes:<,nbsp:\u00b7"

set wrap            " wrap lines (we map leader-W to toggle)
nmap <leader>W :set invwrap<CR>:set wrap?<CR>
" Moving around long lines made easy if wrap is on
map j gj
map k gk

" color the 81st column of wide lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


" tabs and shift {
set tabstop=2         " number of spaces that a tab renders as
set shiftwidth=2      " number of spaces to use for autoindent
set softtabstop=2     " number of spaces that tabs insert
set expandtab         " uses spaces whent tab is inserted
set smarttab          " helps with backspacing because of expandtab
set smartindent       " indent is automatically and smartly inserted
set autoindent        " autoindent should be on when using 'smartindent'.
set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
" }

filetype on              " enable file type detection
filetype plugin on       " load the plugin files for specific file types
filetype indent on       " load the indent file for specific file types
let g:tex_flavor='latex' " Prevent vim from setting filetype to `plaintex`
syntax enable            " active la coloration syntaxique
" twig is treated as html
autocmd BufNewFile,BufRead *.html.twig   set syntax=html



" folding {
set foldmethod=syntax " fdm: fold by the indentation by default
set foldnestmax=10    " fdn: deepest fold is 10 levels
"set nofoldenable      " nofen: don't fold by default
set foldlevel=1
" }

set splitright " Puts new vsplit windows to the right of the current
set splitbelow " Puts new split windows to the bottom of the current
" Key repeat hack for resizing splits, i.e., <C-w>+++- vs <C-w>+<C-w>+<C-w>-
" see: http://www.vim.org/scripts/script.php?script_id=2223
nmap <C-w>+ <C-w>+<SID>ws
nmap <C-w>- <C-w>-<SID>ws
nmap <C-w>> <C-w>><SID>ws
nmap <C-w>< <C-w><<SID>ws
nnoremap <script> <SID>ws+ <C-w>+<SID>ws
nnoremap <script> <SID>ws- <C-w>-<SID>ws
nnoremap <script> <SID>ws> <C-w>><SID>ws
nnoremap <script> <SID>ws< <C-w><<SID>ws
nmap <SID>ws <Nop>

" map F2 and F3 to switch to next and previous buffer
nnoremap <F2> :bnext<CR>
nnoremap <F3> :bprevious<CR>


" Allow writing via sudo
cnoremap w!! w !sudo tee > /dev/null %


" Search {
set incsearch  " incremental searching : search as you type
set hlsearch   " Highlight search matches
set ignorecase " Ignore case in search patterns
set smartcase  " Case sensitive if pattern contains upper case characters
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
"}

set showmatch       " show matching brackets "(:),{:},[:]"
set matchpairs+=<:> " add "<:>" as a matching pair


set wildmenu            " Turn on the Wild menu for completion on opening files
set wildignore+=*.~     "wig: ignore compiled objects and backups
set wig+=*.o,*.obj,*.pyc
set wig+=.sass-cache,tmp
" <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full

" Split into 2 continuous columns
:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

set history=100   " how many lines of history VIM has to remember
set nobackup      " in this age of version control, who needs it
set nowritebackup " don't make a backup before overwriting
set noswapfile    " don't litter swap files everywhere

    " undo
    if has('persistent_undo')
        " save/restore undo history to/from an undo file :
        " see InitializeDirectories() function
        set undofile
    " maximum number of changes that can be undone
        set undolevels=1000
    endif

" Return to last edit position when opening files
    autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
" Setting up the directories {
function! InitializeDirectories()
    let parent = $HOME
    let prefix = '.vim'
" with  prefix = 'my/dir/prefix_ this will create
"  ~/my/dir/prefix_backup,     ~/my/dir/prefix_views
"  ~/my/dir/prefix_swap   and  ~/my/dir/prefix_undo
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    let common_dir = parent . '/' . prefix

    for [dirname, settingname] in items(dir_list)
        let directory = common_dir . dirname . '/'
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()
" }
