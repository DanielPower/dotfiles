let g:vimwiki_list = [{
      \ 'path':'$HOME/.vimwiki', 
      \ 'path_html':'$HOME/.vimwiki_html',
      \ 'syntax': 'markdown',
      \ 'ext': '.md'
      \ }]

autocmd BufNewFile ~/.vimwiki/JO-*.md :silent 0r !~/.config/nvim/vimwiki/journal.sh '%'
autocmd BufWritePost ~/.vimwiki/JO-*.md :silent !cd ~/.vimwiki && git add . && git commit -m "update journal" && git push
