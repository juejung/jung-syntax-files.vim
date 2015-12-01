" Vim syntax file
" Language:    Pweave Files
" Remarks:     Based on the R noweb syntax file by Johannes Ranke included in
"              the Vim distribution.

" Version Clears: {{{1
" For version 5.x: Clear all syntax items
" For version 6.x and 7.x: Quit when a syntax file was already loaded
if version < 600 
  syntax clear
elseif exists("b:current_syntax")
  finish
endif 

syn case match

" Extension of Tex clusters {{{1
runtime syntax/rst.vim
unlet b:current_syntax

syn cluster rstTodo                         add=@pweave
syn cluster rstComment                      add=@pweave
syn cluster rstSections                     add=@pweave
syn cluster rstTransition                   add=@pweave
syn cluster rstLiteralBlock                 add=@pweave
syn cluster rstQuotedLiteralBlock           add=@pweave
syn cluster rstDoctestBlock                 add=@pweave
syn cluster rstTableLines                   add=@pweave
syn cluster rstSimpleTableLines             add=@pweave
syn cluster rstExplicitMarkup               add=@pweave
syn cluster rstDirective                    add=@pweave
syn cluster rstFootnote                     add=@pweave
syn cluster rstCitation                     add=@pweave
syn cluster rstHyperlinkTarget              add=@pweave
syn cluster rstExDirective                  add=@pweave
syn cluster rstSubstitutionDefinition       add=@pweave
syn cluster rstDelimiter                    add=@pweave
syn cluster rstEmphasis                     add=@pweave
syn cluster rstStrongEmphasis               add=@pweave
syn cluster rstInterpretedTextOrHyperlinkReference  add=@pweave
syn cluster rstInlineLiteral                add=@pweave
syn cluster rstSubstitutionReference        add=@pweave
syn cluster rstInlineInternalTargets        add=@pweave
syn cluster rstFootnoteReference            add=@pweave
syn cluster rstCitationReference            add=@pweave
syn cluster rstHyperLinkReference           add=@pweave
syn cluster rstStandaloneHyperlink          add=@pweave
syn cluster rstCodeBlock                    add=@pweave

" Highlighting of Python code using an existing python.vim syntax file if available {{{1
syn include @pweavePy syntax/python.vim
syn region pweaveChunk matchgroup=pweaveDelimiter start="^<<.*>>=" matchgroup=pweaveDelimiter end="^@" contains=@pweavePy,pweaveChunkReference,pweaveChunk fold keepend
syn match pweaveChunkReference "^<<.*>>$" contained
syn region pweaveInline matchgroup=Delimiter start="<%" matchgroup=Delimiter end="%>" contains=@pweavePy

" pweave Cluster {{{1
syn cluster pweave contains=pweaveChunk,pweaveChunkReference,pweaveDelimiter,pweaveInline,pweaveSweaveopts

" Highlighting {{{1
hi def link pweaveDelimiter	Delimiter
hi def link pweaveSweaveOpts Statement
hi def link pweaveChunkReference Delimiter

let   b:current_syntax = "pweave"
" vim: foldmethod=marker:
