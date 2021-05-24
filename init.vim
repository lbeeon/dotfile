"dvim-plug {{{
  call plug#begin('~/.vim/plugged')

  " Make sure you use single quotes

  " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
  Plug 'junegunn/vim-easy-align'
  Plug 'derekwyatt/vim-scala'
  Plug 'Vimjas/vim-python-pep8-indent'

  " Any valid git URL is allowed
  " Plug 'https://github.com/junegunn/vim-github-dashboard.git'

  " Group dependencies, vim-snippets depends on ultisnips
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

  " On-demand loading
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

  Plug 'Valloric/YouCompleteMe'

  " Using a non-master branch
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

  " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
  Plug 'fatih/vim-go'
  " Plug 'fatih/vim-go', { 'tag': '*' }

  " Plugin options
  Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
  " Plug 'nsf/gocode', { 'rtp': 'vim' }

  " Plugin outside ~/.vim/plugged with post-update hook
  Plug 'junegunn/fzf'
  " Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  " ctrlp"
  Plug 'kien/ctrlp.vim'

  " Plug 'roxma/SimpleAutoComplPop'

  Plug 'https://github.com/vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'bling/vim-airline'

  Plug 'ddrscott/vim-side-search'

  " Theme
  " Plug 'pangloss/vim-javascript'

  " Plug 'rakr/vim-one'
  Plug 'gosukiwi/vim-atom-dark'
  " Plug 'ayu-theme/ayu-vim'

  Plug 'anyakichi/vim-surround'

  Plug 'majutsushi/tagbar'

  Plug 'tpope/vim-commentary'
  Plug 'vim-syntastic/syntastic'

  " Plug 'https://github.com/lbeeon/ale.git'
  " Plug 'w0rp/ale'
  " Add plugins to &runtimepath
  Plug 'vimwiki/vimwiki'

  Plug 'davidhalter/jedi-vim'

  Plug 'elzr/vim-json'
  Plug 'fisadev/vim-isort'
  Plug 'dense-analysis/ale'


  " Plug 'zivyangll/git-blame.vim'
  call plug#end()
" }}}

