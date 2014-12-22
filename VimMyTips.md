                           | ENTERING INSERT MODE
 ------------------------- | ---------------------------------------------
 i , a , I , A             | InsertBefore, AppendAfter cursor (I=^i, A=$a)
 o , O                     | insert a new line after, before current line
 R , r{char}               | Replace instead of insert (r is for one char)
 c{motion} , ciw , C , cc  | Change ie delete then insert (C=c$, cc=0C)
 s                         | Substitute char on cursor (s is cl)

                           | MOTIONS
 ------------------------- | ---------------------------------------------
 h , j , k , l             | left, down, up, right
 0 , gm , $ , ^            | start, middle, end of line, first non blank
 w , b                     | start of word forward, backward
 e , ge                    | end   of word forward, backward
 f{char} , F{char}         | move For next,prev {char} (Repeat ;/,)
 /{ptrn} , ?{ptrn}         | Search for next, previous {ptrn} (Repeat n/N)
 gg , G , NG (or :N)       | First line of file, last line of file, line N
 ,,w   ,   ,,b             | Start of word forward, backward |EASYMOTION|
 %                         | Matching brace {}[]()
 ------------------------- | ---------------------------------------------
 CTRL-F  , CTRL-B          | one  page Forward, Backward
 CTRL-D  , CTRL-U          | half page Down, Up
 '.  ,  `.                 | jump to last modification line/position

                           | AUTOCOMPLETE & SNIPPETS
 ------------------------- | ---------------------------------------------
 CTRL-X CTRL-L             | line complete
 CTRL-N , CTRL-P           | complete word from file Next or Previous
 CTRL-X CTRL-U             | shows snippets popup
 CTRL-U <CR>               | navigate forward then expand selected snippet
 CTRL-K                    | jump into snippet

                           | SPLIT & RESIZE
 ------------------------- | ---------------------------------------------
  CTRL-W =                 | make all windows the same height & width
  CTRL-W _   , CTRL-W |    | Set window height,width to N (default max)
  CTRL-W H , J , K , L     | Move current window to far left,down,up,right
  CTRL-W h , j , k , l     | Focus to far left,down,up,right window

                           | BUFFERS (better with |BUFFERLINE|)
 ------------------------- | ---------------------------------------------
 :e. , :Vex , Sex(plore)   | file explorer in new window, in split window
 :e myFile                 | open myFile in a new buffer
 :ls                       | list buffers (shorter than  :buffers)
 :bw                       | close current buffer
 :sb x , vsp | bx          | move x buffer un a (v)splited window
 :sball                    | split all buffers
 :bn , :bp                 | next, previous buffer (maped to F2 F3)

                           | VISUAL MODE ie TEXT BLOCKS
 ------------------------- | ---------------------------------------------
 v , CTRL-V  , V           | visual mode perChar/ linewise / blockwise
 gv                        | visual mode with same area as previous
 :%s/\%Vold/new/g          | do a substitute on last visual area

                           | INSERT ON MANY LINES
 ------------------------- | ---------------------------------------------
 CTRL-V  jjj $ A foo Esc   | insert at end of each line of visual block
 CTRL-V  jjj I foo Esc     | insert in the column of visual block

                           | INDENT, AUTOINDENT, FORMAT
 ------------------------- | ---------------------------------------------
 >> , <<                   | shift right, shift left
 gg=G                      | eventually: set filetype=js + set smartindent
 == , =                    | autoIndent current line, current block
 :Tabularize /x            | aligns statements on char x |TABULARIZE|
 Vu , VU , V~              | lowercase, uppercase, toggle line
 gggug                     | lowercase entire file
 gq{motion}                | format the lines that {motion} moves over
