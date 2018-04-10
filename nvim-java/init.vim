let g:LanguageClient_serverCommands['java'] = ['/jdt-ls/startup.sh']

au User CmSetup call cm#register_source({'name' : 'cm-java',
        \ 'priority': 9,
        \ 'scopes': ['java'],
        \ 'abbreviation': 'LC',
        \ 'word_pattern': '[\w/]+',
        \ 'cm_refresh_patterns':['\.'],
        \ 'cm_refresh': 'LanguageClient_NCMRefresh',
        \ })
