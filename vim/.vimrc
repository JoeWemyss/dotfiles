"" Remap Esacpe to JK 
inoremap jk <Esc>

" Turn on syntax highlighting
syntax on
set nocompatible
filetype plugin on

" Increase History
set history=500
" Setup caching/backups
set directory=$CUSTOM_CACHE_HOME/vim,~/,/tmp
set backupdir=$CUSTOM_CACHE_HOME/vim,~/,/tmp
set undodir=$CUSTOM_CACHE_HOME/vim,~/,/tmp
set viminfo+=n$CUSTOM_CACHE_HOME/vim/viminfo

" Set Hybrid numbers
set number relativenumber

" Autotoggle relative numbers
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

if $IS_WORK 
    so $VIM_CONFIG_DIR/.vimrc_work
endif

" config to allow `gf` to work with relative paths in JS projects
" Found here: https://damien.pobel.fr/post/configure-neovim-vim-gf-javascript-import/
set path=.,src
set suffixesadd=.js

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)

if empty(glob("$VIM_RUNTIME_DIR/autoload/plug.vim"))
  silent !curl -fLo $VIM_RUNTIME_DIR/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Add custom configs to the runtime
set runtimepath+=$VIM_CONFIG_DIR,$VIM_RUNTIME_DIR,$VIM_RUNTIME_DIR/after,$VIM

" Map CTRL-C to copy to clipboard
map <C-c> :w !pbcopy

" Enable syntax folding for XML like languages
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Add sensible backspace behaviour
set backspace=indent,eol,start

" Set up tab size
set tabstop=4
set shiftwidth=4
set expandtab
autocmd Filetype json setlocal tabstop=2

" Set mustache sql as sql syntax
au BufRead,BufNewFile *.sql.mst set filetype=sql

"
" Source plugins added with vim-plug
so $VIM_CONFIG_DIR/plugins.vim

"" Set colorscheme
colorscheme dogrun

let g:lightline = {
  \ 'colorscheme': 'dogrun',
  \ }


"colorscheme darcula
"let g:lightline = { 'colorscheme': 'darcula' }

"" Source CoC.nvim config
"so $VIM_CONFIG_DIR/plugin_config/coc.vim

so $VIM_CONFIG_DIR/plugin_config/misc.vim


""" Enable CursorLine
""set cursorline
""
""" Default Colors for CursorLine
""highlight  CursorLine ctermbg=Gray ctermfg=White
""
""" Change Color when entering Insert Mode
""autocmd InsertEnter * highlight  CursorLine ctermbg=Blue ctermfg=White
""
""" Revert Color to default when leaving Insert Mode
""autocmd InsertLeave * highlight  CursorLine ctermbg=Gray ctermfg=White



let dbs = {
    \ "dev" : $LOCAL_DB_URL
    \}

command -nargs=+ SetDB let:current_db=get(dbs, args)
