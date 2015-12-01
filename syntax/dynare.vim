" Vim syntax file
" Language:	Dynare
" Maintainer:	Maurizio Tranchero - maurizio(.)tranchero(@)gmail(.)com
" Credits:	Preben 'Peppe' Guldberg <peppe-vim@wielders.org>
"		Original author: Mario Eusebio
" Last Change:	Wed Jan 13 11:12:34 CET 2010
" 		sinh added to dynare implicit commands
" Change History:
" 		- 'global' and 'persistent' keyword are now recognized

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword dynareStatement		return
syn keyword dynareLabel			case switch
syn keyword dynareConditional		else elseif end if otherwise
syn keyword dynareRepeat		do for while
" MT_ADDON - added exception-specific keywords
syn keyword dynareExceptions		try catch
syn keyword dynareOO			classdef properties events methods

syn keyword dynareTodo			contained  TODO
syn keyword dynareScope			global persistent

" If you do not want these operators lit, uncommment them and the "hi link" below
syn match dynareArithmeticOperator	"[-+]"
syn match dynareArithmeticOperator	"\.\=[*/\\^]"
syn match dynareRelationalOperator	"[=~]="
syn match dynareRelationalOperator	"[<>]=\="
syn match dynareLogicalOperator		"[&|~]"

syn match dynareLineContinuation	"\.\{3}"

"syn match dynareIdentifier		"\<\a\w*\>"

" String
" MT_ADDON - added 'skip' in order to deal with 'tic' escaping sequence 
syn region dynareString			start=+'+ end=+'+	oneline skip=+''+

" If you don't like tabs
syn match dynareTab			"\t"

" Standard numbers
syn match dynareNumber		"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
syn match dynareFloat		"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match dynareFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" Transpose character and delimiters: Either use just [...] or (...) aswell
syn match dynareDelimiter		"[][]"
"syn match dynareDelimiter		"[][()]"
syn match dynareTransposeOperator	"[])a-zA-Z0-9.]'"lc=1

syn match dynareSemicolon		";"

syn match dynareComment			"//.*$"	contains=dynareTodo,dynareTab
" MT_ADDON - correctly highlights words after '...' as comments
syn match dynareComment			"\.\.\..*$"	contains=dynareTodo,dynareTab

" comments - multiple line
"syn region stataComment      start="/\*"    end="\*/"  contains=stataComment
syn region dynareMultilineComment	start="/\*"    end="\*/" contains=dynareTodo,dynareTab

syn keyword dynareOperator		break zeros default margin round ones rand
syn keyword dynareOperator		ceil floor size clear zeros eye mean std cov

syn keyword dynareFunction		error eval function

syn keyword dynareImplicit		abs acos atan asin cos cosh exp log prod sum
syn keyword dynareImplicit		log10 max min sign sin sinh sqrt tan reshape

syn match dynareError	"-\=\<\d\+\.\d\+\.[^*/\\^]"
syn match dynareError	"-\=\<\d\+\.\d\+[eEdD][-+]\=\d\+\.\([^*/\\^]\)"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_dynare_syntax_inits")
  if version < 508
    let did_dynare_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink dynareTransposeOperator	dynareOperator
  HiLink dynareOperator			Operator
  HiLink dynareLineContinuation		Special
  HiLink dynareLabel			Label
  HiLink dynareConditional		Conditional
  HiLink dynareExceptions		Conditional
  HiLink dynareRepeat			Repeat
  HiLink dynareTodo			Todo
  HiLink dynareString			String
  HiLink dynareDelimiter		Identifier
  HiLink dynareTransposeOther		Identifier
  HiLink dynareNumber			Number
  HiLink dynareFloat			Float
  HiLink dynareFunction			Function
  HiLink dynareError			Error
  HiLink dynareImplicit			dynareStatement
  HiLink dynareStatement		Statement
  HiLink dynareOO			Statement
  HiLink dynareSemicolon		SpecialChar
  HiLink dynareComment			Comment
  HiLink dynareMultilineComment		Comment
  HiLink dynareScope			Type

  HiLink dynareArithmeticOperator	dynareOperator
  HiLink dynareRelationalOperator	dynareOperator
  HiLink dynareLogicalOperator		dynareOperator

"optional highlighting
  "HiLink dynareIdentifier		Identifier
  "HiLink dynareTab			Error

  delcommand HiLink
endif

let b:current_syntax = "dynare"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
