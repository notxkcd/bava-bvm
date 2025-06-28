" vim: cc=32,47,62 vsts=31,15,15,4
" Full name: C++ Eclipse CDT
" Short name: cpp_eclipse_cdt
" Author: Maxim Kim <habamax@gmail.com>
" Website: https://www.github.com/habamax/vim-pire
" Description: Vim colorscheme based on Eclipse CDT dark theme, adapted for C++ syntax

" Initialize colorscheme
set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "cpp_eclipse_cdt"

" Default links
hi link Terminal Normal
hi link StatuslineTerm Statusline
hi link StatuslineTermNC StatuslineNC
hi link LineNrAbove LineNr
hi link LineNrBelow LineNr
hi link MessageWindow Pmenu
hi link PopupNotification Todo
hi link CurSearch Search

" =============================================================================
" COLOR PALETTE - DARK BACKGROUND
" =============================================================================
hi Color color00 #1e1f22 guifg=#1e1f22 guibg=#1e1f22 ctermfg=234 ctermbg=234 " Background
hi Color color01 #ff0000 guifg=#ff0000 guibg=#ff0000 ctermfg=196 ctermbg=196 " Red (Error, Operator)
hi Color color02 #80f2f6 guifg=#80f2f6 guibg=#80f2f6 ctermfg=123 ctermbg=123 " Cyan (String)
hi Color color03 #ff8700 guifg=#ff8700 guibg=#ff8700 ctermfg=208 ctermbg=208 " Orange (Statement)
hi Color color04 #1290c3 guifg=#1290c3 guibg=#1290c3 ctermfg=32  ctermbg=32  " Blue (Type, StorageClass)
hi Color color05 #d75fd7 guifg=#d75fd7 guibg=#d75fd7 ctermfg=170 ctermbg=170 " Magenta (Keyword)
hi Color color06 #a7ec21 guifg=#a7ec21 guibg=#a7ec21 ctermfg=148 ctermbg=148 " Green (Macro, Constant)
hi Color color07 #d0d0d0 guifg=#d0d0d0 guibg=#d0d0d0 ctermfg=252 ctermbg=252 " Foreground (Normal)
hi Color color08 #626262 guifg=#626262 guibg=#626262 ctermfg=241 ctermbg=241 " Dark Grey (Comment)
hi Color color09 #ff5f00 guifg=#ff5f00 guibg=#ff5f00 ctermfg=202 ctermbg=202 " Dark Orange (cppMemory)
hi Color color10 #6897bb guifg=#6897bb guibg=#6897bb ctermfg=67  ctermbg=67  " Light Blue (Number, Float)
hi Color color11 #ffff00 guifg=#ffff00 guibg=#ffff00 ctermfg=226 ctermbg=226 " Yellow (Search, Warning)
hi Color color12 #00ffff guifg=#00ffff guibg=#00ffff ctermfg=51  ctermbg=51  " Cyan (cppLambda)
hi Color color13 #875fff guifg=#875fff guibg=#875fff ctermfg=99  ctermbg=99  " Purple (cppTemplate)
hi Color color14 #afffaf guifg=#afffaf guibg=#afffaf ctermfg=157 ctermbg=157 " Light Green (cppStructBinding)
hi Color color15 #ffffff guifg=#ffffff guibg=#ffffff ctermfg=231 ctermbg=231 " White
hi Color color16 #ffbf26 guifg=#ffbf26 guibg=#ffbf26 ctermfg=214 ctermbg=214 " Bright Orange (Function)
hi Color colorLine #303030 guifg=#303030 guibg=#303030 ctermfg=236 ctermbg=236 " CursorLine
hi Color colorB #444444 guifg=#444444 guibg=#444444 ctermfg=238 ctermbg=238 " Visual, StatusLine
hi Color colorNonT #444444 guifg=#444444 guibg=#444444 ctermfg=238 ctermbg=238 " LineNr
hi Color colorTab #3a3a3a guifg=#3a3a3a guibg=#3a3a3a ctermfg=237 ctermbg=237 " StatusLineNC
hi Color colorC #d0d0d0 guifg=#d0d0d0 guibg=#d0d0d0 ctermfg=252 ctermbg=252 " Cursor
hi Color colorlC #ff00ff guifg=#ff00ff guibg=#ff00ff ctermfg=201 ctermbg=201 " lCursor
hi Color colorMP #c5e7c5 guifg=#c5e7c5 guibg=#c5e7c5 ctermfg=151 ctermbg=151 " MatchParen
hi Color colorDim #808080 guifg=#808080 guibg=#808080 ctermfg=244 ctermbg=244 " PmenuThumb

