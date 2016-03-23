".vimrc
" Vi IMproved Run Command.
"
" Copyright (c) 2009-2016, Matt Busby @MrMattBusby.
" All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions
" are met:
" 
" 1. Redistributions of source code must retain the above copyright
"    notice, this list of conditions and the following disclaimer.
" 
" 2. Redistributions in binary form must reproduce the above copyright
"    notice, this list of conditions and the following disclaimer in
"    the documentation and/or other materials provided with the
"    distribution.
" 
" 3. Neither the name of the copyright holder nor the names of its
"    contributors may be used to endorse or promote products derived
"    from this software without specific prior written permission.
" 
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
" "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
" LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
" FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
" COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
" INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
" BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
" LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
" CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
" LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
" WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
" POSSIBILITY OF SUCH DAMAGE.
"
"==============================================================================
" File/Startup/Autocommand actions
"==============================================================================

" Pre
set nocompatible
filetype off

" Vundle
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Bundles
Plugin 'tpope/vim-fugitive'
Plugin 'brookhong/cscope.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'othree/html5.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline'
"""Plugin 'powerline/powerline'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'Yggdroot/indentLine'
"""Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'gabrielelana/vim-markdown'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'vim-scripts/python_match.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'Valloric/YouCompleteMe'
"""Plugin 'othree/html5-syntax.vim' " Not tested
"""Plugin 'pangloss/vim-javascript' " Not tested
"""Plugin 'Lokaltog/vim-easymotion'
"""Plugin 'terryma/vim-multiple-cursors'

" No longer used
"""Plugin 'scrooloose/syntastic'

call vundle#end()

" Switch on syntax highlighting
syntax on

" Set filetype stuff
filetype plugin indent on

" Leader
let mapleader = ","

" Color term
"set t_Co=88
set t_Co=128
colorscheme default

" Prevent funny characters, etc
set encoding=utf-8

" Autoclose autocompletion window
autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Autoclose if last buffer
"""autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && 
"""\ b:NERDTreeType == "primary") | q | endif

" Save and load window view/folds
" NOTE: if you source vimrc or something then save your file, options set in
"        an ftplugin will be overwritten by your view settings when the file is
"       reloaded!
"autocmd BufWinLeave * silent! mkview
"autocmd BufWinEnter * silent! loadview

" Map \q in Scratch buffer only to edit q macro
"autocmd BufWinEnter __Scratch__ nnoremap <buffer> <silent> <leader>q <ESC>0"qy$:q<CR>

if version > 702
  " Set colorcolumn
  set colorcolumn=80
   
  " Mouse to all modes
  "set mouse=a

  " Let mouse scroll and double-click copy
  set mouse=

  " These commands open folds
  "set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
  set foldopen=block,insert,mark,percent,quickfix,tag,undo
endif

"==============================================================================
" Settings
"==============================================================================

" Popup height
set pumheight=20

" Set numbering
set nu

" Set autoindent (keep same indent as last line) & smart (sometimes add 1 tab)
set autoindent
set smartindent
set smarttab

" (No) Highlight matching brackets
set noshowmatch

" Set the search scan to wrap lines, nowrap long lines
set wrapscan
set nowrap

" Set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase

" Backslashes suck
set shellslash

" Set update time (for saving smp file and autocmd for cursor hold)
set updatetime=1500

" Make command line two lines high
set ch=2

" (No) Fast term connection
set nottyfast

" For the blind
set cursorline

" Set tags and path directories
set tags=./tags,./TAGS,tags,TAGS,../tags,../../tags
set path=.,,..,../**,/usr/include,/usr/include/**,/usr/lib/gcc/**,/usr/include/c++/*,../../**

" NO SOUNDS!
set novb

" Backspacing over...
set backspace=indent,eol,start

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the 'must save first' error doesn't come up)
set hidden

" Autocompletion, set completion options such as preview
" longest seems to mess up some autocomplete plugins (supertab etc)
"set completeopt=menuone,menu,preview,longest
set completeopt=menuone,menu,preview

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" The text and replacing it
set cpoptions=ces$

" Custom status line
"""set stl=%f%m%r\ \ b%n\ \ (%Y)\ \ %p%%\ \ R:%l/%L\ \ C:%c\ \ B:0x%O=0x%B
" Powerline
"source ~/.vim/bundle/powerline/powerline/bindings/vim/plugin/powerline.vim

" Always a status line of height 2
set laststatus=2

" Don't update the display while executing macros
set lazyredraw

" Show the current command in the lower right corner
set showcmd

" Show the current mode
set showmode

