" https://dev.to/2nit/how-to-write-neovim-plugins-in-lua-5cca
if exists('g:loaded_lorem') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim " reset them to defaults

command! Lorem lua require'lorem'.printLorem()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpo

let g:loaded_lorem = 1
let g:lorem#commamin = get(g:, 'lorem#commamin', 5)
let g:lorem#commamax = get(g:, 'lorem#commamax', 11)
let g:lorem#periodmin = get(g:, 'lorem#periodmin', 6)
let g:lorem#periodmax = get(g:, 'lorem#periodmax', 14)
let g:lorem#paragraphmin = get(g:, 'lorem#paragraphmin', 4)
let g:lorem#paragraphmax = get(g:, 'lorem#paragraphmax', 10)

nnoremap <Plug>Lorem :<C-u>Lorem<CR>