" Diff colors for dark background
hi Color diffAdd #005f00 guifg=#005f00 guibg=#005f00 ctermfg=22  ctermbg=22
hi Color diffAddFg #afffaf guifg=#afffaf guibg=#afffaf ctermfg=157 ctermbg=157
hi Color diffDelete #5f0000 guifg=#5f0000 guibg=#5f0000 ctermfg=52  ctermbg=52
hi Color diffDeleteFg #ffafaf guifg=#ffafaf guibg=#ffafaf ctermfg=217 ctermbg=217
hi Color diffChange #5f005f guifg=#5f005f guibg=#5f005f ctermfg=53  ctermbg=53
hi Color diffChangeFg #d0d0d0 guifg=#d0d0d0 guibg=#d0d0d0 ctermfg=252 ctermbg=252
hi Color diffText #5f0087 guifg=#5f0087 guibg=#5f0087 ctermfg=54  ctermbg=54
hi Color diffTextFg #afffff guifg=#afffff guibg=#afffff ctermfg=159 ctermbg=159

" Terminal colors for dark background
let s:terminal_colors = [
  \ "color00", "color01", "color02", "color03", "color04", "color05", "color06", "color07",
  \ "color08", "color09", "color10", "color11", "color12", "color13", "color14", "color15"
\ ]

