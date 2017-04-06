"---------- OmniComplete on keypress ----------"
if exists('g:loaded_youcompleteme') || exists('g:loaded_neocomplete')
	finish
endif

set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone

" Keys that trigger completeopt
for key in split("a b c d e f g h i j k l m n o p q r s t u v w x y z " .
			\ "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z")
	execute "inoremap <silent><expr> ".key." \"".key."\" . OpenAutocomp()"
endfor
func! OpenAutocomp()
	return pumvisible() ? "" : "\<C-X>\<C-O>"
endfunc

inoremap <silent><expr> . ".\<C-X>\<C-O>"
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
