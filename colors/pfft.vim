" Name: pfft.vim
" Version: ugh
" Maintainer: github.com/duckwork
" License: WTFPL

hi clear
if exists('syntax on')
    syntax reset
endif

let g:colors_name='pfft'

let s:foreground =  { 'gui': '#f0f0f0', 'cterm': 'NONE' }
let s:background =  { 'gui': '#111111', 'cterm': 'NONE' }
let s:color0     =  { 'gui': '#222222', 'cterm': '0' }
let s:color1     =  { 'gui': '#a81111', 'cterm': '1' }
let s:color2     =  { 'gui': '#11a811', 'cterm': '2' }
let s:color3     =  { 'gui': '#a8a811', 'cterm': '3' }
let s:color4     =  { 'gui': '#1111a8', 'cterm': '4' }
let s:color5     =  { 'gui': '#a811a8', 'cterm': '5' }
let s:color6     =  { 'gui': '#11a8a8', 'cterm': '6' }
let s:color7     =  { 'gui': '#878787', 'cterm': '7' }
let s:color8     =  { 'gui': '#787878', 'cterm': '8' }
let s:color9     =  { 'gui': '#f01111', 'cterm': '9' }
let s:color10    =  { 'gui': '#11f011', 'cterm': '10' }
let s:color11    =  { 'gui': '#f0f011', 'cterm': '11' }
let s:color12    =  { 'gui': '#1111f0', 'cterm': '12' }
let s:color13    =  { 'gui': '#f011f0', 'cterm': '13' }
let s:color14    =  { 'gui': '#11f0f0', 'cterm': '14' }
let s:color15    =  { 'gui': '#eeeeee', 'cterm': '15' }

if ( &background == 'dark' )
    let s:fg   = s:foreground
    let s:bg   = s:background
    let s:warn = s:color5
    let s:attn = s:color3
    let s:info = s:color6
    if &termguicolors " NVIM
        let s:subtle = s:color8
        let s:extra  = { 'gui': '#ffeecc', 'cterm': '15' }
    else
        let s:subtle = s:color4
        let s:extra  = s:fg
    endif
else
    let s:fg   = s:background
    let s:bg   = s:foreground
    let s:warn = s:color1
    let s:attn = s:color2
    let s:info = s:color4
    if &termguicolors " NVIM
        let s:subtle = s:color7
        let s:extra  = { 'gui': '#112244', 'cterm': '0' }
    else
        let s:subtle = s:color6
        let s:extra  = s:fg
    endif
endif

let fg='fg'
let bg='bg'
let sp='sp'
let attr='attr'

function! s:h(group, style)
    if type(a:style) == 1 " string
        execute 'hi! link' a:group a:style
    else
        execute 'highlight' a:group
        \ "guifg="   (has_key(a:style, "fg")   ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")   ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")   ? a:style.sp.gui   : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")   ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")   ? a:style.bg.cterm : "NONE")
        \ "gui="     (has_key(a:style, "attr") ? a:style.attr     : "NONE")
        \ "cterm="   (has_key(a:style, "attr") ? a:style.attr     : "NONE")
    endif
endfunction

" Built-in
call s:h('Normal',        {fg: s:fg, bg: s:bg})

