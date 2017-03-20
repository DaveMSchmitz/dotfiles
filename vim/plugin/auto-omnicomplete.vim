"---------- OmniComplete on keypress ----------"
set omnifunc=syntaxcomplete#Complete
set completeopt=noinsert,menuone
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
let g:loaded_sql_completion=0
let g:omni_sql_no_default_maps=1

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