" =============================================================================
" HIGHLIGHT GROUPS - DARK BACKGROUND
" =============================================================================
" gui/256/16 variants
if has("gui_running") || &t_Co >= 256
  hi Normal guifg=#d0d0d0 guibg=#1e1f22 ctermfg=252 ctermbg=234
  hi Cursor guifg=#262626 guibg=#d0d0d0 gui=reverse ctermfg=235 ctermbg=252 cterm=reverse
  hi lCursor guifg=#ff00ff guibg=#1e1f22 gui=reverse ctermfg=201 ctermbg=234 cterm=reverse
  hi CursorLine guifg=NONE guibg=#303030 ctermfg=NONE ctermbg=236
  hi CursorLineNr guifg=#ffff00 guibg=NONE gui=bold ctermfg=226 ctermbg=NONE cterm=bold
  hi Visual guifg=NONE guibg=#444444 ctermfg=NONE ctermbg=238
  hi VisualNOS guifg=NONE guibg=#5fafff ctermfg=NONE ctermbg=67
  hi Search guifg=#262626 guibg=#ffff00 ctermfg=235 ctermbg=226
  hi IncSearch guifg=#262626 guibg=#ffaf00 ctermfg=235 ctermbg=214
  hi LineNr guifg=#444444 guibg=NONE ctermfg=238 ctermbg=NONE
  hi NonText guifg=#444444 guibg=NONE ctermfg=238 ctermbg=NONE
  hi FoldColumn guifg=#949494 guibg=#262626 ctermfg=246 ctermbg=235
  hi EndOfBuffer guifg=#444444 guibg=NONE ctermfg=238 ctermbg=NONE
  hi SpecialKey guifg=#444444 guibg=NONE ctermfg=238 ctermbg=NONE
  hi StatusLine guifg=#d0d0d0 guibg=#444444 gui=reverse ctermfg=252 ctermbg=238 cterm=reverse
  hi StatusLineNC guifg=#808080 guibg=#3a3a3a gui=reverse ctermfg=244 ctermbg=237 cterm=reverse
  hi VertSplit guifg=#3a3a3a guibg=#3a3a3a ctermfg=237 ctermbg=237
  hi TabLine guifg=#d0d0d0 guibg=#3a3a3a ctermfg=252 ctermbg=237
  hi TabLineFill guifg=NONE guibg=#808080 ctermfg=NONE ctermbg=244
  hi TabLineSel guifg=#ffffff guibg=#1e1f22 ctermfg=231 ctermbg=234
  hi ToolbarLine guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
  hi ToolbarButton guifg=#1e1f22 guibg=#ffffff ctermfg=234 ctermbg=231
  hi Pmenu guifg=#d0d0d0 guibg=#3a3a3a ctermfg=252 ctermbg=237
  hi PmenuSel guifg=#262626 guibg=#5fd7ff ctermfg=235 ctermbg=81
  hi PmenuSbar guifg=NONE guibg=#4e E4E4E4 ctermfg=NONE ctermbg=239
  hi PmenuThumb guifg=NONE guibg=#808080 ctermfg=NONE ctermbg=244
  hi SignColumn guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
  hi Error guifg=#ffffff guibg=#ff0000 ctermfg=231 ctermbg=196
  hi ErrorMsg guifg=#ffffff guibg=#ff0000 ctermfg=231 ctermbg=196
  hi WarningMsg guifg=#262626 guibg=#ffff00 ctermfg=235 ctermbg=226
  hi ModeMsg guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi MoreMsg guifg=#a7ec21 guibg=NONE ctermfg=148 ctermbg=NONE
  hi Question guifg=#d75fd7 guibg=NONE ctermfg=170 ctermbg=NONE
  hi Todo guifg=#262626 guibg=#ffff00 gui=bold ctermfg=235 ctermbg=226 cterm=bold
  hi debugPC guifg=#1290c3 guibg=NONE gui=reverse ctermfg=32 ctermbg=NONE cterm=reverse
  hi debugBreakpoint guifg=#80f2f6 guibg=NONE gui=reverse ctermfg=123 ctermbg=NONE cterm=reverse
  hi MatchParen guifg=#c5e7c5 guibg=#1e1f22 gui=reverse ctermfg=151 ctermbg=234 cterm=reverse
  hi Folded guifg=#949494 guibg=#3a3a3a ctermfg=246 ctermbg=237
  hi ColorColumn guifg=NONE guibg=#303030 ctermfg=NONE ctermbg=236
  hi SpellBad guifg=#ff0000 guibg=#ffffff gui=reverse ctermfg=196 ctermbg=231 cterm=reverse
  hi SpellCap guifg=#80f2f6 guibg=#1e1f22 gui=reverse ctermfg=123 ctermbg=234 cterm=reverse
  hi SpellLocal guifg=#a7ec21 guibg=#1e1f22 gui=reverse ctermfg=148 ctermbg=234 cterm=reverse
  hi SpellRare guifg=#d75fd7 guibg=#1e1f22 gui=reverse ctermfg=170 ctermbg=234 cterm=reverse
  hi Comment guifg=#626262 guibg=NONE gui=italic ctermfg=241 ctermbg=NONE cterm=italic
  hi SpecialComment guifg=#d7af87 guibg=NONE gui=italic ctermfg=180 ctermbg=NONE cterm=italic
  hi Constant guifg=#a7ec21 guibg=NONE gui=bold ctermfg=148 ctermbg=NONE cterm=bold
  hi String guifg=#80f2f6 guibg=NONE ctermfg=123 ctermbg=NONE
  hi cppRawString guifg=#80f2f6 guibg=NONE gui=italic ctermfg=123 ctermbg=NONE cterm=italic
  hi Character guifg=#e6e6fa guibg=NONE ctermfg=189 ctermbg=NONE
  hi Number guifg=#6897bb guibg=NONE ctermfg=67 ctermbg=NONE
  hi Float guifg=#6897bb guibg=NONE ctermfg=67 ctermbg=NONE
  hi cppUserLiteral guifg=#ffafff guibg=NONE gui=bold ctermfg=219 ctermbg=NONE cterm=bold
  hi Identifier guifg=#ed7f48 guibg=NONE ctermfg=209 ctermbg=NONE
  hi Function guifg=#ffbf26 guibg=NONE gui=bold ctermfg=214 ctermbg=NONE cterm=bold
  hi Statement guifg=#ff8700 guibg=NONE gui=bold ctermfg=208 ctermbg=NONE cterm=bold
  hi Type guifg=#1290c3 guibg=NONE gui=bold ctermfg=32 ctermbg=NONE cterm=bold
  hi StorageClass guifg=#1290c3 guibg=NONE gui=bold ctermfg=32 ctermbg=NONE cterm=bold
  hi Keyword guifg=#d75fd7 guibg=NONE gui=bold ctermfg=170 ctermbg=NONE cterm=bold
  hi PreProc guifg=#dd2867 guibg=NONE gui=bold ctermfg=161 ctermbg=NONE cterm=bold
  hi Include guifg=#dd2867 guibg=NONE gui=bold ctermfg=161 ctermbg=NONE cterm=bold
  hi Define guifg=#dd2867 guibg=NONE gui=bold ctermfg=161 ctermbg=NONE cterm=bold
  hi Macro guifg=#a7ec21 guibg=NONE gui=bold ctermfg=148 ctermbg=NONE cterm=bold
  hi Operator guifg=#ff0000 guibg=NONE gui=bold ctermfg=196 ctermbg=NONE cterm=bold
  hi Delimiter guifg=#a8a8a8 guibg=NONE ctermfg=248 ctermbg=NONE
  hi cppLambda guifg=#00ffff guibg=NONE gui=bold ctermfg=51 ctermbg=NONE cterm=bold
  hi cppTemplate guifg=#875fff guibg=NONE gui=bold ctermfg=99 ctermbg=NONE cterm=bold
  hi cppConcept guifg=#87d7ff guibg=NONE gui=bold ctermfg=117 ctermbg=NONE cterm=bold
  hi cppCoroutine guifg=#ff87ff guibg=NONE gui=bold ctermfg=213 ctermbg=NONE cterm=bold
  hi cppModule guifg=#afff5f guibg=NONE gui=bold ctermfg=155 ctermbg=NONE cterm=bold
  hi cppRanges guifg=#87ff87 guibg=NONE gui=bold ctermfg=119 ctermbg=NONE cterm=bold
  hi cppMember guifg=#ffbf26 guibg=NONE ctermfg=214 ctermbg=NONE
  hi cppStatic guifg=#8787ff guibg=NONE gui=bold ctermfg=105 ctermbg=NONE cterm=bold
  hi cppEnum guifg=#8ddaf8 guibg=NONE gui=bold ctermfg=117 ctermbg=NONE cterm=bold
  hi cppEnumValue guifg=#ffd7af guibg=NONE ctermfg=223 ctermbg=NONE
  hi cppNamespace guifg=#afffff guibg=NONE gui=bold ctermfg=159 ctermbg=NONE cterm=bold
  hi cppScope guifg=#5fafff guibg=NONE gui=bold ctermfg=81 ctermbg=NONE cterm=bold
  hi cppStdNamespace guifg=#00afff guibg=NONE gui=bold ctermfg=39 ctermbg=NONE cterm=bold
  hi cppAttribute guifg=#ffaf00 guibg=NONE gui=italic ctermfg=214 ctermbg=NONE cterm=italic
  hi cppNullptr guifg=#ff00ff guibg=NONE gui=bold ctermfg=201 ctermbg=NONE cterm=bold
  hi cppThis guifg=#d700ff guibg=NONE gui=bold ctermfg=165 ctermbg=NONE cterm=bold
  hi Boolean guifg=#66e1f8 guibg=NONE gui=bold ctermfg=81 ctermbg=NONE cterm=bold
  hi cppMemory guifg=#ff5f00 guibg=NONE gui=bold ctermfg=202 ctermbg=NONE cterm=bold
  hi Exception guifg=#ff5f5f guibg=NONE gui=bold ctermfg=203 ctermbg=NONE cterm=bold
  hi cppStructBinding guifg=#afffaf guibg=NONE gui=bold ctermfg=157 ctermbg=NONE cterm=bold
  hi cppFormat guifg=#afff87 guibg=NONE gui=italic ctermfg=156 ctermbg=NONE cterm=italic
  hi Underlined guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
  hi Title guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi Directory guifg=#00afff guibg=NONE gui=bold ctermfg=39 ctermbg=NONE cterm=bold
  hi Conceal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
  hi Ignore guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
  hi DiffAdd guifg=#afffaf guibg=#005f00 ctermfg=157 ctermbg=22
  hi DiffChange guifg=#d0d0d0 guibg=#5f005f ctermfg=252 ctermbg=53
  hi DiffText guifg=#afffff guibg=#5f0087 ctermfg=159 ctermbg=54
  hi DiffDelete guifg=#ffafaf guibg=#5f0000 ctermfg=217 ctermbg=52
  hi diffAdded guifg=#a7ec21 guibg=NONE ctermfg=148 ctermbg=NONE
  hi diffRemoved guifg=#ff0000 guibg=NONE ctermfg=196 ctermbg=NONE
  if has("gui_running")
    hi SpellBad gui=undercurl guisp=#ff0000
    hi SpellCap gui=undercurl guisp=#80f2f6
    hi SpellLocal gui=undercurl guisp=#a7ec21
    hi SpellRare gui=undercurl guisp=#d75fd7
  endif