" Hide the mouse pointer while typing
set mousehide

" This is the timeout used while waiting for user input on a multi-keyed macro
set timeoutlen=500

" Keep stuff in the history
set history=400

" When the page starts to scroll, keep the cursor x lines from the bottom
set scrolloff=2

" Disallow the cursor to go in to "invalid" places
set virtualedit=

" Disable encryption (:X)
set key=

" Make the command-line completion better
set wildmenu
set wildmode=list:full

" Same as default except that I remove the 'u' option
set complete=.,w,b,t

" When completing by tag, show the whole tag, not just the function name
set showfulltag

" FTLOG I hate textwidth
set textwidth=0

" Get rid of the silly characters in window separators
set fillchars=""

" Add ignorance of whitespace to diff
set diffopt+=iwhite

" Enable search highlighting
set hlsearch

" Incrementally match the search
set incsearch

" Syntax coloring slows down the world
set synmaxcol=2048

"==============================================================================
" Custom Functions
"==============================================================================

" Match on word click
nnoremap <silent> <leader>h :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  "let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    "echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au auto_highlight CursorHold * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
      "au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=1000
    "echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" Make tag file when saving file, ignore all errors, mark ~2
"""autocmd VimEnter,BufWritePost *.cpp,*.hpp,*.c,*.h silent! execute "!gen_tags.sh " . GetBuffNames()

" Rerun tag generation based on files open in buffer
"""nnoremap <silent> <F8> :silent! execute "!gen_tags.sh " . GetBuffNames()<CR>

function! GetBuffNames ()
  let s=[]
  for b in range(0,bufnr('$'))
    if buflisted(b)
      call add(s,fnamemodify(bufname(b),":p")) "need full name sent to script
    endif
  endfor
  return join(s,' ')
endfunction

"==============================================================================
" Custom Maps
"==============================================================================

" Edit <me>
nnoremap <silent> <leader>v :vs $HOME/.vimrc<CR>

" Edit the q register's macro
"nnoremap <silent> <leader>q :Scratch<CR>:res 1<CR>0S<C-r><C-r>q<ESC>$

" Arrow move in visual mode
vnoremap <LEFT>  x<LEFT>Pg`[<C-v>g`]
vnoremap <RIGHT> xpg`[<C-v>g`]
vnoremap <UP>    x<UP>Pg`[<C-v>g`]
vnoremap <DOWN>  x<DOWN>Pg`[<C-v>g`]

" Hulk SMASH!
inoremap jk <ESC>
inoremap JK <ESC>
inoremap kj <ESC>
inoremap KJ <ESC>

" Overwrite the cindent and indentkeys 0# option in insert
inoremap # X<BS>#

" Ninja <escape>
vnoremap <silent> <space> <ESC>

" Ninja z (<silent> still prints errors)
nnoremap <silent> <space> :silent! norm! za<CR>

" Typo
noremap gG G

" Quick quit
nmap <silent> Q :q<CR>

" Quick macro
noremap <leader>. qq

" Ignore that stupid window
noremap q: <Nop>

