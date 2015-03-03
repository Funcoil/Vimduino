function! VimduinoSelectBoard()
	let $ARD_TAG=g:BoardNames[line(".") - 1]
	close
endfunction

function! VimduinoSelectBoardAbort()
	close
endfunction

function! VimduinoBoardMenu()
	let Boards=split(system('/usr/share/arduino/ard-parse-boards --boards_txt=/usr/share/arduino/hardware/arduino/boards.txt --boards | tail -n +2'), "\n")
	let Last_buffer = bufnr('%')

	if !exists('VimduinoBoardsWidth')
		let g:VimduinoBoardsWidth = 60
	endif

	let bname = '__ArdBoards__'

	let winnum = bufwinnr(bname)
	if winnum != -1
		if winnr() != winnum
			" If not already in the window, jump to it
			exe winnum . 'wincmd w'
		endif
	else
		let bufnum = bufnr(bname)
		if bufnum == -1
			let wcmd = bname
		else
			let wcmd = '+buffer' . bufnum
		endif

		exe 'silent! botright ' . g:VimduinoBoardsWidth . 'vsplit ' . wcmd
	endif

	setlocal modifiable
	setlocal buftype=nofile
	setlocal bufhidden=delete
	setlocal noswapfile
	setlocal nowrap
	setlocal nobuflisted
	setlocal cursorline

	setlocal winfixwidth

	let old_cpoptions = &cpoptions
	set cpoptions&vim

	nnoremap <buffer> <silent> <CR>
		\ :call VimduinoSelectBoard()<CR>
	vnoremap <buffer> <silent> <CR>
		\ :call VimduinoSelectBoard()<CR>
	nnoremap <buffer> <silent> <Esc>
		\ :call VimduinoSelectBoardAbort()<CR>
	vnoremap <buffer> <silent> <Esc>
		\ :call VimduinoSelectBoardAbort()<CR>
	nnoremap <buffer> <silent> q
		\ :call VimduinoSelectBoardAbort()<CR>
	vnoremap <buffer> <silent> q
		\ :call VimduinoSelectBoardAbort()<CR>

	let &cpoptions = old_cpoptions

	let g:BoardNames = []

	let boardNum = 0
	let i = 0

	for board in Boards
		let boardname = split(board, " ")[0]
		call add(g:BoardNames, boardname)
		put =board

		if boardname == $ARD_TAG
			let boardNum = i
		endif

		let i = i + 1
	endfor

	silent! %s/^[^ ]*  *//

	normal! 1Gdd

	let i = 0
	while i < boardNum
		normal! j
		let i = i + 1
	endwhile

	setlocal nomodifiable
endfunction

setf cpp
map <C-U> :make<Enter>
map <C-D> :!stty -F "$ARDUINO_PORT" hupcl; echo -n > "$ARDUINO_PORT"; $VIMDUINO_PATH/infiniteread < "$ARDUINO_PORT"<Enter>
map <C-B> :call VimduinoBoardMenu()<Enter>
