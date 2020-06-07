let g:lightline = {
                  \ 'colorscheme': 'sonokai',
                  \ 'active': {
                  \   'left': [ [ 'mode', 'paste' ],
                  \             [ 'gitbranch', 'filename', 'readonly', 'modified', 'cocstatus' ] ],
                  \   'right': [ [ 'lineinfo' ],
                  \              [ 'percent' ] ],
                  \ },
                  \ 'component_function': {
                  \   'gitbranch': 'fugitive#head',
                  \   'cocstatus': 'coc#status',
                  \ },
                  \ 'mode_map': {
                  \   'n': 'N',
                  \   'i': 'I',
                  \   'R': 'R',
                  \   'v': 'V',
                  \   'V': 'VL',
                  \   "\<C-v": 'VB',
                  \   'c': 'C',
                  \   's': 'S',
                  \   'S': 'SL',
                  \   "\<C-s>": 'SB',
                  \   't': 'T',
                  \ },
                  \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
