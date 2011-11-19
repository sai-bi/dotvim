"
" a .vimrc by jh@jameshome.com
"   
" ingredients for our recipe:
"
"   Pathogen
"   http://www.vim.org/scripts/script.php?script_id=2332
"
"   birdsofparadise.vim
"   https://github.com/jameshome/dotvim/blob/master/colors/birdsofparadise.vim
"
"   Droid Sans Mono 
"   http://code.google.com/webfonts/family?family=Droid+Sans+Mono
"
"   and these scripts:
"   https://github.com/jameshome/dotvim/tree/master/bundle
"

set nocompatible

" PATHOGEN
"filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
"filetype plugin indent on

" VUNDLE
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'




" WHITESPACE
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2
set wrap linebreak textwidth=0
set nolist                      " I don't usually show list characters
set listchars=tab:▸\ ,eol:¬     " but when I do, I make it these list characters.

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
map <Leader>a :Ack 
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

  " LINE NUMBERS AND MARGIN INDICATOR
  set nu
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

fun! UpdateCaches()
  CommandTFlush
  echo "File caches updated."
endfun

" MACVIM MENUING AND KEY MAPPING
if has("gui_macvim")

  an <silent> 30.90 View.Toggle\ Line\ Numbers :set nu!<CR>
  an <silent> 30.100 View.Toggle\ Invisible\ Characters :set list!<CR>
  an 30.200 View.-SEP1- <Nop>
  an 30.210 View.Update\ File\ Caches :call UpdateCaches()<CR>
endif
  
