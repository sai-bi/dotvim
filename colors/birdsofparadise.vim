"
" birdsofparadise.vim
"
" Based on Joe Bergantine's spectacular Birds of Paradise theme:
" http://joebergantine.com/werkstatt/birds-of-paradise
"
" Maintainer: jh@jameshome.com
" 
set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name="birdsofparadise"

  hi Normal             guifg=#ffffff ctermfg=15   guibg=#372725 ctermbg=236  gui=NONE

  hi Comment            guifg=#938a89 ctermfg=245  guibg=NONE    ctermbg=NONE gui=NONE
  hi Todo               guifg=bg      ctermfg=fg   guibg=#efcb43 ctermbg=221  gui=NONE

  hi String             guifg=#d9d762 ctermfg=185  guibg=NONE    ctermbg=NONE gui=NONE
  hi link Character                   String
  hi Constant           guifg=#6c99bb ctermfg=67   guibg=NONE    ctermbg=NONE gui=NONE
  hi link Number                      Constant
  hi link Boolean                     Constant
  hi link Float                       Constant
  hi Identifier         guifg=#efcb43 ctermfg=221  guibg=NONE    ctermbg=NONE gui=NONE
  hi Function           guifg=#cc762e ctermfg=172  guibg=NONE    ctermbg=NONE gui=NONE
  hi Statement          guifg=#efcb43 ctermfg=221  guibg=NONE    ctermbg=NONE gui=NONE
  hi link Conditional                 Statement 
  hi link Exception                   Statement
  hi link Repeat                      Statement
  hi link Label                       Statement
  hi link Operator                    Statement
  hi link Keyword                     Statement
  hi PreProc            guifg=#ffffff ctermfg=15   guibg=NONE    ctermbg=NONE gui=NONE
  hi link Include                     PreProc
  hi link Define                      PreProc
  hi link Macro                       PreProc
  hi link PreCondit                   PreProc
  hi Type               guifg=#cc762e ctermfg=172  guibg=NONE    ctermbg=NONE gui=NONE
  hi link StorageClass                Type
  hi link Structure                   Type
  hi link Typedef                     Type
  hi Special            guifg=#bb99bb ctermfg=139  guibg=NONE    ctermbg=NONE gui=NONE
  hi link SpecialChar                 Type
  hi link Tag                         Type
  hi link Delimiter                   Type
  hi link SpecialComment              Type
  hi link Debug                       Type

  hi Underlined         guifg=fg                   guibg=NONE                 gui=NONE
  hi Title              guifg=fg                   guibg=NONE                 gui=NONE
  
  hi Cursor             guifg=#ffffff ctermfg=15   guibg=#ff7711 ctermbg=208  gui=NONE
  hi clear MatchParen
  hi MatchParen         guifg=#ffffff ctermfg=15   guibg=#6c99bb ctermbg=67   gui=NONE
  hi CursorLine         guifg=NONE    ctermfg=NONE guibg=#504444 ctermbg=59   gui=NONE
  hi CursorColumn       guifg=NONE    ctermfg=NONE guibg=#2a1d1b ctermbg=234  gui=NONE
  hi ColorColumn        guifg=NONE    ctermfg=NONE guibg=#372725 ctermbg=236  gui=NONE

  hi Visual             guifg=NONE    ctermfg=NONE guibg=#675757 ctermbg=59   gui=NONE
  hi VertSplit          guifg=#4a3837 ctermfg=237  guibg=#4a3837 ctermbg=237  gui=NONE
  hi LineNr             guifg=#675757 ctermfg=59   guibg=#2a1d1b ctermbg=234  gui=NONE
  hi StatusLine         guifg=#4a3837 ctermfg=237  guibg=#ffffff ctermbg=15   gui=reverse  cterm=reverse
  hi StatusLineNC       guifg=#4a3837 ctermfg=237  guibg=#887e7c ctermbg=244  gui=reverse  cterm=reverse
  hi User1              guifg=#4a3837 ctermfg=237  guibg=#ff7711 ctermbg=15   gui=reverse  cterm=reverse

  hi Folded             guifg=#4a3837 ctermfg=237  guibg=#ffffff ctermbg=15   gui=NONE  cterm=reverse
  hi FoldColumn         guifg=#1a1211 ctermfg=233  guibg=#2a1d1b ctermbg=234  gui=NONE
  
  hi Error              guifg=#ffffff ctermfg=15   guibg=#da4632 ctermbg=167  gui=NONE
  hi clear ErrorMsg
  hi link ErrorMsg                    Error

  hi ModeMsg            guifg=#ffffff ctermfg=15   guibg=#ff7711 ctermbg=208  gui=NONE
  hi MoreMsg            guifg=#2a1d1b ctermfg=234  guibg=#a0c25f ctermbg=143  gui=NONE
  hi Question           guifg=#a0c25f ctermfg=143  guibg=NONE                 gui=NONE

  hi Search             guifg=bg      ctermfg=bg   guibg=#a0c25f ctermbg=143  gui=NONE
  hi clear IncSearch
  hi IncSearch             guifg=bg      ctermfg=bg   guibg=#c9f578 ctermbg=143  gui=NONE

  hi NonText            guifg=#2a1d1b ctermfg=234   guibg=NONE   ctermbg=NONE gui=NONE
  hi clear SpecialKey
  hi link SpecialKey                  NonText

  hi SpellBad           guifg=NONE    ctermfg=NONE  guibg=NONE    ctermbg=NONE gui=underline
  hi SpellRare          guifg=NONE    ctermfg=NONE  guibg=NONE    ctermbg=NONE gui=NONE
  hi SpellCap           guifg=NONE    ctermfg=NONE  guibg=NONE    ctermbg=NONE gui=NONE

  hi Pmenu              guifg=NONE    ctermfg=NONE  guibg=#2b1e1b ctermbg=235  gui=NONE
  hi PmenuSel           guifg=NONE    ctermfg=NONE  guibg=#ff7711 ctermbg=208  gui=NONE
  hi clear PmenuSbar
  hi link PmenuSbar Pmenu
  hi clear PmenuThumb
  hi link PmenuThumb PmenuSel

  hi Directory          guifg=#c9bfbe ctermfg=251   guibg=NONE    ctermbg=NONE gui=NONE
  hi link netrwClassify               Directory                               
  hi clear netrwTreeBar
  hi link netrwTreeBar                Ignore
  hi link netrwSymLink                Normal                                  
                                                                              
  hi link htmlTag                     htmlStatement                           