endif

" 16-color variant
if &t_Co == 16
  hi Normal ctermfg=7 ctermbg=0
  hi CursorLine ctermfg=NONE ctermbg=0 cterm=underline
  hi CursorColumn ctermfg=0 ctermbg=11
  hi Folded ctermfg=7 ctermbg=0 cterm=bold
  hi ColorColumn ctermfg=0 ctermbg=3
endif

" 8-color variant
if &t_Co == 8
  hi Normal ctermfg=7 ctermbg=0
  hi StatusLine ctermfg=7 ctermbg=0 cterm=reverse,bold
  hi StatusLineNC ctermfg=0 ctermbg=7
  hi VertSplit ctermfg=7 ctermbg=7
  hi TabLine ctermfg=7 ctermbg=0 cterm=reverse
  hi TabLineFill ctermfg=NONE ctermbg=7
  hi TabLineSel ctermfg=7 ctermbg=0
  hi ToolbarButton ctermfg=7 ctermbg=0 cterm=reverse,bold
  hi QuickFixLine ctermfg=0 ctermbg=5
  hi CursorLineNr ctermfg=3 ctermbg=0 cterm=bold
  hi LineNr ctermfg=0 ctermbg=0
  hi NonText ctermfg=0 ctermbg=0
  hi FoldColumn ctermfg=0 ctermbg=0
  hi EndOfBuffer ctermfg=0 ctermbg=0
  hi SpecialKey ctermfg=0 ctermbg=0
  hi Pmenu ctermfg=7 ctermbg=0
  hi PmenuSel ctermfg=0 ctermbg=3
  hi PmenuThumb ctermfg=NONE ctermbg=2
  hi PmenuSbar ctermfg=NONE ctermbg=0
  hi SignColumn ctermfg=0 ctermbg=0
  hi Error ctermfg=7 ctermbg=1
  hi ErrorMsg ctermfg=7 ctermbg=1
  hi WarningMsg ctermfg=0 ctermbg=3
  hi ModeMsg ctermfg=7 ctermbg=0 cterm=bold
  hi MoreMsg ctermfg=2 ctermbg=0
  hi Question ctermfg=5 ctermbg=0
  hi Todo ctermfg=0 ctermbg=3 cterm=bold
  hi Visual ctermfg=0 ctermbg=4
  hi VisualNOS ctermfg=0 ctermbg=4
  hi CursorLine ctermfg=0 ctermbg=0 cterm=underline
  hi CursorColumn ctermfg=0 ctermbg=3
  hi Folded ctermfg=0 ctermbg=0 cterm=bold
  hi ColorColumn ctermfg=0 ctermbg=3
  hi SpellBad ctermfg=1 ctermbg=0 cterm=reverse
  hi SpellCap ctermfg=6 ctermbg=0 cterm=reverse
  hi SpellLocal ctermfg=2 ctermbg=0 cterm=reverse
  hi SpellRare ctermfg=5 ctermbg=0 cterm=reverse
  hi Comment ctermfg=0 ctermbg=0 cterm=bold
  hi Constant ctermfg=2 ctermbg=0
  hi String ctermfg=6 ctermbg=0
  hi Identifier ctermfg=7 ctermbg=0
  hi Statement ctermfg=3 ctermbg=0 cterm=bold
  hi Type ctermfg=4 ctermbg=0
  hi PreProc ctermfg=1 ctermbg=0
  hi Special ctermfg=6 ctermbg=0
  hi Underlined ctermfg=7 ctermbg=0 cterm=underline
  hi Title ctermfg=7 ctermbg=0 cterm=bold
  hi Directory ctermfg=4 ctermbg=0
  hi Conceal ctermfg=0 ctermbg=0
  hi Ignore ctermfg=0 ctermbg=0
  hi DiffAdd ctermfg=0 ctermbg=2
  hi DiffChange ctermfg=0 ctermbg=5
  hi DiffText ctermfg=7 ctermbg=0
  hi DiffDelete ctermfg=1 ctermbg=0
