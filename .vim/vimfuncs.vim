
"Language Specific Code Completion {:help options /complete|omnifunc|new-omni-complete}
" to activate, keystroke <Ctrl-X-O>
	"let php_sql_query=1 "highlight within strings
	"let php_htmlInStrings=1 "highlight within stings


"""" VIM BASICS {:help vim-modes|key-codes|windows|tab|help}
":help usr_03 "moving around
":help statusline "statusline|titlestring syntax
":help colortest
":help expand ":cd %:h

" to see what colors are available in terminal on current system
" create file and run ':so filename' in vim to see what colors are available
" unescape the '\"cermbg" on the exec 'syn match line

"let num = 255
"while num >= 0
"	exec 'highlight col_'.num.' ctermbg='.num.' ctermfg=white'
"	exec 'syn match col_'.num.' \"ctermbg='.num.':...." containedIn=All'
"	call append(0, 'ctermbg='.num.':....')
"	let num = num - 1
"endwhile


"Get current filesize
function! FileSize()
	let bytes = getfsize(expand("%:p"))
	let kb = 1024
	let mb = kb * 1024
	let gb = mb * 1024
	let tb = gb * 1024

	if bytes < kb
		return bytes . "b"
	elseif bytes < mb
		return "~" . (bytes / kb) . "K"
	elseif bytes < gb
		return "~" . (bytes / mb) . "M"
	elseif bytes < gb *2 -1
		return "<2G"
	else
		return "BIG"
	endif
endfunction