call s:h('ColorColumn',   {})
call s:h('Conceal',       {})
call s:h('Cursor',        {})
call s:h('CursorIM',      'Cursor')
call s:h('CursorColumn',  {})
call s:h('CursorLine',    'Normal')
call s:h('Directory',     {fg: s:attn})
call s:h('DiffAdd',       {fg: s:attn})
call s:h('DiffChange',    {fg: s:info})
call s:h('DiffDelete',    {fg: s:warn})
call s:h('DiffText',      {fg: s:info, attr: 'bold'})
call s:h('EndOfBuffer',   'NonText')
call s:h('TermCursor',    'Cursor')
call s:h('TermCursorNC',  'Cursor')
call s:h('ErrorMsg',      {fg: s:warn, attr: 'inverse'})
call s:h('VertSplit',     {fg: s:info})
call s:h('Folded',        {fg: s:info})
call s:h('FoldColumn',    {})
call s:h('SignColumn',    'FoldColumn')
call s:h('IncSearch',     {fg: s:attn, attr: 'inverse,bold,underline'})
call s:h('LineNr',        {fg: s:info})
call s:h('CursorLineNr',  {fg: s:attn, attr: 'bold'})
call s:h('MatchParen',    {fg: s:warn, attr: 'bold'})
call s:h('ModeMsg',       'CursorLineNr')
call s:h('MoreMsg',       'ModeMsg')
call s:h('NonText',       {fg: s:subtle})
call s:h('Pmenu',         {fg: s:color7, bg: s:warn, attr: 'bold'})
call s:h('PmenuSel',      {})
call s:h('PmenuSbar',     {})
call s:h('PmenuThumb',    {})
call s:h('Question',      {fg: s:color7, bg: s:info, attr: 'bold'})
call s:h('Search',        {fg: s:attn, attr: 'bold,inverse'})
call s:h('SpecialKey',    'NonText')
call s:h('SpellBad',      {fg: s:warn, attr: 'bold'})
call s:h('SpellCap',      'SpellBad')
call s:h('SpellLocal',    'SpellBad')
call s:h('SpellRare',     'SpellBad')
call s:h('StatusLine',    {fg: s:attn, attr: 'inverse,bold'})
call s:h('StatusLineNC',  {fg: s:color8, attr: 'inverse'})
call s:h('TabLine',       'StatusLineNC')
call s:h('TabLineFill',   'StatusLineNC')
call s:h('TabLineSel',    'StatusLine')
call s:h('Title',         {fg: s:info, attr: 'bold'})
call s:h('Visual',        {fg: s:info, attr: 'inverse'})
call s:h('VisualNOS',     {})
call s:h('WarningMsg',    {})
call s:h('WildMenu',      {bg: s:warn, attr: 'inverse'})

" Syntax
call s:h('Comment',        {fg: s:subtle, attr: 'italic'})

call s:h('Constant',       {fg: s:extra})
call s:h('String',         'Constant')
call s:h('Character',      'Constant')
call s:h('Number',         'Constant')
call s:h('Boolean',        'Constant')
call s:h('Float',          'Constant')

call s:h('Identifier',     'Normal')
call s:h('Function',       'Identifier')

call s:h('Statement',      {attr: 'bold'})
call s:h('Conditional',    {fg: s:attn})
call s:h('Repeat',         'Conditional')
call s:h('Label',          'Statement')
call s:h('Operator',       'Conditional')
call s:h('Keyword',        'Statement')
call s:h('Exception',      'Statement')

call s:h('PreProc',        'Normal')
call s:h('Include',        'PreProc')
call s:h('Define',         'PreProc')
call s:h('Macro',          'PreProc')
call s:h('PreCondit',      'PreProc')

call s:h('Type',           'Normal')
call s:h('StorageClass',   'Type')
call s:h('Structure',      'Type')
call s:h('Typedef',        'Type')

call s:h('Special',        'Normal')
call s:h('SpecialChar',    'Special')
call s:h('Tag',            'Special')
call s:h('Delimiter',      'Special')
call s:h('SpecialComment', 'Special')
call s:h('Debug',          'Special')

call s:h('Underlined',     {attr: 'underline'})
call s:h('Error',          {fg: s:warn, attr: 'inverse,bold'})
call s:h('Todo',           {fg: s:info, attr: 'inverse'})

" Filetype-specific
call s:h('vimCommentTitle', {fg: s:subtle, attr: 'bold'})

call s:h('helpBacktick', {attr: 'italic'})

call s:h('pandocEmphasis', {attr: 'italic'})
call s:h('pandocStrong', {attr: 'bold'})

call s:h('ShLoop', {fg: s:attn})

call s:h('haskellPragma', 'Comment')
