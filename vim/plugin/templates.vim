"---------- Use Template Files ----------"
autocmd BufNewFile * execute s:template() |
			\ execute "silent! %s/CURSOR//"
func! s:template()
	let templatefile = expand("~/.vim/templates/file.") . expand("%:e")
	if filereadable(templatefile)
		execute "silent! 0r " . templatefile
		execute "silent! %s/TITLE/" . expand("%:t:r") . "/g"
		execute "silent! %s/HEADER/" . toupper(expand("%:t:r")) . "/g"
	endif
endfunc