" @gly macro shortcut, who uses '`'?
noremap ` @q

" Cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Search the current file for what's currently in the search 
" register and display matches
noremap <silent> <leader>\/
     \ :vimgrep /<C-r>// %<CR>:ccl<CR>:cwin<CR><C-W>J

" Astyle current file in place
 nnoremap <leader>s :w!<CR>:silent !astyle -A2yCSUs3NLwYm0M40fpHk3W3j -xe %<CR>:e<CR>:redraw!<CR>

" Sort selection
vmap <silent> <leader>s :!sort<CR>

" Display buffers
nmap <silent> <leader>l :ls!<CR>

" Run current python file
nmap <silent> <leader>rp :w<CR>:lcd %:h<CR>:!python %<CR>

" Parenthesize
noremap <silent> <leader>p s()<ESC>PF(
vnoremap <silent> <leader>p c()<ESC>PF(

" Spacize
noremap <silent> <leader><space> s  <ESC>P
vnoremap <silent> <leader><space> c  <ESC>PB

" Search the current file for the word under the cursor and display matches
" TODO search all files in dir? :vimgrep <pat> **/*.xxx<CR>:copen<CR>
noremap <silent> <leader>* :vimgrep /<C-r><C-w>/ %<CR>:ccl<CR>:cwin<CR><C-W>J

" I no need halp
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Show highlighting group, obviously useful if something is hl'ed and you
" don't know why - trace back to syn region
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Force saving files that require root permission
cmap w!! %!sudo tee > /dev/null %

" Clear all search highlights (was <leader>/ but who rly uses ? vs /..N)
noremap <silent> ? :match<bar>nohls<CR>:silent! au! auto_highlight<CR>:silent! aug! auto_highlight<CR>

" Alt navigation (will only work in gvim b/c X will steal)
noremap <A-1> :b1<CR>
noremap <A-2> :b2<CR>
noremap <A-3> :b3<CR>
noremap <A-4> :b4<CR>
noremap <A-5> :b5<CR>
noremap <A-6> :b6<CR>
noremap <A-7> :b7<CR>
noremap <A-8> :b8<CR>
noremap <A-9> :b9<CR>
noremap <A-0> :b10<CR>
noremap <A-l> :bl<CR>
noremap <A-p> :bp<CR>
noremap <A-n> :bn<CR>

" Turn off VIM's default regex in search (don't have to escape <'s etc)
nnoremap / /\\v\\c
vnoremap / /\\v\\c

" Search magically
cnoremap s: s:<Bslash>v<Bslash>c

" So lazy
nnoremap ; :
vnoremap ; :
nnoremap <Bar> ^

" Make
nnoremap <F6> :silent make <Bar> cn<CR>

" Pageup/down
nnoremap <A-j> M<C-f>M
vnoremap <A-j> <C-f>
nnoremap <A-k> M<C-b>M
vnoremap <A-k> <C-b>

" Fast scroll
nnoremap J 12j
vnoremap J 12j
nnoremap K 12k
vnoremap K 12k
nnoremap <leader>j J

" Tags
" Define
nnoremap <leader>d g<C-]>
nnoremap <leader>D g]
nnoremap <leader>b <C-T> " Go back in tagstack

" Inc/Dec
nnoremap + <C-a>
nnoremap - <C-x>

" Window nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Wrapped line nav
nnoremap j gj
nnoremap k gk

" Reselect vis block after in/outdenting
vnoremap < <gv
vnoremap > >gv

"==============================================================================
" Plugin Settings
"==============================================================================

"--------
" Tag Bar
"--------

" Map
nmap <silent> <F3> :TagbarToggle<CR>

"-----------
" Easy align
"-----------
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

"---------------------
" Mini Buffer Explorer
"---------------------

" MiniBufExpl already has autoclose
nmap <silent> <F4> :MBEToggle<CR>

" Show at bottom, control with C-Tab
"let g:miniBufExplSplitBelow=1

" Tab switch
let g:miniBufExplMapCTabSwitchBufs=1

"--------------
" YouCompleteMe
"--------------
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py"

"----------
" NERD Tree
"----------

" Bookmarks
let NERDTreeShowBookmarks=1
let NERDTreeMinimalUI=1

" Toggle the NERD Tree on an off
nmap <silent> <F2> :NERDTreeToggle<CR>

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$',
            \ '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$',
            \ '\.embed\.manifest$', '\.embed\.manifest.res$',
            \ '\.intermediate\.manifest$', '^mt.dep$', '\.o$',
            \ '\.pyc$', '\.pyo$']

" Store the bookmarks file
let NERDTreeBookmarksFile="~/.NERDTreeBookmarks"

"---------------
" NERD Commenter
"---------------

" Comment lines, c/n/<space>
"<leader>\c*

"---------
" SuperTab
"---------

" Context completion will attemp to deduce type wanted
"""let g:SuperTabDefaultCompletionType = "context"
"""let g:SuperTabContextDefaultCompletionType = "<c-x><c-n>"

"----------
" Syntastic
"----------

" Include dirs
let g:syntastic_c_include_dirs = [ '' ]

" Other compiler options
let g:syntastic_c_compiler_options = ''

" Start check on open, is slow
"""let g:syntastic_check_on_open = 0

" Parse header files?
let g:syntastic_c_check_header = 1

" Remove errors from other included files -- not sure if this actually works
let g:syntastic_c_remove_include_errors = 1

"==============================================================================
" Depricated Plugin
"==============================================================================

"------------
" Neocomplete
"------------

" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplcache.
"""let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
"""let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
"""let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"""let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
"""let g:neocomplcache_min_syntax_length = 2
"""let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
"""let g:neocomplcache_dictionary_filetype_lists = {
    """\ 'default' : '',
    """\ 'vimshell' : $HOME.'/.vimshell_hist',
    """\ 'scheme' : $HOME.'/.gosh_completions'
    """\ }

" Define keyword.
"""if !exists('g:neocomplcache_keyword_patterns')
  """let g:neocomplcache_keyword_patterns = {}
"""endif
"""let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
