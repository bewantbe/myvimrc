"to reload ~/.vimrc
":so $MYVIMRC

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  if has('gui_running')
"      colorscheme koehler
      colorscheme desert
"      set lines=40
"      set columns=80
    let hostname = substitute(system('hostname'), '\n', '', '')
    if hostname == 'xle'
      set guifont=Monospace\ 11
    endif
    if hostname == 'xhp'
      set guifont=Monospace\ 12
    endif
      set guioptions-=T
  "see  :set guifont=*
      set number
      hi linenr ctermfg=gray
      set cursorline
  else
      if &t_Co == 256
          colorscheme slate
      else
          colorscheme elflord
"          colorscheme default
      endif
  endif

endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " For Vundle
  " https://github.com/gmarik/vundle#about
  filetype off                   " required!

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " let Vundle manage Vundle
  " required! 
  Bundle 'gmarik/vundle'

  Bundle 'Valloric/YouCompleteMe'
  Bundle 'thinca/vim-localrc'

  " read identifiers from my tags files
  " note Ctags needs to be called with the --fields=+l option
  let g:ycm_collect_identifiers_from_tags_files = 1

  "Bundle 'scrooloose/syntastic'

  "
  " Brief help
  " :BundleList          - list configured bundles
  " :BundleInstall(!)    - install(update) bundles
  " :BundleSearch(!) foo - search(or refresh cache first) for foo
  " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
  "
  " see :h vundle for more details or wiki for FAQ
  " NOTE: comments after Bundle command are not allowed..


  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " use ctrlp.vim, see http://kien.github.io/ctrlp.vim/#installation
  set runtimepath^=~/.vim/bundle/ctrlp.vim

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  "autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" http://www.vim.org/scripts/script.php?script_id=3600
" Octave syntax, but seems YCM only knows matlab...
" remember to modify syntax.vim, s/octave/matlab/
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=matlab
augroup END 

" Use keywords from Octave syntax language file for autocomplete
if has("autocmd") && exists("+omnifunc")
   autocmd Filetype matlab
   \ if &omnifunc == "" |
   \ setlocal omnifunc=syntaxcomplete#Complete |
   \ endif
endif

" Accessing GNU Octave info 
" when editing a *.m file, you can type K in normal mode and the word under the cursor will be searched for in the GNU Octave documentation index
autocmd FileType matlab setlocal keywordprg=info\ octave\ --vi-keys\ --index-search

" this cost about 0.1 sec, which is bad...
"let octavempath = system('octave -qf --eval fprintf\([OCTAVE_HOME\ \"/share/\"\ OCTAVE_VERSION\ \"/m/*\"]\)')
"autocmd FileType matlab let &path .= ',' . octavempath