endif

" =============================================================================
" COLOR PALETTE - LIGHT BACKGROUND
" =============================================================================
if &background == "light"
  hi Color color00 #ffffff guifg=#ffffff guibg=#ffffff ctermfg=231 ctermbg=231 " Background
  hi Color color01 #af0000 guifg=#af0000 guibg=#af0000 ctermfg=124 ctermbg=124 " Dark Red
  hi Color color02 #008787 guifg=#008787 guibg=#008787 ctermfg=30  ctermbg=30  " Dark Cyan
  hi Color color03 #af5f00 guifg=#af5f00 guibg=#af5f00 ctermfg=130 ctermbg=130 " Dark Orange
  hi Color color04 #005faf guifg=#005faf guibg=#005faf ctermfg=25  ctermbg=25  " Dark Blue
  hi Color color05 #870087 guifg=#870087 guibg=#870087 ctermfg=90  ctermbg=90  " Dark Magenta
  hi Color color06 #5faf00 guifg=#5faf00 guibg=#5faf00 ctermfg=70  ctermbg=70  " Dark Green
  hi Color color07 #262626 guifg=#262626 guibg=#262626 ctermfg=235 ctermbg=235 " Foreground
  hi Color color08 #8a8a8a guifg=#8a8a8a guibg=#8a8a8a ctermfg=245 ctermbg=245 " Grey
  hi Color color09 #d75f00 guifg=#d75f00 guibg=#d75f00 ctermfg=166 ctermbg=166 " Darker Orange
  hi Color color10 #5f87af guifg=#5f87af guibg=#5f87af ctermfg=67  ctermbg=67  " Darker Blue
  hi Color color11 #d7af00 guifg=#d7af00 guibg=#d7af00 ctermfg=178 ctermbg=178 " Dark Yellow
  hi Color color12 #00afaf guifg=#00afaf guibg=#00afaf ctermfg=37  ctermbg=37  " Cyan
  hi Color color13 #5f00ff guifg=#5f00ff guibg=#5f00ff ctermfg=57  ctermbg=57  " Dark Purple
  hi Color color14 #5fd75f guifg=#5fd75f guibg=#5fd75f ctermfg=77  ctermbg=77  " Green
  hi Color color15 #000000 guifg=#000000 guibg=#000000 ctermfg=16  ctermbg=16  " Black
  hi Color color16 #ffaf00 guifg=#ffaf00 guibg=#ffaf00 ctermfg=214 ctermbg=214 " Bright Orange
  hi Color colorLine #e4e4e4 guifg=#e4e4e4 guibg=#e4e4e4 ctermfg=254 ctermbg=254 " CursorLine
  hi Color colorB #d0d0d0 guifg=#d0d0d0 guibg=#d0d0d0 ctermfg=252 ctermbg=252 " Visual
  hi Color colorNonT #b2b2b2 guifg=#b2b2b2 guibg=#b2b2b2 ctermfg=249 ctermbg=249 " LineNr
  hi Color colorTab #d0d0d0 guifg=#d0d0d0 guibg=#d0d0d0 ctermfg=252 ctermbg=252 " StatusLineNC
  hi Color colorC #262626 guifg=#262626 guibg=#262626 ctermfg=235 ctermbg=235 " Cursor
  hi Color colorlC #ff00ff guifg=#ff00ff guibg=#ff00ff ctermfg=201 ctermbg=201 " lCursor
  hi Color colorMP #c5e7c5 guifg=#c5e7c5 guibg=#c5e7c5 ctermfg=151 ctermbg=151 " MatchParen
  hi Color colorDim #626262 guifg=#626262 guibg=#626262 ctermfg=241 ctermbg=241 " PmenuThumb

  " Diff colors for light background
  hi Color diffAdd #d7ffd7 guifg=#d7ffd7 guibg=#d7ffd7 ctermfg=194 ctermbg=194
  hi Color diffAddFg #005f00 guifg=#005f00 guibg=#005f00 ctermfg=22  ctermbg=22
  hi Color diffDelete #ffd7d7 guifg=#ffd7d7 guibg=#ffd7d7 ctermfg=224 ctermbg=224
  hi Color diffDeleteFg #af0000 guifg=#af0000 guibg=#af0000 ctermfg=124 ctermbg=124
  hi Color diffChange #d7d7ff guifg=#d7d7ff guibg=#d7d7ff ctermfg=189 ctermbg=189
  hi Color diffChangeFg #262626 guifg=#262626 guibg=#262626 ctermfg=235 ctermbg=235
  hi Color diffText #d7afff guifg=#d7afff guibg=#d7afff ctermfg=183 ctermbg=183
  hi Color diffTextFg #5f00af guifg=#5f00af guibg=#5f00af ctermfg=55  ctermbg=55

  " Highlight groups for light background
  hi Normal guifg=#262626 guibg=#ffffff ctermfg=235 ctermbg=231
  hi Cursor guifg=#ffffff guibg=#262626 gui=reverse ctermfg=231 ctermbg=235 cterm=reverse
  hi lCursor guifg=#ff00ff guibg=#ffffff gui=reverse ctermfg=201 ctermbg=231 cterm=reverse
  hi CursorLine guifg=NONE guibg=#e4e4e4 ctermfg=NONE ctermbg=254
  hi CursorLineNr guifg=#d7af00 guibg=NONE gui=bold ctermfg=178 ctermbg=NONE cterm=bold
  hi Visual guifg=NONE guibg=#d0d0d0 ctermfg=NONE ctermbg=252
  hi VisualNOS guifg=NONE guibg=#5f87af ctermfg=NONE ctermbg=67
  hi Search guifg=#ffffff guibg=#d7af00 ctermfg=231 ctermbg=178
  hi IncSearch guifg=#ffffff guibg=#ffaf00 ctermfg=231 ctermbg=214
  hi LineNr guifg=#b2b2b2 guibg=NONE ctermfg=249 ctermbg=NONE
  hi NonText guifg=#b2b2b2 guibg=NONE ctermfg=249 ctermbg=NONE
  hi FoldColumn guifg=#8a8a8a guibg=#d0d0d0 ctermfg=245 ctermbg=252
  hi EndOfBuffer guifg=#b2b2b2 guibg=NONE ctermfg=249 ctermbg=NONE
  hi SpecialKey guifg=#b2b2b2 guibg=NONE ctermfg=249 ctermbg=NONE
  hi StatusLine guifg=#ffffff guibg=#626262 gui=reverse ctermfg=231 ctermbg=241 cterm=reverse
  hi StatusLineNC guifg=#262626 guibg=#d0d0d0 gui=reverse ctermfg=235 ctermbg=252 cterm=reverse
  hi VertSplit guifg=#d0d0d0 guibg=#d0d0d0 ctermfg=252 ctermbg=252
  hi TabLine guifg=#262626 guibg=#d0d0d0 ctermfg=235 ctermbg=252
  hi TabLineFill guifg=NONE guibg=#8a8a8a ctermfg=NONE ctermbg=245
  hi TabLineSel guifg=#000000 guibg=#ffffff ctermfg=16 ctermbg=231
  hi ToolbarLine guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
  hi ToolbarButton guifg=#ffffff guibg=#262626 ctermfg=231 ctermbg=235
  hi Pmenu guifg=#262626 guibg=#d0d0d0 ctermfg=235 ctermbg=252
  hi PmenuSel guifg=#ffffff guibg=#5f87af ctermfg=231 ctermbg=67
  hi PmenuSbar guifg=NONE guibg=#b2b2b2 ctermfg=NONE ctermbg=249
  hi PmenuThumb guifg=NONE guibg=#626262 ctermfg=NONE ctermbg=241
  hi SignColumn guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE
  hi Error guifg=#ffffff guibg=#af0000 ctermfg=231 ctermbg=124
  hi ErrorMsg guifg=#ffffff guibg=#af0000 ctermfg=231 ctermbg=124
  hi WarningMsg guifg=#ffffff guibg=#d7af00 ctermfg=231 ctermbg=178
  hi ModeMsg guifg=NONE guibg=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  hi MoreMsg guifg=#5faf00 guibg=NONE ctermfg=70 ctermbg=NONE
  hi Question guifg=#870087 guibg=NONE ctermfg=90 ctermbg=NONE
  hi Todo guifg=#ffffff guibg=#d7af00 gui=bold ctermfg=231 ctermbg=178 cterm=bold
  hi debugPC guifg=#005faf guibg=NONE gui=reverse ctermfg=25 ctermbg=NONE cterm=reverse
  hi debugBreakpoint guifg=#008787 guibg=NONE gui=reverse ctermfg=30 ctermbg=NONE cterm=reverse
  hi MatchParen guifg=#c5e7c5 guibg=#ffffff gui=reverse ctermfg=151 ctermbg=231 cterm=reverse
  hi Folded guifg=#8a8a8a guibg=#d0d0d0 ctermfg=245 ctermbg=252
  hi ColorColumn guifg=NONE guibg=#e4e4e4 ctermfg=NONE ctermbg=254
  hi SpellBad guifg=#af0000 guibg=#ffffff gui=reverse ctermfg=124 ctermbg=231 cterm=reverse
  hi SpellCap guifg=#008787 guibg=#ffffff gui=reverse ctermfg=30 ctermbg=231 cterm=reverse
  hi SpellLocal guifg=#5faf00 guibg=#ffffff gui=reverse ctermfg=70 ctermbg=231 cterm=reverse
  hi SpellRare guifg=#870087 guibg=#ffffff gui=reverse ctermfg=90 ctermbg=231 cterm=reverse
  hi Comment guifg=#8a8a8a guibg=NONE gui=italic ctermfg=245 ctermbg=NONE cterm=italic
  hi SpecialComment guifg=#af5f00 guibg=NONE gui=italic ctermfg=130 ctermbg=NONE cterm=italic
  hi Constant guifg=#5faf00 guibg=NONE gui=bold ctermfg=70 ctermbg=NONE cterm=bold
  hi String guifg=#008787 guibg=NONE ctermfg=30 ctermbg=NONE
  hi cppRawString guifg=#008787 guibg=NONE gui=italic ctermfg=30 ctermbg=NONE cterm=italic
  hi Character guifg=#5f5f5f guibg=NONE ctermfg=59 ctermbg=NONE
  hi Number guifg=#5f87af guibg=NONE ctermfg=67 ctermbg=NONE
  hi Float guifg=#5f87af guibg=NONE ctermfg=67 ctermbg=NONE
  hi cppUserLiteral guifg=#d7afaf guibg=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
  hi Identifier guifg=#d75f00 guibg=NONE ctermfg=166 ctermbg=NONE
  hi Function guifg=#ffaf00 guibg=NONE gui=bold ctermfg=214 ctermbg=NONE cterm=bold
  hi Statement guifg=#af5f00 guibg=NONE gui=bold ctermfg=130 ctermbg=NONE cterm=bold
  hi Type guifg=#005faf guibg=NONE gui=bold ctermfg=25 ctermbg=NONE cterm=bold
  hi StorageClass guifg=#005faf guibg=NONE gui=bold ctermfg=25 ctermbg=NONE cterm=bold
  hi Keyword guifg=#870087 guibg=NONE gui=bold ctermfg=90 ctermbg=NONE cterm=bold
  hi PreProc guifg=#af0000 guibg=NONE gui=bold ctermfg=124 ctermbg=NONE cterm=bold
  hi Include guifg=#af0000 guibg=NONE gui=bold ctermfg=124 ctermbg=NONE cterm=bold
  hi Define guifg=#af0000 guibg=NONE gui=bold ctermfg=124 ctermbg=NONE cterm=bold
  hi Macro guifg=#5faf00 guibg=NONE gui=bold ctermfg=70 ctermbg=NONE cterm=bold
  hi Operator guifg=#af0000 guibg=NONE gui=bold ctermfg=124 ctermbg=NONE cterm=bold
  hi Delimiter guifg=#626262 guibg=NONE ctermfg=241 ctermbg=NONE
  hi cppLambda guifg=#00afaf guibg=NONE gui=bold ctermfg=37 ctermbg=NONE cterm=bold
  hi cppTemplate guifg=#5f00ff guibg=NONE gui=bold ctermfg=57 ctermbg=NONE cterm=bold
  hi cppConcept guifg=#5fafff guibg=NONE gui=bold ctermfg=81 ctermbg=NONE cterm=bold
  hi cppCoroutine guifg=#d7afaf guibg=NONE gui=bold ctermfg=181 ctermbg=NONE cterm=bold
  hi cppModule guifg=#5fd75f guibg=NONE gui=bold ctermfg=77 ctermbg=NONE cterm=bold
  hi cppRanges guifg=#87af87 guibg=NONE gui=bold ctermfg=108 ctermbg=NONE cterm=bold
  hi cppMember guifg=#ffaf00 guibg=NONE ctermfg=214 ctermbg=NONE
  hi cppStatic guifg=#5f5fff guibg=NONE gui=bold ctermfg=63 ctermbg=NONE cterm=bold
  hi cppEnum guifg=#5fafff guibg=NONE gui=bold ctermfg=81 ctermbg=NONE cterm=bold
  hi cppEnumValue guifg=#d7af5f guibg=NONE ctermfg=179 ctermbg=NONE
  hi cppNamespace guifg=#5fd7ff guibg=NONE gui=bold ctermfg=117 ctermbg=NONE cterm=bold
  hi cppScope guifg=#5f87d7 guibg=NONE gui=bold ctermfg=68 ctermbg=NONE cterm=bold
  hi cppStdNamespace guifg=#0087d7 guibg=NONE gui=bold ctermfg=32 ctermbg=NONE cterm=bold
  hi cppAttribute guifg=#d7af00 guibg=NONE gui=italic ctermfg=178 ctermbg=NONE
