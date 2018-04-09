set hidden

let g:LanguageClient_serverCommands = {
    \ 'java': ['/jdt-ls/startup.sh'],
    \ }

nnoremap <silent> gh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <F3> :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

au User CmSetup call cm#register_source({'name' : 'cm-java',
        \ 'priority': 9,
        \ 'scopes': ['java'],
        \ 'abbreviation': 'LC',
        \ 'word_pattern': '[\w/]+',
        \ 'cm_refresh_patterns':['\.'],
        \ 'cm_refresh': 'LanguageClient_NCMRefresh',
        \ })