autocmd FileType matlab set path+=/usr/share/octave/3.6.2/m/*

" key map for runing octave script
nnoremap <silent> <F5> :<C-u>Update<CR>:silent :!/home/xyy/.vim/octave_run_cmd.sh %<CR><C-L>
inoremap <F5> <Esc>:Update<CR>:silent :!/home/xyy/.vim/octave_run_cmd.sh %<CR><C-L>

" Jumping between control statements 
" http://wiki.octave.org/Vim
"set nocompatible
"filetype plugin on
runtime macros/matchit.vim

" http://vim.wikia.com/wiki/Indenting_source_code
" To keep vim from converting eight spaces into tabs
set expandtab
" To indent two spaces (instead of one tab of eight spaces, the vim default)
set shiftwidth=2
set softtabstop=2

" auto detect encodings
" encoding for new files
set fileencoding=utf8
" auto-detect these encodings
"set fileencodings=ucs-bom,gb18030,utf-8,default
set fileencodings=utf-8,gb18030,ucs-bom,default

" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
" Press Space to turn off highlighting and clear any message already displayed.
"nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR><Space>
nnoremap <CR> :nohlsearch<CR><CR>

"http://vim.wikia.com/wiki/Alternative_tab_navigation
if has("gui_running")
  " open new tab
  nnoremap <C-n>     :tabnew<CR>
  inoremap <C-n>     <Esc>:tabnew<CR>
  " Open files always in new tabs
  "autocmd VimEnter * tab all
  "autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'
  " another way
  "au BufAdd,BufNewFile,BufRead * nested tab sball
  " another way, http://vim.wikia.com/wiki/Open_every_buffer_in_its_own_tabpage
  "au BufNewFile,BufRead * nested
  "  \ if &buftype != "help" |
  "  \   tab sball |
  "  \ endif
  " go to the n-th tabpage
  nnoremap <A-1> 1gt
  nnoremap <A-2> 2gt
  nnoremap <A-3> 3gt
  nnoremap <A-4> 4gt
  nnoremap <A-5> 5gt
  nnoremap <A-6> 6gt
  nnoremap <A-7> 7gt
  nnoremap <A-8> 8gt
  nnoremap <A-9> 9gt
  nnoremap <A-0> 10gt
  inoremap <A-1> <Esc>1gta
  inoremap <A-2> <Esc>2gta
  inoremap <A-3> <Esc>3gta
  inoremap <A-4> <Esc>4gta
  inoremap <A-5> <Esc>5gta
  inoremap <A-6> <Esc>6gta
  inoremap <A-7> <Esc>7gta
  inoremap <A-8> <Esc>8gta
  inoremap <A-9> <Esc>9gta
  inoremap <A-0> <Esc>10gta
  " move tab
  nnoremap <A-!> :tabm 0<CR>
  nnoremap <A-@> :tabm 1<CR>
  nnoremap <A-#> :tabm 2<CR>
  nnoremap <A-$> :tabm 3<CR>
  nnoremap <A-%> :tabm 4<CR>
  nnoremap <A-^> :tabm 5<CR>
  nnoremap <A-&> :tabm 6<CR>
  nnoremap <A-*> :tabm 7<CR>
  nnoremap <A-(> :tabm 8<CR>
  nnoremap <A-)> :tabm 9<CR>
endif


" Set working directory to the current file
" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
" by press ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" by command :CDC
command CDC cd %:p:h

"http://vim.wikia.com/wiki/Smart_home
"Simple mappings
"noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
"imap <silent> <Home> <C-O><Home>
"More features
function! SmartHome()
  let first_nonblank = match(getline('.'), '\S') + 1
  if first_nonblank == 0
    return col('.') + 1 >= col('$') ? '0' : '^'
  endif
  if col('.') == first_nonblank
    return '0'  " if at first nonblank, go to start line
  endif
  return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>


"http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files
"Map Ctrl-S to save current or new files
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
if has("gui_running")
  nnoremap <silent> <C-S> :<C-u>Update<CR>
  "inoremap <c-s> <C-O>:Update<CR>
  inoremap <c-s> <Esc>:Update<CR>
else
  nnoremap <silent> <C-F12> :<C-u>Update<CR>
  "inoremap <c-s> <C-O>:Update<CR>
  inoremap <C-F12> <Esc>:Update<CR>
endif

" map control-backspace to delete the previous word
inoremap <C-BS> <C-W>
" map control-delete to delete the next word
inoremap <C-Del> <C-O>de
" easier paste in insert mode (+ is clipboard, " is yank, * is primary select)
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
inoremap <A-d> <C-R>"
inoremap <A-v> <C-R>+
vnoremap <A-v> "+y
vnoremap P "0p
" another solution:
" http://superuser.com/questions/321547/how-do-i-replace-paste-yanked-text-in-vim-without-yanking-the-deleted-lines

" map Shift + Arrows to select characters
" http://stackoverflow.com/questions/9721732/mapping-shift-arrows-to-selecting-characters-lines
imap <S-Left> <Esc>v
vmap <S-Left> h
imap <S-Right> <Esc><Right>v
vmap <S-Right> l

imap <S-Up> <Esc>v
vmap <S-Up> k
imap <S-Down> <Esc>v
vmap <S-Down> j

" Make <C-Right> more like conventional editor
" original <C-Right> jumps to beginning of next WORD (W)
"nnoremap <C-Right> E
"inoremap <C-Right> <Esc>Ea
"inoremap <C-Left> <Esc>Bi
"vnoremap <C-Right> E
nnoremap <C-Right> e
vnoremap <C-Right> e
inoremap <C-Right> <C-O>e<Right>
nnoremap <C-Left> b
vnoremap <C-Left> b
inoremap <C-Left> <C-O>b

nnoremap <C-Up> <C-Y>
vnoremap <C-Up> <C-Y>
inoremap <C-Up> <C-O><C-Y>
nnoremap <C-Down> <C-E>
vnoremap <C-Down> <C-E>
inoremap <C-Down> <C-O><C-E>


" Opening (c)tags in new tab in (G)Vim
" http://stackoverflow.com/questions/908269/opening-ctags-in-new-tab-in-gvim
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

"------------------------------------------------------------------------------
" http://vim.wikia.com/wiki/Restore_screen_size_and_position
" To enable the saving and restoring of screen positions.
let g:screen_size_restore_pos = 1

" To save and restore screen for each Vim instance.
" This is useful if you routinely run more than one Vim instance.
" For all Vim to use the same settings, change this to 0.
let g:screen_size_by_vim_instance = 1

if has("gui_running")
  function! ScreenFilename()
    if has('amiga')
      return "s:.vimsize"
    elseif has('win32')
      return $HOME.'\_vimsize'
    else
      return $HOME.'/.vimsize'
    endif
  endfunction

  function! ScreenRestore()
    " Restore window size (columns and lines) and position
    " from values stored in vimsize file.
    " Must set font first so columns and lines are based on font size.
    let f = ScreenFilename()
    if has("gui_running") && g:screen_size_restore_pos && filereadable(f)
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      for line in readfile(f)
        let sizepos = split(line)
        if len(sizepos) == 5 && sizepos[0] == vim_instance
          silent! execute "set columns=".sizepos[1]." lines=".sizepos[2]
          silent! execute "winpos ".sizepos[3]." ".sizepos[4]
          return
        endif
      endfor
    endif
  endfunction

  function! ScreenSave()
    " Save window size and position.
    if has("gui_running") && g:screen_size_restore_pos
      let vim_instance = (g:screen_size_by_vim_instance==1?(v:servername):'GVIM')
      let data = vim_instance . ' ' . &columns . ' ' . &lines . ' ' .
            \ (getwinposx()<0?0:getwinposx()) . ' ' .
            \ (getwinposy()<0?0:getwinposy())
      let f = ScreenFilename()
      if filereadable(f)
        let lines = readfile(f)
        call filter(lines, "v:val !~ '^" . vim_instance . "\\>'")
        call add(lines, data)
      else
        let lines = [data]
      endif
      call writefile(lines, f)
    endif
  endfunction

  if !exists('g:screen_size_restore_pos')
    let g:screen_size_restore_pos = 1
  endif
  if !exists('g:screen_size_by_vim_instance')
    let g:screen_size_by_vim_instance = 1
  endif
  autocmd VimEnter * if g:screen_size_restore_pos == 1 | call ScreenRestore() | endif
  autocmd VimLeavePre * if g:screen_size_restore_pos == 1 | call ScreenSave() | endif
endif



"------------------------------------------------------------------------------

"color scheme candidates:
"for gui (gvim)
"colorscheme koehler    good 底色纯黑, 可能与GUI或桌面主题不配
"colorscheme desert     good 略有朦胧感
"colorscheme slate      good 注释较淡
"colorscheme evening    常量略显奇葩
"colorscheme lucius     有些朦胧感
"colorscheme torte      普通字色彩偏淡

"for 8 color term (gnome-terminal)
"colorscheme elflord    good 宏定义使用的色彩偏友好
"colorscheme ron        字符串和常量的色彩偏暗
"colorscheme slate      关键字与内定类型的色彩略有不和谐感
"colorscheme torte      略有朦胧感(费劲), 注释与宏定义易混淆
"colorscheme desert
"colorscheme default    acceptable 代码太白(略显刺眼), 宏定义偏暗

"for 256 color term (xterm+256color)
"colorscheme slate      注释偏显眼
"colorscheme lucius     略有朦胧感(费劲)
"colorscheme pablo      整体配色有一些不和谐感(色彩偏强烈)
"colorscheme desert     宏的色彩易有眩晕感
"colorscheme torte      字符常量略有不和谐感
"colorscheme ron        字符串常量的色彩易有眩晕感
"colorscheme elflord    字符串常量的色彩易有眩晕感
"colorscheme darkblue   注释和宏的色彩过于刺眼
