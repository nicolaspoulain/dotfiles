" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :
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

" Bundles and their configuration {

" Vim motions on speed!
Bundle 'Lokaltog/vim-easymotion' 

Bundle 'tpope/vim-markdown'

" deleting, changing, and adding surroundings
Bundle 'tpope/vim-surround'

" Syntax checking on the fly has never been so pimp 
Bundle 'scrooloose/syntastic'

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
"    Bundle 'majutsushi/tagbar'
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

" Bundle Snippets & AutoComplete 
Bundle 'Shougo/neocomplcache'
    " {
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_enable_auto_delimiter = 1
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_force_overwrite_completefunc = 1
    let g:neocomplcache_max_menu_width = 30

    " I dont like automatic popup, <C-x><C-u> or <C-n> is better
    let g:neocomplcache_disable_auto_complete = 1

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown,twig setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    " }
Bundle 'Shougo/neosnippet'
    " {
    " }
Bundle 'honza/vim-snippets'
  " Snippets {
    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1
    " Tell neosnippet about the other snippets
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


    " key-mappings (note: conflict with the default digraph mapping of <C-K>)
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)
    imap <expr><CR> neosnippet#expandable_or_jumpable() ?
     \ "\<Plug>(neosnippet_expand_or_jump)"
     \: pumvisible() ? "\<C-k>" : "\<CR>"

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview
  " }
Bundle 'ervandew/supertab'
  " {
  let g:SuperTabDefaultCompletionType = "context"
  let g:SuperTabContextDefaultCompletionType = "<c-x><c-u>"
  " }

"}

" display line numbers
    set number
" Colors in the terminal
    set t_Co=256

" tabs and shift {
" tabs expanded to 2 spaces
    set tabstop=2
" shift text 2 spaces right or left
    set shiftwidth=2
"	autoindent should on when using 'smartindent'.
    set smartindent
    set autoindent
" pastetoggle (sane indentation on pastes)
    set pastetoggle=<F12>  
"}

" enable file type detection
		filetype on
" enable loading the plugin files for specific file types
		filetype plugin on
" enable loading the indent file for specific file types
		filetype indent on

" Prevent vim from setting filetype to `plaintex`
		let g:tex_flavor='latex'

" active la coloration syntaxique
    syntax enable

" auto fold code
    set foldenable                  

" color the 81st column of wide lines 
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%81v', 100)

" keep 5 lines up and below the cursor
    set so=5

" Puts new vsplit windows to the right of the current   
		set splitright      
" Puts new split windows to the bottom of the current   
		set splitbelow      
" map F2 and F3 to switch to next and previous buffer
    nnoremap <F2> :bnext<CR> 
    nnoremap <F3> :bprevious<CR>

" Moving around long lines made easy
    map j gj
    map k gk

" change map leader from "\" to ","
    let mapleader=","

" Search {
" incremental searching : search as you type
    set incsearch
" Highlight search matches
    set hlsearch
" Ignore case in search patterns
    set ignorecase
" Case sensitive if the search pattern contains upper case characters.
    set smartcase
" Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>
"}

" show matching brackets over text indicator "(:),{:},[:]"
    set showmatch
" add "<:>" as a matching pair
    set matchpairs+=<:>             


" Turn on the Wild menu for completion on opening files
    set wildmenu
" Command <Tab> completion, list matches, then longest common part, then all.
    set wildmode=list:longest,full  

" Sets how many lines of history VIM has to remember
    set history=1000
	" make a backup before overwriting a file
	 set backup 
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
    let prefix = 'Dropbox/dotfiles/.vim'
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
