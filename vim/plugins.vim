call plug#begin("$VIM_RUNTIME_DIR/vim/plugged")

" THEMES
Plug 'wadackel/vim-dogrun'
"Plug 'doums/darcula'
Plug 'itchyny/lightline.vim'

" UTILITIES
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdcommenter' 
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-dispatch'
Plug 'chrisbra/csv.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LANGUAGE
Plug 'cohama/lexima.vim'

" FILE FINDING
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" NERDTree
Plug 'preservim/nerdtree'

" DEVICONS (MUST BE LOADED LAST)
Plug 'ryanoasis/vim-devicons'

" VCS
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rhysd/git-messenger.vim'

" DB
Plug 'tpope/vim-dadbod'
"
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"Plug 'wellle/targets.vim'
"Plug 'vim-scripts/dbext.vim'
"Plug 'nelstrom/vim-visual-star-search'
"Plug 'tpope/vim-abolish'
"Plug 'leafgarland/typescript-vim'
"Plug 'Quramy/tsuquyomi'
"Plug 'shime/vim-livedown'
"Plug 'habamax/vim-asciidoctor'
"Plug 'dahu/vimple'
"Plug 'dahu/asif'
"Plug 'Raimondi/VimRegStyle'
"Plug 'vim-scripts/SyntaxRange'
"Plug 'tpope/vim-eunuch'

"Plug 'tpope/vim-rhubarb'
"Plug 'othree/yajs.vim'
call plug#end() 
