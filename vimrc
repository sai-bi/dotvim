"
" a .vimrc by jh@jameshome.com
"   
" ingredients for our recipe:
"
"   Vundle
"   http://www.vim.org/scripts/script.php?script_id=2332
"
"   birdsofparadise.vim
"   https://github.com/jameshome/dotvim/blob/master/colors/birdsofparadise.vim

set nocompatible
autocmd bufwritepost .vimrc source ~/.vimrc

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'AutoComplPop'
Bundle 'bufexplorer.zip'
Bundle 'wincent/Command-T'
Bundle 'msanders/snipmate.vim'
Bundle 'Gundo'
Bundle 'yurifury/hexHighlight'
Bundle 'sjbach/lusty'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'

" WHITESPACE
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set wrap linebreak textwidth=0
set nolist
set listchars=tab:▸\ ,eol:¬
set autoindent

" SEARCH AND BROWSE
set ignorecase
set smartcase
set gdefault
set scrolloff=3

" MESSAGING AND SOUND
set shortmess=asToOWAI
set showcmd
set vb t_vb=   " no bell of any kind

" COMMAND COMPLETION
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" BUFFER HANDLING
set hidden

" HISTORY
set history=1000

" KEYMAPS AND COMMANDS
let mapleader=" "
nmap <Space> <Nop>
nnoremap j gj
nnoremap k gk
vmap <D-]> >gv
vmap <D-[> <gv
map <Leader>g :call HandleURI()<CR><CR>
map <Leader>o :e.<CR>
map <Leader>w :q<CR>
map <Leader>v :vs<CR><C-w><C-W>
map <Leader>s :sp<CR><C-w><C-W>
map <Leader>i :IMG<CR>
map <silent> <Leader>b :LustyJuggler<CR>
map <silent> <Leader>7 :!iconv -c -f utf-8 -t ASCII//TRANSLIT<CR>
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <leader>rc <C-w><C-v><C-l>:e $MYVIMRC<CR>
if exists('*HexHighlight()')
  nmap <silent> <Leader>3 :<Plug>HexHighlightToggle<Return>
endif
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
cmap cd. :cd %:p:h<CR>:pwd<CR>




if has("gui_macvim")
  map <D-k> :!open -a Google\ Chrome %<CR><CR>
endif

" SWAP DIRECTORY
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" APPEARANCE
set background=dark

if has('gui_running')

  colorscheme birdsofparadise

  " INDICATOR
  set colorcolumn=85

  " FOLDING
  set foldcolumn=1
  set foldlevel=1

  " CLIPBOARD
  set clipboard=unnamed

  " SPELLING AND SEARCH HIGHLIGHTING
  set spell
  set incsearch
  set hlsearch
  " clear hlsearch on esc
  nnoremap <esc> :noh<return>:<BS><esc>

  " GUI 
  set guifont=Droid_Sans_Mono:h12
  set guioptions=e
  set fuoptions=maxhorz,maxvert
  set transparency=5
  set linespace=1
  set title titlestring=%t

  " STATUSLINE
  set laststatus=2
  set ruler
  set statusline=%f
  set statusline+=%1*
  set statusline+=\ %M
  set statusline+=%#StatusLineNC#
  set statusline+=%=
  set statusline+=%-10.(\ %Y%)
  set statusline+=\ %-8.(%l,%c%)
  set statusline+=\ %P\ 

  " CURSOR 
  set cursorline
  set guicursor=n-v-c:Block-Cursor/lCursor-blinkon0,ve:ver35-Cursor,o:hor5-Cursor,i-ci:ver15-Cursor/lCursor,r-cr:hor5-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

  " PRINTING
  set printfont=Droid_Sans_Mono:h10
  set printoptions=paper:letter,syntax:no,header:0
  
else
  syntax off
  set t_Co=0
end

" MACRO PACKAGES
runtime macros/matchit.vim

" OMNIFUNCTION COMPLETION
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
au BufNewFile,BufRead *.hbs set filetype=html
iabbrev </ </<C-X><C-O>
imap <C-Tab> <C-X><C-O>

" COMMAND-T
let g:CommandTMaxHeight=30

" NETRW
let g:netrw_sort_sequence='\<core\%(\.\d\+\)\=\>,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'

" SNIPMATE
let g:snippets_dir="~/.vim/snippets"

" AUTOCOMPLPOP
let g:acp_behaviorKeywordLength = 10

" LUSTY
let g:LustyJugglerSuppressRubyWarning = 1

" DELETE BACKGROUND BUFFERS
command! -nargs=*  Bufclean call CloseHiddenBuffers()
function! CloseHiddenBuffers()
  " figure out which buffers are visible in any tab
  let visible = {}
  for t in range(1, tabpagenr('$'))
    for b in tabpagebuflist(t)
      let visible[b] = 1
    endfor
  endfor
  " close any buffer that are loaded and not visible
  let l:tally = 0
  for b in range(1, bufnr('$'))
    if bufloaded(b) && !has_key(visible, b)
      let l:tally += 1
      exe 'bw ' . b
    endif
  endfor
  echon "Deleted " . l:tally . " buffers"
endfun

" OPEN URIS
fun! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
  echo s:uri
  if s:uri != ""
	  exec "!open \"" . s:uri . "\""
  else
	  echo "No link found."
  endif
endfun

" UPDATE COMMAND-T
fun! UpdateCaches()
  CommandTFlush
  echo "File caches updated."
endfun

" MENU FUNCTIONS
fun! NuYes()
  set nu
  an <silent> 30.90 View.Hide\ Line\ Numbers :call NuNo()<CR>
  aunmenu View.Show\ Line\ Numbers
endfun
fun! NuNo()
  set nonu
  an <silent> 30.90 View.Show\ Line\ Numbers :call NuYes()<CR>
  aunmenu View.Hide\ Line\ Numbers
endfun

fun! ListYes()
    set list
    an <silent> 30.90 View.Hide\ Invisible\ Characters :call ListNo()<CR>
    aunmenu View.Show\ Invisible\ Characters
endfun
fun! ListNo()
    set nolist
    an <silent> 30.90 View.Show\ Invisible\ Characters :call ListYes()<CR>
    aunmenu View.Hide\ Invisible\ Characters 
endfun

" MENU SETTINGS

fun! BufferToShell(script)
    exe '%! ' . a:script
endfun

if has("gui_running")
  fun! RemoveMenus()
    aunmenu Edit.Repeat
    aunmenu Edit.Settings\ Window
    aunmenu Edit.Startup\ Settings
    aunmenu Edit.Global\ Settings
    aunmenu Edit.File\ Settings
    aunmenu Edit.Color\ Scheme
    aunmenu Edit.-SEP3-
    aunmenu Edit.Keymap
    aunmenu Edit.Font
    aunmenu Buffers.
    aunmenu Syntax.
    aunmenu Tools.
  endfun
  autocmd VimEnter * call RemoveMenus()
  autocmd BufReadPost * aunmenu Buffers.
  an <silent> 30.90 View.Show\ Line\ Numbers :call NuYes()<CR>
  call NuYes()
  an <silent> 30.90 View.Hide\ Invisible\ Characters :call ListYes()<CR>
  call ListNo()
  an 30.200 View.-SEP1- <Nop>
  an 30.210 View.Update\ File\ Caches :call UpdateCaches()<CR>
  an 40.100 Text.Convert\ to\ ASCII :call BufferToShell('iconv -c -f utf-8 -t ASCII//TRANSLIT')<CR>
endif
  