[range]J , gJ              | Join [range] lines. Insert/remove space

                           | REGISTERS
 ------------------------- | ---------------------------------------------
 "{a-zA-Z0-9}              | use registr {a-zA-Z0-9} for next delete, yank
                           | or put (use uppercase char to append with)
 "5yy , "hyy               | yank line into register 5 (or h)
 :reg                      | list registers
 "5p  , "hp , i CTRL-R h   | put register 5 (or h) content after cursor
 "_dd                      | delete to BlackHole don't affect any register

                           | FOLDING COMMANDS
 ------------------------- | ---------------------------------------------
 zR , zM                   | open/close ALL folds (zr, zm not recursive)
 zA                        | toggle state of fold (za is not recursive)
 zf{motion} , {visual}zf   | creates a fold (e.g zf% fold matching pair)
 zj , zk                   | move to the next, previous fold
 [z , ]z                   | move to start/ end of open fold

                           | RECORDING
 ------------------------- | ---------------------------------------------
 q{0-9a-zA-Z"}             | record into reg {0-9a-zA-Z"} (A-Z to append)
 q                         | stop recording
 [cnt]@{0-9a-zA-Z"}        | exec. content of reg {0-9a-z".=*+} [cnt]times
 @@                        | repeat the previous @{0-9a-z":*} [cnt] times
 "hp , CTRL-R h            | display recording h normal/insert mode
 "hdd                      | record text as action into register h

                           | DIVERS
 ------------------------- | ---------------------------------------------
 .                         | repeat last modification
 @:                        | repeat last : command (then @@)
 :history                  | list of all your commands
 /CTRL-R CTRL-W            | pull <cword> onto search/command line
 ga                        | display hex value of char under cursor
 :digraphs  ga             | display table of utf8 chars
 CTRL-V 233                | insert é (insert mode)
 CTRL-A  , CTRL-X          | add, Substract N to the number after cursor
 CTRL-R=5*5                | insert 25 into text
 :set paste :set nopaste   | before and after pasting from webBrowser
 :sort [n]                 | sort column 1 [numeric]
 :%!sort -t';' -k3 [-n]    | sort column 3 of coma separated [numeric]
 :[range]hardcopy out.ps   | send [range] lines (def. all) to printer

                           | PLUGINS
 ------------------------- | ---------------------------------------------
 <leader>gs                | |FUGITIVE| :Gstatus - un/stage, cc commt msg
 :TagbarToggle             | |TAGBAR| (maped to F8)

                           | TAGS and *SURROUND*
 ------------------------- | ---------------------------------------------
!/a<   |  a"  |\       at! | around (or all) the delimitor
 <p id= " xy " > abc </p>  |    example
  \i<    |i"|/  | it|      | inside the delimitor (t for a pair of tags)
cst<i>                     | <p>abc</p> to <i>abc</i>  *SURROUND*
dst                        | <p>abc</p> to abc         *SURROUND*
viw S"                     | abc to "abc"              *SURROUND*
cs")                       | "abc" to (abc)            *SURROUND*
cs)<p>                     | (abc) to <p>abc</p>       *SURROUND*

                           | RECHERCHE, REMPLACEMENT ET SUPPRESSIONS
 ------------------------- | ---------------------------------------------
 * , g*                    | search forwd whole/partial word under cursor
 [I                        | display all lines contain word under cursor
 :g[!]/{prtn}/[cmd]        | execute [cmd] on lines matching(!NOT) {ptrn}
 :g/{ptrn}    , :v/{ptrn}  | display all lines {ptrn} matches/NOT (v=g!)
 :g/^[\.]*$/d              | delete empty lines
 :[%]s/{ptrn}/{str}/[flag] | {str} replace {ptrn} on current/|all| line
                           | flags: *c* onfirm, *g* global, *i* gnoreCase
 :& , :~                   | repeat last substitute
 g%                        | normal mode repeat last substitute

 :%s/\s\+$//               | supprime les espaces de fin de ligne
 :s/foo/bar/               | remplace le 1er  foo de ligne courante par bar
 :s/.*\zsfoo/bar/          | remplace dernier foo de ligne courante par bar
 :s/foo/bar/g              | remplace tous foo de ligne courante par bar
 :%s/foo/bar/g             | remplace TOUS foo du fichier par bar
 :%s/foo/bar/gc            | " " idem avec demande de confirmation
 :%s/\<foo\>//g            | supprime le mot "foo".
 :%s/.*\<foo\>//           | supprime le mot "foo" et ce qui le précède.
 :%s/\<foo\>.*//           | supprime le mot "foo" et ce qui le suit.
 :%s/.*\ze\<foo\>//        | supprime ce qui précède le mot "foo"
 :%s/\<foo\>\zs.*//        | supprime ce qui suit le mot "foo"
 :%s/\<foo\>.\{5}//        | supprime "foo" + les 5 catactères qui suivent
 :%s#<\_.\{-1,}>##g        | delete html tags possibly multi-line
 :%s/<!--\_p\{-}-->//g     | delete multiple line comments

                           | --- ANCHORS ----
                   ^   $   | start/end of line
                   \<  \>  | beginning/end of a word
                   [ ]     | any characters listet
                   [^ ]    | any characters except those listet

                           | ---- METACARACTÈRES ---
          .                | any character except newline
         \d                | digit character [0-9]
         \a                | alphabetic character [A-Za-z]
         \w                | word character [0-9A-Za-z_]
         \l , \u           | lowercase, uppercase  character
         \p                | printable character
         \s                | whitespace character
         \_\x              | any character of class x, including newline
         Greedy : ^Greedy  | quantifier
         *      : \{-}     | 0 ou plus
         \+     : \{-1}    | 1 ou plus
         \=     : \{-0,1}  | 0 ou 1 fois
         \{n}   :          | n fois exactement
         \{n,}  : \{-n,}   | n fois au moins
         \{,m}  : \{-,m}   | m fois au plus
         \{n,m} : \{-n,m}  | entre n et m fois

                           | ---- REPLACEMENT ----
                  &        | the whole matched pattern
                  \1 \2... | matches text in 1st, 2nd ... pair of \(\)
                  \l  \u   | next char  made lowercase / uppercase
                  \L  \U   | next chars made lowercase / uppercase
                  \E       | end of \U and \L

 vim:tw=78:ts=8:ft=help:norl:
