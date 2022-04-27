" Syntax Highlighting
if has("syntax")
	syntax on
endif

set nu " 줄 번호
set autoindent " 자동 들여쓰기
set cindent
set ts=4 " Tab 너비
set shiftwidth=4 " 자동 들여쓰기 너비
set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
set showmatch " 일치하는 괄호 하이라이팅 
set ruler " 현재 커서 위치 표시


" ========== Mapping ========== 
map <F1> v]}zf
map <F2> zo
map <F3> :Tlist<CR><C-W><C-W>
map <F4> :BufExplorer<CR>


" ========== 파일 Buffer 이동 ==========
map ,1 :b!1<CR>
map ,2 :b!2<CR>
map ,3 :b!3<CR>
map ,4 :b!4<CR>
map ,5 :b!5<CR>
map ,6 :b!6<CR>
map ,7 :b!7<CR>
map ,8 :b!8<CR>
map ,9 :b!9<CR>
map ,0 :b!10<CR>

" ========== Ctags ==========
set tags=./tags,/home/sol/dev/tags,/home/sol/dev/linux/tags " 경로 추가해야함
if version >= 500
func! Sts()
	let st= expand("<cword>") " current word
	exe "sts ".st
endfunc
nmap ,st :call Sts()<CR>
func! Tj()
	let tj= expand("<cword>")
	exe "tj ".tj
endfunc
nmap ,tj :call Tj()<CR>
endif


" ========== Cscope ==========
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb

if filereadable("./cscope.out")
	cs add cscope.out
else
	cs add /home/sol/dev/linux/cscope.out " 경로 추가해야 함
endif
set csverb

func! Css() " Find this C symbol
	let css= expand("<cword>")
	new
	exe "cs find s ".css
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,css : call Css()<CR>

func! Csc() " Find functions calling this function
	let csc= expand("<cword>")
	new
	exe "cs find c ".csc
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csc : call Csc()<CR>

func! Csd() " Find functions called this function
	let csd= expand("<cword>")
	new
	exe "cs find d ".csd
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csd : call Csd()<CR>

func! Csg() " Find this definition
	let csg= expand("<cword>")
	new
	exe "cs find g ".csg
	if getline(1) == " "
		exe "q!"
	endif
endfunc
nmap ,csg : call Csg()<CR>


" ========== Manpage ==========
func! Man()
	let sm= expand(<cword>)
	exe "!man -S 2:3:4:5:6:7:8:9:tcl:n:l:p:o ".sm
endfunc
nmap ,man : call Man()<CR><CR>

" Bundle 
