" Lyx simple LyX syntax file "{{{1
" Maintainer: jjung@towson.edu	
" Created:	Tue 16 Sep 2016 03:45:10 PM IST
" Last Changed:	
" Version:	0.1
"
" Description:
"   Highlight LyX documents without the ridiculous amount of complexity used
" Load control {{{1
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax case match

" Begin {{{1
syntax keyword lyxCommand  \\layout
syntax keyword lyxCommand  \\the_end
syntax keyword lyxKey LatexCommand ERT Graphics Float FloatList 
syntax keyword lyxKey status Open  Closed
syntax keyword lyxKey wide collapsed
syntax keyword lyxBinary true false
syntax keyword lyxBinary Open Close
syntax region lyxInset start=/\\begin_inset/ end=/\\end_inset/ contains=ALL fold
syntax region lyxString start=/"/ end=/"/ 

highlight link lyxCommand Keyword
highlight link lyxKey Keyword
highlight link lyxString String
highlight link lyxInset Comment
highlight link lyxBinary Boolean

" {{{1 Cleanup
let b:current_syntax = "lyx"

