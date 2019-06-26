" lfrc vim syntax

"{{{ Initialization
if exists("b:current_syntax")
	finish
endif

let b:current_syntax = "lf"
"}}}

"{{{ Comment Matching
syn match    lfComment        '#.*$'
"}}}

"{{{ String Matching
syn match    lfString         "'.*'"
syn match    lfString         '".*"' contains=lfVar,lfSpecial
"}}}

"{{{ Match lf Variables
syn match    lfVar            '\$f\|\$fx\|\$fs\|\$id'
"}}}

"{{{ Keywords
syn keyword  lfKeyword        set cmd map skipwhite
"}}}

"{{{ Options Keywords
syn keyword  lfOptions        push up half-up up half-up page-up down half-down page-down updir open quit top bottom toggle invert unselect copy cut paste clear redraw reload read find find-back find-next find-prev search search-back search-next search-prev mark-save mark-load anchorfind color256 dircounts dirfirst drawbox globsearch hidden ignorecase ignoredia incsearch preview reverse smartcase smartdia wrapscan wrapscroll number relativenumber findlen period scrolloff tabstop errorfmt filesep ifs previewer promptfmt shell sortby timefmt ratios info shellopts
"}}}

"{{{ Highlighting for Different Command Types
syn match    lfShell          '\$.*$\|:.*$\|%.*$\|!.*$\|&.*$' contains=lfVar,lfSpecial,lfString
"}}}

"{{{ Special Matching
syn match    lfSpecial        '<.*>\|\\.'
"}}}

"{{{ Shell Script Matching for cmd
unlet b:current_syntax
syn include  @Shell           syntax/sh.vim
let b:current_syntax = "lf"
syn region   lfIgnore         start=".{{\n" end="^}}" contains=lfExternalShell
syn match    lfExternalShell  "^\s.*$" transparent contained contains=@Shell
"}}}

"{{{ Link Highlighting
hi def link  lfComment        Comment
hi def link  lfVar            Type
hi def link  lfSpecial        Special
hi def link  lfString         String
hi def link  lfKeyword        Statement
hi def link  lfOptions        Constant
hi def link  lfShell          PreProc
hi def link  lfConstant       Constant
hi def link  lfExternalShell  Normal
hi def link  lfIgnore         Normal
"}}}
