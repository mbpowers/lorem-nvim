fun! Lorem()
    lua for k in pairs(package.loaded) do if k:match("^lorem") then package.loaded[k] = nil end end
    lua require("lorem").printLorem(count)
endfun

" augroup Lorem
"     autocmd
" augroup END

nnoremap <Plug>Lorem :<C-u>call Lorem()<CR>
nmap <leader>l <Plug>Lorem
