let g:LanguageClient_serverCommands = {}
let g:LanguageClient_serverCommands['javascript'] = ['javascript-typescript-stdio']
let g:LanguageClient_serverCommands['python'] = ['pyls']
let g:LanguageClient_serverCommands['vue'] = ['vls']

" format
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
