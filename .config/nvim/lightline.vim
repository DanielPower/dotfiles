set noshowmode
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
                  \   'cocstatus': 'CocStatus',
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

function! CocStatus() abort
	  let info = get(b:, 'coc_diagnostic_info', {})
	  if empty(info) | return '' | endif
	  let msgs = []
	  if get(info, 'error', 0)
	    call add(msgs, '' . info['error'])
	  endif
	  if get(info, 'warning', 0)
	    call add(msgs, '' . info['warning'])
	  endif
	  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
	endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