"keymap {{{
  let mapleader="\<SPACE>"
  iabbrev @@ lbeeon.wang@gmail.com

  " git blame
  " nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
 
  inoremap ` ``<ESC>i
  inoremap ( ()<ESC>i
  inoremap ' ''<ESC>i
  inoremap " ""<ESC>i
  inoremap [ []<ESC>i
  "inoremap { {<CR>}<Esc>ko
  inoremap { {}<ESC>i

  nnoremap <C-e> :NERDTreeToggle<CR>
  nnoremap <D-s> :w<CR>
  nnoremap fc :foldclose<CR>
  nnoremap <silent><Leader>ec :e $NVIMRC<CR>
  nnoremap <silent><Leader>rc :so %<CR>
  inoremap jj <esc>
  noremap <C-j> <C-w>j
  noremap <C-h> <C-w>h
  noremap <C-k> <C-w>k
  noremap <C-l> <C-w>l
  noremap <leader><tab> :TagbarToggle<CR>
  noremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

  " Tab navigation.
  nnoremap <Leader>1 :bprevious<CR>
  nnoremap <Leader>2 :bnext<CR>

  " nnoremap <Leader>tt <C-W>100h:call g:NERDTreeKeyMap.Invoke("P")<CR>:call g:NERDTreeKeyMap.Invoke("cd")<CR><C-W>100l:split term://fish<CR>:resize 30<CR>i
  nnoremap <Leader>tt <C-W>100j:resize 30<CR>
  nnoremap <C-w><C-q> <C-W>100j:resize 12<CR>i
  tnoremap <C-q><C-w> <C-\>tC-n>:resize 1<CR><C-W>100k
  tnoremap <ESC> <C-\><C-n>:resize 3<CR><C-W>100k
  tnoremap <ESC><ESC> <C-\><C-n>
  " noremap <Leader><ESC> <C-W>100j:resize 30<CR>i
  " noremap <silent><Leader><TAB> :<C-U>call ExpendTerm()<CR>
  noremap <silent><Leader><ESC> :<C-U>call ExpendTerm()<CR>
  function! ExpendTerm()
    exe "normal \<C-W>100l\<C-W>j00l"
    let termTest = matchstr(@%, 'term:\/\/')
    if empty(termTest)
      exec "normal \<C-W>100h:call g:NERDTreeKeyMap.Invoke(\"P\")\<CR>:call g:NERDTreeKeyMap.Invoke(\"cd\")\<CR>\<C-W>100l:split term:\/\/fish\<CR>:resize 30\<CR>i"
    else
      " echom termTest
      exe "normal :resize 30\<CR>i"
    endif
  endfunction

  vnoremap <Leader>// "zy:SideSearch <C-R>z<CR>
  nnoremap <Leader>// :SideSearch 
  vnoremap // "zy/<C-R>z<CR>
  vnoremap pp "_dP<ESC><CR>

  cnoremap <C-b> <Left>
  cnoremap <C-f> <Right>
" }}}

"default {{{
  syntax on
  set mouse=a
  set t_Co=256
  set background=dark
  colorscheme atom-dark
  " Use 256 colours (Use this setting only if your terminal supports 256  colours)
  " Always show statusline
  set laststatus=2
  set nu
  set ai
  set cursorline
  set tabstop=4
  set shiftwidth=2
  set expandtab
  " set foldmethod=syntax
  " set foldmethod=indent
  set foldmethod=marker
  " set nofoldenable
  " set guifont=Consolas:h36
  set guifont=Monaco:h10
  set splitright
  set splitbelow

  "share clipboard with system"
  set clipboard+=unnamedplus
  if has('nvim-0.1.5')        " True color in neovim wasn't added until 0.1.5
      set termguicolors
  endif
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
    " if (has("termguicolors"))
    "   set termguicolors
    " endif
  endif
" }}}

" airline {{{
  let g:airline#extensions#tabline#enabled = 1
  " call airline#parts#define_function('ALE', 'ALEGetStatusLine')
  " call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
  " let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
  " let g:airline_section_error = airline#section#create_right(['ALE'])
  " let g:airline_section_error = '%{exists("ALEGetStatusLine") ? ALEGetStatusLine() : ""}'
  " set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  " set statusline+=%*
  " set statusline+=%{ALEGetStatusLine()}

" }}}


" let g:ale_keep_list_window_open = 1


" let g:syntastic_javascript_checkers = ['standard']
autocmd bufwritepost *.js silent !standard --fix %
au Filetype json setlocal foldmethod=syntax
au Filetype soc_template setlocal foldmethod=syntax
set autoread

au Filetype yml setlocal foldmethod=indent
au Filetype yaml setlocal foldmethod=indent
au BufNewFile,BufRead Jenkinsfile setf groovy

" golang {{{
"
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_types = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1

  let g:go_fmt_command = "goimports"

  let g:go_fmt_fail_silently = 1

  let g:go_list_type = "quickfix"
  let g:go_fmt_autosave = 1
  au Filetype go nnoremap gv :GoDef <CR>
  au Filetype go nnoremap gs :sp <CR>:exe "GoDef"<CR>
  au Filetype go nnoremap gt :tab split <CR>:exe "GoDef"<CR>
  let g:ale_linters = {
  \   'go': ['go build', 'gofmt', 'go vet', 'staticcheck'],
  \}
  set completeopt-=preview
  "['go build', 'gofmt', 'golint', 'gometalinter', 'gosimple', 'go vet', 'staticcheck']
  " 1. variables are all defined in current scope, use keyword from current
  " buffer for completion `<C-x><C-n>`
  " 2. When the '.' is pressed, use smarter omnicomplete `<C-x><C-o>`, this
  " works well with the vim-go plugin
  " autocmd FileType go call sacp#enableForThisBuffer({ "matches": [
  "       \ { '=~': '\v[a-zA-Z]{4}$' , 'feedkeys': "\<C-x>\<C-n>"} ,
  "       \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-o>", "ignoreCompletionMode":1} ,
  "       \ ]
  "       \ })

" " }}}


let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
"let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/opt/python/libexec/bin/python'

" let g:UltiSnipsExpandTrigger="<Enter>"

" javascript setting"
" let g:javascript_plugin_jsdoc = 1
" let g:javascript_plugin_ngdoc = 1
" let g:javascript_plugin_flow = 1

" syntastic {{{
  " let g:syntastic_check_on_open = 1
  " let g:syntastic_check_on_wq = 0
  " let g:syntastic_always_populate_loc_list = 1
  " let g:syntastic_auto_loc_list = 1
  " let g:syntastic_aggregate_errors = 1
  " let g:syntastic_javascript_standard_exec = 'happiness'
  " let g:syntastic_javascript_standard_generic = 1
  " let g:syntastic_go_checkers = ['gofmt', 'golint', 'govet', 'errcheck', 'go']
  " let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
  " let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']

" }}}
" NERDTree {{{
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

  " Set a language to use its alternate delimiters by default
  let g:NERDAltDelims_java = 1

  " Add your own custom formats or override the defaults
  let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1

  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

  " Enable bookmarks
  let NERDTreeShowBookmarks=1

let g:ale_python_flake8_options= '--ignore E501,E402,E265,E722,E741,W503'
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
" let b:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let b:ale_warn_about_trailing_whitespace = 0
