if exists("b:current_syntax")
  finish
endif

syntax keyword yetiConditional if then else
syntax keyword yetiKeyword while when test function
syntax keyword yetiKeyword for in
syntax keyword yetiKeyword struct
syntax keyword yetiKeyword or and not is
syntax keyword yetiKeyword try catch
syntax keyword yetiKeyword assert
syntax keyword yetiKeyword defer
syntax keyword yetiKeyword return
syntax keyword yetiKeyword end
syntax keyword yetiKeyword fn

syntax match yetiNumber "\v<\d+>"
syntax match yetiNumber "\v<\d+\.\d+>"
syntax match yetiNumber "\v<\d*\.?\d+([Ee]-?)?\d+>"
syntax match yetiNumber "\v<0x\x+([Pp]-?)?\x+>"
syntax match yetiNumber "\v<0b[01]+>"
syntax match yetiNumber "\v<0o\o+>"

syntax region yetiString start=/"/ skip=/\\"/ end=/"/ oneline

syntax match yetiFuncName "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

syntax match yetiFuncCall "\w\(\w\)*("he=e-1,me=e-1

syntax keyword yetiType I64 I32 U64 U32 F64 F32 Type Void Fn

syntax match yetiOperator display "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"

syntax region yetiCommentLine start="#" end="$" contains=yetiTodo,@Spell
syntax keyword yetiTodo contained TODO FIXME XXX NB NOTE

highlight default link yetiConditional Conditional
highlight default link yetiKeyword     Keyword
highlight default link yetiNumber      Number
highlight default link yetiFuncName    Function
highlight default link yetiFuncCall    Function
highlight default link yetiOperator    Operator
highlight default link yetiType        Type
highlight default link yetiCommentLine Comment
highlight default link yetiTodo        Todo
highlight default link yetiString      String

