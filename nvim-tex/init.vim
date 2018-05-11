"vimtex
autocmd User CmSetup call cm#register_source({
       \ 'name' : 'vimtex',
       \ 'priority': 8,
       \ 'scoping': 1,
       \ 'scopes': ['tex'],
       \ 'abbreviation': 'tex',
       \ 'cm_refresh_patterns': g:vimtex#re#ncm,
       \ 'cm_refresh': {'omnifunc': 'vimtex#complete#omnifunc'},
       \ })
let g:vimtex_view_general_viewer = 'echo'
let g:vimtex_compiler_enabled = 1
let g:vimtex_compiler_progname = 'nvr'
