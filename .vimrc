set hlsearch
set number
set incsearch
set wildignore=*.swp,*.o,*~

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviation in command mode to replace '%%' with the path of the current
" file
" http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory
" There is a bug with lilypond syntax script (/usr/share/lilypond/2.18.2/vim/syntax/lilypond.vim)
" where typing %%/ would not perform the abbreviation. It seems to be linked
" with including /usr/share/vim/vim80/syntax/scheme.vim which sets iskeyword
" to a non standard value, which messes up the abbreviation triggers.
" I worked around the issue by restoring iskeyword in my local
" ftplugin/lilypond.vim
cabbr <expr> %% expand('%:h')
