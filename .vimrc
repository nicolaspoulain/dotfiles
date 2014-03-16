" Modeline and Notes 
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker :

" ======================================================
"   This is the personal .vimrc file of Nicolas Poulain.
" ======================================================
"}
"
" # Use bundles config {
    if filereadable(expand("~/.vim/.vimrc.bundles"))
        source ~/.vim/.vimrc.bundles
    endif
" }

" # Affiche les numeros de ligne
    set number
" # Avertissement par flash (visual bell) plutôt que beep
    set vb

" # Use spaces instead of tabs and be smart
    set expandtab
    set smarttab
" # 1 tab == 2 spaces
    set shiftwidth=2
    set tabstop=2
    set autoindent
    set smartindent
    set pastetoggle=<F12>  " pastetoggle (sane indentation on pastes)

" # Turns on ft detection, ft plugins, ft indenting 
    filetype plugin indent on 

" # Color the 81st column of wide lines 
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%81v', 100)

" # Active la coloration syntaxique
    syntax on
    syntax enable

" # Block mode is more useful than Visual mode
    nnoremap    v   <C-V>
    nnoremap <C-V>     v
    vnoremap    v   <C-V>
    vnoremap <C-V>     v

" # Folding
    set foldenable                  " Auto fold code

" # map F2 and F3 to open next and previous buffer
    nnoremap <F2> :bnext<CR> 
    nnoremap <F3> :bprevious<CR>

" # Sets how many lines of history VIM has to remember
    set history=1000
" # Setting up the directories 
    set backup                  " Backups are nice ...
    if has('persistent_undo')
        set undofile            " So is persistent undo ...
        set undolevels=1000     " Maximum number of changes that can be undone
        set undoreload=10000    " Maximum number lines to save for undo on a buffer reload
    endif

" # Turn on the WiLd menu for completion on opening files
    set wildmenu
"    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

" # Set 7 lines to the cursor - when moving vertically using j/k
    set so=7

" # With a map leader it's possible to do extra key combinations
    let mapleader = ","
    let g:mapleader = ","

" # Fast saving
    nmap <leader>w :w<cr>

" # Search
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
" # Disable highlight when <leader><cr> is pressed
    map <silent> <leader><cr> :noh<cr>

" # Show matching brackets over text indicator
    set showmatch
" # 10th of a second to blink when matching brackets
    set mat=2
    set matchpairs+=<:>             " Match, to be used with %

" # Moving around long lines made easy
    map j gj
    map k gk

" # Smart way to roatate windows
    map <C-j> <C-W>J
    map <C-k> <C-W>K
    map <C-h> <C-W>H
    map <C-l> <C-W>L
    set winminheight=0  " Windows is min 0 line high
    set splitright      " Puts new vsplit windows to the right of the current
    set splitbelow      " Puts new split windows to the bottom of the current

" # Return to last edit position when opening files
    autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
" # Remember info about open buffers on close
    set viminfo^=%

nmap <F8> :TagbarToggle<CR> 

" # Auto switch to the current file directory when a new buffer is opened
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif


    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix

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

" # la position du curseur 'ligne,colonne' + Barre de status {
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    if has('statusline')
      set laststatus=2
      " Broken down into easily includeable segments
      set statusline=%w%h%m%r                        " Options
      set statusline+=%{getcwd()}/                   " Current dir
      set statusline+=%<%f\                          " Filename
      set statusline+=[%{&ff}/%Y]                    " Filetype
      set statusline+=\ \ \ %{fugitive#statusline()} " Git Hotness
      set statusline+=%=%-14.(%l,%c%V%)\ %p%%        " file nav info
    endif
"}

" Snippets {

    " Use honza's snippets.
    let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1

    " For snippet_complete marker.
    if !exists("g:spf13_no_conceal")
        if has('conceal')
            set conceallevel=2 concealcursor=i
        endif
    endif

    " Disable the neosnippet preview candidate window
    " When enabled, there can be too much visual noise
    " especially when splits are used.
    set completeopt-=preview
" neocomplcache {

    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_enable_auto_delimiter = 1
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_force_overwrite_completefunc = 1

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

    " Plugin key-mappings {
        " These two lines conflict with the default digraph mapping of <C-K>
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
        if exists('g:spf13_noninvasive_completion')
            iunmap <CR>
            " <ESC> takes you out of insert mode
            inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
            " <CR> accepts first, then sends the <CR>
            inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
            " <Down> and <Up> cycle like <Tab> and <S-Tab>
            inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
            inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
            " Jump up and down the list
            inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
            inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
        else
            imap <silent><expr><C-k> neosnippet#expandable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                        \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
            smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

            inoremap <expr><C-g> neocomplcache#undo_completion()
            inoremap <expr><C-l> neocomplcache#complete_common_string()
            inoremap <expr><CR> neocomplcache#complete_common_string()

            " <CR>: close popup
            " <s-CR>: close popup and save indent.
            inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
            inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

            " <C-h>, <BS>: close popup and delete backword char.
            inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
            inoremap <expr><C-y> neocomplcache#close_popup()
        endif
        " <TAB>: completion.
        inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
    " }

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
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
"A mapping to make a backup of the current file.
function! WriteBackup()
  let l:fname = expand('%:p') . '__' . strftime('%Y_%m_%d_%H.%M.%S_%N')
  silent execute 'write' l:fname
  echomsg 'Wrote' l:fname
endfunction
nnoremap <Leader>ba :<C-U>call WriteBackup()<CR>
vnoremap <Leader>ba :<C-U>call WriteBackup()<CR>

cnoremap sudow w !sudo tee % >/dev/null