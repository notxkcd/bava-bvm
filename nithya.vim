" C++ Eclipse CDT Matched Vim Colorscheme
" Based on colors extracted from Eclipse CDT dark theme

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "cpp_eclipse_cdt"

" =============================================================================
" BASIC COLORS
" =============================================================================
highlight Normal          guifg=#d0d0d0 guibg=#1e1f22
highlight Cursor          guifg=#262626 guibg=#d0d0d0
highlight CursorLine                    guibg=#303030
highlight Visual                        guibg=#444444
highlight Search         guifg=#262626 guibg=#ffff00
highlight LineNr         guifg=#444444

highlight CursorLineNr   guifg=#ffff00 gui=bold

" =============================================================================
" C++ KEYWORDS AND TYPES
" =============================================================================
highlight Statement       guifg=#ff8700 gui=bold
highlight Type            guifg=#1290c3 gui=bold
highlight StorageClass    guifg=#1290c3 gui=bold
highlight Keyword         guifg=#d75fd7 gui=bold

" =============================================================================
" C++20/23 FEATURES
" =============================================================================
highlight cppConcept      guifg=#87d7ff gui=bold
highlight cppCoroutine    guifg=#ff87ff gui=bold
highlight cppModule       guifg=#afff5f gui=bold
highlight cppRanges       guifg=#87ff87 gui=bold

" =============================================================================
" PREPROCESSOR
" =============================================================================
highlight PreProc         guifg=#dd2867 gui=bold
highlight Include         guifg=#dd2867 gui=bold
highlight Define          guifg=#dd2867 gui=bold
highlight Macro           guifg=#a7ec21 gui=bold

" =============================================================================
" STRINGS AND LITERALS
" =============================================================================
highlight String          guifg=#80f2f6
highlight cppRawString    guifg=#80f2f6 gui=italic
highlight Character       guifg=#e6e6fa
highlight Number          guifg=#6897bb
highlight Float           guifg=#6897bb
highlight cppUserLiteral  guifg=#ffafff gui=bold

" =============================================================================
" OPERATORS AND SYMBOLS
" =============================================================================
highlight Operator        guifg=#ff0000 gui=bold
highlight Delimiter       guifg=#a8a8a8
highlight cppLambda       guifg=#00ffff gui=bold
highlight cppTemplate     guifg=#875fff gui=bold

" =============================================================================
" FUNCTIONS AND IDENTIFIERS
" =============================================================================
highlight Function        guifg=#ffbf26 gui=bold
highlight Identifier      guifg=#ed7f48
highlight cppMember       guifg=#ffbf26
highlight cppStatic       guifg=#8787ff gui=bold

" =============================================================================
" CONSTANTS AND ENUMS
" =============================================================================
highlight Constant        guifg=#a7ec21 gui=bold
highlight cppEnum         guifg=#8ddaf8 gui=bold
highlight cppEnumValue    guifg=#ffd7af

" =============================================================================
" NAMESPACES AND SCOPE
" =============================================================================
highlight cppNamespace    guifg=#afffff gui=bold
highlight cppScope        guifg=#5fafff gui=bold
highlight cppStdNamespace guifg=#00afff gui=bold

" =============================================================================
" ATTRIBUTES AND ANNOTATIONS
" =============================================================================
highlight cppAttribute    guifg=#ffaf00 gui=italic

" =============================================================================
" COMMENTS
" =============================================================================
highlight Comment         guifg=#626262 gui=italic
highlight SpecialComment  guifg=#d7af87 gui=italic

" =============================================================================
" ERRORS AND WARNINGS
" =============================================================================
highlight Error           guifg=#ffffff guibg=#ff0000
highlight Warning         guifg=#262626 guibg=#ffff00
highlight Todo            guifg=#262626 guibg=#ffff00 gui=bold

" =============================================================================
" SPECIAL KEYWORDS
" =============================================================================
highlight cppNullptr      guifg=#ff00ff gui=bold
highlight cppThis         guifg=#d700ff gui=bold
highlight Boolean         guifg=#66e1f8 gui=bold
highlight cppMemory       guifg=#ff5f00 gui=bold
highlight Exception       guifg=#ff5f5f gui=bold

" =============================================================================
" STRUCTURED BINDINGS
" =============================================================================
highlight cppStructBinding guifg=#afffaf gui=bold

" =============================================================================
" FORMAT STRINGS
" =============================================================================
highlight cppFormat       guifg=#afff87 gui=italic

" =============================================================================
" UI ELEMENTS
" =============================================================================
highlight StatusLine      guifg=#d0d0d0 guibg=#444444
highlight StatusLineNC    guifg=#808080 guibg=#3a3a3a
highlight VertSplit       guifg=#3a3a3a
highlight Folded          guifg=#949494 guibg=#3a3a3a
highlight FoldColumn      guifg=#949494 guibg=#262626

" =============================================================================
" POPUP MENU
" =============================================================================
highlight Pmenu           guifg=#d0d0d0 guibg=#3a3a3a
highlight PmenuSel        guifg=#262626 guibg=#5fd7ff
highlight PmenuSbar       guibg=#4e4e4e
highlight PmenuThumb      guibg=#808080

" =============================================================================
" DIFF
" =============================================================================
highlight DiffAdd         guibg=#005f00
highlight DiffChange      guibg=#5f005f
highlight DiffDelete      guifg=#ff0000 guibg=#5f0000
highlight DiffText        guibg=#5f0087 gui=bold
