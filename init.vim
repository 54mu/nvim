" numbering
set relativenumber
set number

" plugins

call plug#begin('~/.vim/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

" funzione per incollare le immagini

function! MD_pimage()
	call mkdir("img", "p")
	let filename = strftime("%Y%m%d%H%M%S")
	call system("xclip -selection clipboard -t image/png -o > img/".filename.".png")
	call append(".", "![".filename."](img/".filename.".png)")
	normal!	jo
	unlet filename
endfunction

nnoremap <leader>pi :call MD_pimage()<cr>

