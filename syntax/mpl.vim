" Vim syntax file
" Language: Maconomy Print Language
" Add this to your vimrc "au bufreadpre,bufnewfile *.mpl set ft=mpl" 
" and put this file in ~/.vim/syntax/
" Author: Andrew Mcveigh <me@andrewmcveigh.com>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax keyword MplTagKeyword contained mpl layout page grid frontpage paper header
syntax keyword MplTagKeyword contained footer canvas conditional repeating island
syntax keyword MplTagKeyword contained stack span array row text text2 field var 
syntax keyword MplTagKeyword contained title line border newpage hline vline skip
syntax keyword MplTagKeyword contained image goto define redefine default ruler
syntax keyword MplTagKeyword contained subruler margins

syntax keyword Attribute contained ruler pos indent height width baseline 
syntax keyword Attribute contained top bottom style block variable script 
syntax keyword Attribute contained negate value tag name orientation data 
syntax keyword Attribute contained cursor zerosuppression onlastpage atend 
syntax keyword Attribute contained hor ver pagebottom onfirstpage atstart 
syntax keyword Attribute contained multi columns fieldname varname 
syntax keyword Attribute contained cursorname justification scalewidth 
syntax keyword Attribute contained scaleheight title titlejustification 
syntax keyword Attribute contained titlecolor titlergb rounded fontname 
syntax keyword Attribute contained fontsize stretch italic underline bold 
syntax keyword Attribute contained topmargin bottommargin leftmargin 
syntax keyword Attribute contained rightmargin print originallayout 
syntax keyword Attribute contained groupby align uppercase left right

syntax keyword MplCursor contained Invoice Inventory

syntax match ColumnDef contained "[0-9:]\+"
syntax match Measurement contained "[0-9]\+mm"
syntax match Delimiter contained ":"
syntax match SpecialChar contained "+"
syntax match RulerName contained ":\w\+\n"
syntax match Var contained "\.\?\w"

syntax region MplEndTag start="<end \w\+" end=">" contains=MplTagKeyword
syntax region MplTag start="<" end=">" contains=MplTagKeyword,Attribute,Measurement,RulerSpec,String,MplCursor
syntax region Block start="<\z(frontpage\|paper\|header\|footer\|canvas\|conditional\|repeating\|island\|stack\|span\|array\|row\).*>"ms=s,rs=s end="<end \z1>"me=e+1,re=e+1 contains=Comment,Array,Ruler,Block,MplTag,MplEndTag
syntax region String start=+"+ skip=+\\"+ end=+"+
syntax region Array start="{" end="}" contained contains=Var,Attribute,MplTag,MplEndTag,String,Array,Comment,Delimiter,SpecialChar,Measurement,Ruler
syntax region Ruler start="{:\w\+"ms=s+1,rs=s+1 end="}" contained contains=String,Rulername,Var,Attribute,Delimiter
syntax region RulerSpec start="\[" end="\]" contains=RulerSpec,Measurement,Attribute,ColumnDef,Delimiter,SpecialChar
syntax region Comment start="--" end="\n"

syntax match VersionDef "<mpl\s\+[0-9]>"

hi link MplTagKeyword Type
hi link MplEndTag Identifier
hi link MplTag Identifier
hi link Attribute Type
hi link Measurement Number
hi link ColumnDef Number
hi link RulerName Identifier
hi link Var Keyword
hi link MplCursor String
hi link VersionDef Underlined
