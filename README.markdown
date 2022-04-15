vim-colemak
===========

Colemak key mappings for Vim. Trimmed and modified version of [jooize,s configuration](https://github.com/jooize/vim-colemak), which is a trimmed and modified version of [Shai Coleman's configuration](http://colemak.com/pub/vim/colemak.vim).

My version is decently minimized to change as few keys as possible. It has word navigtion on h and j, which is a quirk of my keyboard layout, so no one else will ever use this.

Install
-------

1. Use [vim-plug](https://github.com/junegunn/vim-plug).
2. Add to `.vimrc`: `Plug 'mindforrest/vim-colemak'`
3. Run `vim +PlugInstall`
4. You probably want to load vim-colemak last. Reload the plugin at the bottom of your Vim configuration.

    ```
    " Reload vim-colemak to remap any overridden keys
    silent! source "$HOME/.vim/bundle/vim-colemak/plugin/colemak.vim"
    ```
    *with neovim:*
    ```
    silent! source "$HOME/.config/nvim/bundle/vim-colemak/plugin/colemak.vim"
    ```

    *Note: You might be using `~/.vim/plugged`.*

5. See [issues](#issues) for conflicts with other plugins.

Key mappings
------------

```Colemak layout:                  |                 QWERTY layout:
`12345 67890`     Move around:  |  (instead of)   `12345 67890-=
 zwfp,    .luy;-        i        |       k          qwert yuiop[]\
 arstg[  ]kneio'      n   o      |     h   l        asdfg HJKL;'
 qxcdb    mhjv/=        e        |       j          zxcvb nm,./

(  novx)  n = h (Left)     e = l (Right)     i = k (Up)     o = j (Down)

(  n  x)  v = v (Visual)   V = V (Visual line)
(  n   )  r = r (Replace)  R = R (Replace)
(  n   )  k = i (Insert)   K = I (Insert before first non-blank of line)
(  n   )  a = a (Append)   A = A (Append at end of line)
(  n   )  c = c (Change)   C = C (Change to end of line)

(  n   )  w = n (for navigating search)

(   o  )  r = i (Example: dip -> drp (Delete inner paragraph))

(  novx)  h = b  (back word)   
(  novx)  b = w  (word end)
(  novx)  j = e  (forward word)

(  n  x)  zn = zj (Next fold) 
(  n  x)  ze = zk (Previous fold)

(  n   )  l = o (open)

(  n  x)  <C-W>n = <C-W>h (Window left)
(  n  x)  <C-W>e = <C-W>j (Window down)
(  n  x)  <C-W>i = <C-W>k (Window up)
(  n  x)  <C-W>o = <C-W>l (Window right)

Lost:
(  n   )  Z (Quit)
(  n  x)  <C-W>n (Window down) [Use <C-W><C-N> = <C-W><C-N>]
(  n  x)  <C-W>i (Window down) [Use <C-W><C-I> = <C-W><C-I>]

Legend:
<C-X>     Ctrl-X
(c     )  Command-line mode
( i    )  Insert mode
(  n   )  Normal mode
(   o  )  Operator pending
(    v )  Visual+Select mode
(     x)  Visual mode
```


Issues
------

### [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) keymap collision

    " Fix for colemak.vim keymap collision. tpope/vim-fugitive's maps y<C-G>
    " and colemak.vim maps 'y' to 'w' (word). In combination this stalls 'y'
    " because Vim must wait to see if the user wants to press <C-G> as well.
    augroup RemoveFugitiveMappingForColemak
        autocmd!
        autocmd BufEnter * silent! execute "nunmap <buffer> <silent> y<C-G>"
    augroup END

Changes
-------


## 2021-05-04

    - Rewrote the plugin, minimizing changes. Past ergonomics, I think preserving the letter of a command is better than the position of it-it's personally easier for me to remember the letters, and is signifigantly less complex for overall configuration.



### 2016–03–06

- [Restore wrapped line behavior to Vim default (e.g. n = gj is now n = j)](https://github.com/jooize/vim-colemak/commit/6882195551f1025e72f352811ea7b331bc73b32e)
- [Remove turbo navigation (HNEI are now unmapped)](https://github.com/jooize/vim-colemak/commit/c057ed04075cab3f0a67c0fdc30c9d2f35621eff)
- [Add missing mapping for reselecting last visual selection (ga = gv)](https://github.com/jooize/vim-colemak/commit/5167bbf4c411fd765833c97bfc078bed53cc995e)

#### Restore turbo navigation

Add the following to your `.vimrc`:

```
" Turbo navigation (Colemak) {{{
    " Works with counts, see ":help complex-repeat"
    nnoremap <silent> H @='5h'<CR>|xnoremap <silent> H @='5h'<CR>|onoremap <silent> H @='5h'<CR>|
    nnoremap <silent> N @='5gj'<CR>|xnoremap <silent> N @='5gj'<CR>|onoremap <silent> N @='5gj'<CR>|
    nnoremap <silent> E @='5gk'<CR>|xnoremap <silent> E @='5gk'<CR>|onoremap <silent> E @='5gk'<CR>|
    nnoremap <silent> I @='5l'<CR>|xnoremap <silent> I @='5l'<CR>|onoremap <silent> I @='5l'<CR>|
" }}}
```

I removed turbo navigation since I felt it doesn't suit as default Vim mappings, which also frees up the keys for custom uses. I'm considering making it an option. [Discuss!](https://github.com/jooize/vim-colemak/issues/4)
