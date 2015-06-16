if exists("current_compiler")
  finish
endif

let current_compiler = "nim"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=nim\ c\ --listFullPaths\ --hint\\[Path\\]:off\ $*

CompilerSet errorformat=
  \%-GHint:\ %m,
  \%E%f(%l\\,\ %c)\ Error:\ %m,
  \%I%f(%l\\,\ %c)\ Hint:\ %m,
  \%W%f(%l\\,\ %c)\ Warning:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save

