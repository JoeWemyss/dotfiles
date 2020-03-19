" VIMWIKI
"" ------------------------------------------
let g:vimwiki_dir_link = 'index'
let g:vimwiki_toc_header = 'Table of contents'
let g:vimwiki_option_nested_syntaxes= {'javascript': 'js', 'json': 'json', 'sql': 'sql'}
let g:vimwiki_list = [{
      \ 'path': $HOME . '/doc/work',
      \ 'diary_rel_path': 'Diary/',
      \ 'diary_index': 'index',
      \ 'auto_toc': 1,
      \}]


"" Lexima (Auto-closing elements)
"" ------------------------------------------

let g:lexima_enable_basic_rules=1

let g:lexima_enable_newline_rules=1

"" /Lexima
"" ------------------------------------------

"" FZF (File searching)
"" ------------------------------------------
nmap <leader>b :Buffers<CR>

nmap <leader>f :Files<CR>
"" ------------------------------------------

" NERDTree
let g:NERDTreeNodeDelimiter = "\u00a0"
" Toggle on CTRL-O
map <C-o> :NERDTreeToggle<CR>

" Close NERDTree if it is last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Open NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


" Utilisnips
" ------------------------------------------
set runtimepath+="$CUSTOM_CONFIG_SOURCE/vim/plugin_config/ultisnips"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories = [$CUSTOM_CONFIG_SOURCE."/vim/plugin_config/ultisnips"]




"" DadBod
"" ------------------------------------------
let g:local_base = 'postgres://rmdev:rmdev1@172.25.1.10:5432/rmdevbase'
let g:local_testagency = 'postgres://rmdev:rmdev1@172.25.1.10:5432/testagency'
let g:local_db=$LOCAL_DB_URL

"" /DadBod
"" ------------------------------------------

"" Syntastic
"" ------------------------------------------
"" Map <leader>b to buffers
"" set statusline+=%#warningmsg#
"" set statusline+=%{SyntasticStatuslineFlag()}
"" set statusline+=%*
"" 
"" let g:syntastic_always_populate_loc_list = 1
"" let g:syntastic_auto_loc_list = 1
"" let g:syntastic_check_on_open = 1
"" let g:syntastic_check_on_wq = 0
"" let g:syntastic_javascript_checkers=['eslint']
"" let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"" /Syntastic
"" ------------------------------------------

"" Asciidoctor
"" ------------------------------------------
"" Function to create buffer local mappings

"fun! AsciidoctorMappings()
	"nnoremap <buffer> <leader>oo :AsciidoctorOpenRAW<CR>
	"nnoremap <buffer> <leader>op :AsciidoctorOpenPDF<CR>
	"nnoremap <buffer> <leader>oh :AsciidoctorOpenHTML<CR>
	"nnoremap <buffer> <leader>ox :AsciidoctorOpenDOCX<CR>
	"nnoremap <buffer> <leader>ch :Asciidoctor2HTML<CR>
	"nnoremap <buffer> <leader>cp :Asciidoctor2PDF<CR>
	"nnoremap <buffer> <leader>cx :Asciidoctor2DOCX<CR>
"endfun

"" Call AsciidoctorMappings for all `*.adoc` and `*.asciidoc` files
"augroup asciidoctor
	"au!
	"au BufEnter *.adoc,*.asciidoc call AsciidoctorMappings()
"augroup END
"" List of filetypes to highlight, default `[]`
"let g:asciidoctor_fenced_languages = ['sql', 'json', 'javascript']
"let g:asciidoctor_executable = 'asciidoctor'
"" /Asciidoctor
"" ------------------------------------------

"" Gutentags
"" ------------------------------------------
"let g:gutentags_add_default_project_roots = 0
"let g:gutentags_project_root = ['package.json', '.git']
"let g:gutentags_cache_dir = expand('~/.cache/vim/ctags/')
"let g:gutentags_generate_on_new = 1
"let g:gutentags_generate_on_missing = 1
"let g:gutentags_generate_on_write = 1
"let g:gutentags_generate_on_empty_buffer = 0
"let g:gutentags_ctags_extra_args = [
      "\ '--tag-relative=yes',
      "\ '--fields=+ailmnS',
      "\ ]
"let g:gutentags_ctags_exclude = [
      "\ '*.git', '*.svg', '*.hg',
      "\ '*/tests/*',
      "\ 'build',
      "\ 'dist',
      "\ '*sites/*/files/*',
      "\ 'bin',
      "\ 'node_modules',
      "\ 'bower_components',
      "\ 'cache',
      "\ 'compiled',
      "\ 'docs',
      "\ 'example',
      "\ 'bundle',
      "\ 'vendor',
      "\ '*.md',
      "\ '*-lock.json',
      "\ '*.lock',
      "\ '*bundle*.js',
      "\ '*build*.js',
      "\ '.*rc*',
      "\ '*.json',
      "\ '*.min.*',
      "\ '*.map',
      "\ '*.bak',
      "\ '*.zip',
      "\ '*.pyc',
      "\ '*.class',
      "\ '*.sln',
      "\ '*.Master',
      "\ '*.csproj',
      "\ '*.tmp',
      "\ '*.csproj.user',
      "\ '*.cache',
      "\ '*.pdb',
      "\ 'tags*',
      "\ 'cscope.*',
      "\ '*.css',
      "\ '*.less',
      "\ '*.scss',
      "\ '*.exe', '*.dll',
      "\ '*.mp3', '*.ogg', '*.flac',
      "\ '*.swp', '*.swo',
      "\ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      "\ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      "\ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      "\ ]
"" /Gutentags
"" ------------------------------------------
""

"" Git Messenger
""
"let g:git_messenger_no_default_mappings = v:true
"nmap <Leader>M <Plug>(git-messenger)
