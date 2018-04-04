" vim-lsp
if executable('/jdt-ls/startup.sh')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'jdt-ls',
        \ 'cmd': {server_info->['/jdt-ls/startup.sh']},
        \ 'whitelist': ['java'],
        \ })
endif
