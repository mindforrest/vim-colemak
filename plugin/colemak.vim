" Description:
"   Original by Shai Coleman, 2008-04-21.  http://colemak.com/
"   Modified by Esko, 2012-09-14.
"   Minimized by mindforrest, 2021-05-04.  github.com/mindforrest/vim-colemak
"
"   Load colemak.vim after all other Vim scripts.
"
"   Refer to ../README.markdown for keymap explanations.


" Require Vim >=7.0
    if v:version < 700 | echohl WarningMsg | echo "colemak.vim: You need Vim version 7.0 or later." | echohl None | finish | endif

" Up/down/left/right and screen top/join/help/screen bottom
    nnoremap n h|xnoremap n h|onoremap n h|
    nnoremap e j|xnoremap e j|onoremap e j|
    nnoremap i k|xnoremap i k|onoremap i k|
    nnoremap o l|xnoremap o l|onoremap o l|

    nnoremap N H|xnoremap N H|onoremap N H|
    nnoremap E J|xnoremap E J|onoremap E J|
    nnoremap I K|xnoremap I K|onoremap I K|
    nnoremap O L|xnoremap O L|onoremap O L|

" Words forward/backward
    " h/H = back word/WORD
    " b/B = end of word/WORD
    " j/J = forward word/WORD
    nnoremap h b|xnoremap h b|onoremap h b|
    nnoremap H B|xnoremap H B|onoremap H B|
    nnoremap b e|xnoremap b e|onoremap b e|
    nnoremap B E|xnoremap B E|onoremap B E|
    nnoremap j w|xnoremap j w|onoremap j w|
    nnoremap J W|xnoremap J W|onoremap J W|

" insert to k
    nnoremap k i|
    nnoremap K I|

" Visual mode
    " Make insert/add work also in visual line mode like in visual block mode
    xnoremap <silent> <expr> k (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")
    xnoremap <silent> <expr> K (mode() =~# "[V]" ? "\<C-V>0o$I" : "I")

" Search
    nnoremap w n|xnoremap w n
    nnoremap W N|xnoremap W N

" inneR text objects
    " E.g. dip (delete inner paragraph) is now drp
    onoremap r i

" Open
    nnoremap l o|
    nnoremap L O|

" Folds, etc.
    nnoremap zn zj|xnoremap zn zj|
    nnoremap ze zk|xnoremap ze zk|

" Window handling
    nnoremap <C-W>n <C-W>h|xnoremap <C-W>n <C-W>h|
    noremap <C-W>e <C-W>j|xnoremap <C-W>e <C-W>j|
    nnoremap <C-W>i <C-W>k|xnoremap <C-W>i <C-W>k|
    nnoremap <C-W>o <C-W>l|xnoremap <C-W>o <C-W>l|
"
