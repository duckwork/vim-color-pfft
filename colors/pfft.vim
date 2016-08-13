" Name: pfft.vim
" Version: whatev
" Maintainer: github.com/duckwork
" License: WTFPL
"
" Pfft. Whatev.

hi clear
if exists('syntax on')
    syntax reset
endif

let g:colors_name='pfft'

" Set your goddamn terminal colors to these if you want vim to look good in a
" terminal.
let s:foreground = { "gui": "#dddddd", "cterm": "NONE" }
let s:background = { "gui": "#222222", "cterm": "NONE" }
let s:color0     = { "gui": "#444444", "cterm": "0" }
let s:color1     = { "gui": "#dd4444", "cterm": "1" }
let s:color2     = { "gui": "#44dd44", "cterm": "2" }
let s:color3     = { "gui": "#dddd44", "cterm": "3" }
let s:color4     = { "gui": "#4444dd", "cterm": "4" }
let s:color5     = { "gui": "#dd44dd", "cterm": "5" }
let s:color6     = { "gui": "#44dddd", "cterm": "6" }
let s:color7     = { "gui": "#777777", "cterm": "7" }
let s:color8     = { "gui": "#888888", "cterm": "8" }
let s:color9     = { "gui": "#ee2222", "cterm": "9" }
let s:color10    = { "gui": "#22ee22", "cterm": "10" }
let s:color11    = { "gui": "#eeee22", "cterm": "11" }
let s:color12    = { "gui": "#2222ee", "cterm": "12" }
let s:color13    = { "gui": "#ee22ee", "cterm": "13" }
let s:color14    = { "gui": "#22eeee", "cterm": "14" }
let s:color15    = { "gui": "#eeeeee", "cterm": "15" }

" TODO: add 'subtle' and 'subtler' instead of 'sh' for moar better light theme
if &background == "dark"
    let s:fg         = s:foreground
    let s:bg         = s:background
    let s:sh         = s:color8
    let s:black      = {'bg': s:color0, 'fg': s:color8 }
    let s:red        = {'bg': s:color1, 'fg': s:color9 }
    let s:green      = {'bg': s:color2, 'fg': s:color10}
    let s:yellow     = {'bg': s:color3, 'fg': s:color11}
    let s:blue       = {'bg': s:color4, 'fg': s:color12}
    let s:magenta    = {'bg': s:color5, 'fg': s:color13}
    let s:cyan       = {'bg': s:color6, 'fg': s:color14}
    let s:white      = {'bg': s:color7, 'fg': s:color15}
    let s:blacker    = {'fg': s:color8 , 'bg': s:color0}
    let s:redder     = {'fg': s:color9 , 'bg': s:color1}
    let s:greener    = {'fg': s:color10, 'bg': s:color2}
    let s:yellower   = {'fg': s:color11, 'bg': s:color3}
    let s:bluer      = {'fg': s:color12, 'bg': s:color4}
    let s:magenter   = {'fg': s:color13, 'bg': s:color5}
    let s:cyaner     = {'fg': s:color14, 'bg': s:color6}
    let s:whiter     = {'fg': s:color15, 'bg': s:color7}
else
    let s:fg         = s:background
    let s:bg         = s:foreground
    let s:sh         = s:color7
    let s:black      = {'fg': s:color8 , 'bg': s:color0}
    let s:red        = {'fg': s:color9 , 'bg': s:color1}
    let s:green      = {'fg': s:color10, 'bg': s:color2}
    let s:yellow     = {'fg': s:color11, 'bg': s:color3}
    let s:blue       = {'fg': s:color12, 'bg': s:color4}
    let s:magenta    = {'fg': s:color13, 'bg': s:color5}
    let s:cyan       = {'fg': s:color14, 'bg': s:color6}
    let s:white      = {'fg': s:color15, 'bg': s:color7}
    let s:blacker    = {'bg': s:color0, 'fg': s:color8 }
    let s:redder     = {'bg': s:color1, 'fg': s:color9 }
    let s:greener    = {'bg': s:color2, 'fg': s:color10}
    let s:yellower   = {'bg': s:color3, 'fg': s:color11}
    let s:bluer      = {'bg': s:color4, 'fg': s:color12}
    let s:magenter   = {'bg': s:color5, 'fg': s:color13}
    let s:cyaner     = {'bg': s:color6, 'fg': s:color14}
    let s:whiter     = {'bg': s:color7, 'fg': s:color15}
endif

function! s:h(group, style)
    if type(a:style) == 1 " string, meaning hi! link
        execute "hi! link" a:group a:style
    else
        execute "highlight" a:group
          \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
          \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
          \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
          \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
          \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
          \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
          \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
    endif
endfunction

" Kludgy functions for linux terminal, etc.
let s:visualcolor = s:{get(g:, 'pfft_visualcolor', 'black')}.bg
let s:linenrcolor = s:{get(g:, 'pfft_linenrcolor', 'black')}.bg

" Builtin
call s:h("ColorColumn",   {'bg': s:sh})
call s:h("Conceal",       {})
call s:h("Cursor",        {'bg': s:sh})
call s:h("CursorIM",      "Cursor")
call s:h("CursorColumn",  {'bg': s:black.bg})
call s:h("CursorLine",    "Normal")
call s:h("Directory",     {'gui': 'bold', 'cterm': 'bold'})
call s:h("DiffAdd",       {'fg': s:green.fg})
call s:h("DiffChange",    {'bg': s:white.bg})
call s:h("DiffDelete",    {'fg': s:red.fg})
call s:h("DiffText",      {'fg': s:yellow.fg})
call s:h("EndOfBuffer",   'NonText')
call s:h("TermCursor",    'Cursor')
call s:h("TermCursorNC",  'Cursor')
call s:h("ErrorMsg",      {'fg': s:white.fg, 'bg': s:red.bg})
call s:h("VertSplit",     {'fg': s:black.fg})
call s:h("Folded",        {'bg': s:sh, 'fg': s:black.fg})
call s:h("FoldColumn",    {'bg': s:black.bg})
call s:h("SignColumn",    'FoldColumn')
call s:h("IncSearch",     {'fg': s:black.bg, 'bg': s:yellow.bg})
call s:h("LineNr",        {'fg': s:linenrcolor})
call s:h("CursorLineNr",  {'fg': s:magenta.bg})
call s:h("MatchParen",    {'bg': s:black.bg, 'gui': 'bold', 'cterm': 'bold'})
call s:h("ModeMsg",       'CursorLineNr')
call s:h("MoreMsg",       'ModeMsg')
call s:h("NonText",       {'fg': s:black.bg})
call s:h("Normal",        {'fg': s:fg, 'bg': s:bg})
call s:h("Pmenu",         {'fg': s:white.fg, 'bg': s:black.bg})
call s:h("PmenuSel",      {'bg': s:blue.bg})
call s:h("PmenuSbar",     {'bg': s:sh})
call s:h("PmenuThumb",    {'bg': s:white.fg})
call s:h("Question",      {'fg': s:blue.fg})
call s:h("Search",        {'bg': s:black.bg, 'fg': s:yellow.bg})
call s:h("SpecialKey",    'NonText')
call s:h("SpellBad",      {'bg': s:black.bg, 'gui': 'underline'})
call s:h("SpellCap",      {'bg': s:black.bg, 'gui': 'underline'})
call s:h("SpellLocal",    {'bg': s:black.bg, 'gui': 'underline'})
call s:h("SpellRare",     {'bg': s:black.bg, 'gui': 'underline'})
call s:h("StatusLine",    {'bg': s:white.bg, 'fg': s:blacker.bg})
call s:h("StatusLineNC",  {'bg': s:black.bg, 'fg': s:background})
call s:h("TabLine",       {'bg': s:sh})
call s:h("TabLineFill",   'StatusLineNC')
call s:h("TabLineSel",    'StatusLine')
call s:h("Title",         {'fg': s:blue.fg, 'gui': 'bold', 'cterm': 'bold'})
call s:h("Visual",        {'bg': s:visualcolor})
call s:h("VisualNOS",     {})
call s:h("WarningMsg",    {'fg': s:black.bg, 'bg': s:yellow.bg})
call s:h("WildMenu",      {'bg': s:blue.bg})

" Syntax
call s:h("Comment",        {'fg': s:sh, 'gui': 'italic'})

call s:h("Constant",       'Normal')
call s:h("String",         'Constant')
call s:h("Character",      'Constant')
call s:h("Number",         'Constant')
call s:h("Boolean",        'Constant')
call s:h("Float",          'Constant')

call s:h("Identifier",     'Normal')
call s:h("Function",       'Identifier')

call s:h("Statement",      {'gui': 'bold', 'cterm': 'bold'})
call s:h("Conditional",    'Statement')
call s:h("Repeat",         'Statement')
call s:h("Label",          'Statement')
call s:h("Operator",       'Statement')
call s:h("Keyword",        'Statement')
call s:h("Exception",      'Statement')

call s:h("PreProc",        'Normal')
call s:h("Include",        'PreProc')
call s:h("Define",         'PreProc')
call s:h("Macro",          'PreProc')
call s:h("PreCondit",      'PreProc')

call s:h("Type",           'Normal')
call s:h("StorageClass",   'Type')
call s:h("Structure",      'Type')
call s:h("Typedef",        'Type')

call s:h("Special",        'Normal')
call s:h("SpecialChar",    'Special')
call s:h("Tag",            'Special')
call s:h("Delimiter",      'Special')
call s:h("SpecialComment", 'Special')
call s:h("Debug",          'Special')

call s:h("Underlined",     {'gui': 'underline', 'fg': s:blue.fg})
call s:h("Error",          {'gui': 'underline', 'fg': s:red.fg})
call s:h("Todo",           {'gui': 'underline', 'fg': s:yellow.fg, 'bg': s:sh})
