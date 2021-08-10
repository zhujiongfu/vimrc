map <F9> :call SaveInputData()<CR>
func! SaveInputData()
	exec "tabnew"
	exec 'normal "+gP'
	exec "w! /tmp/input_data"
endfunc
set t_Co=256
let g:solarized_termcolors=256
"let g:solarized_termtrans = 1
"let g:solarized_degrade = 1
"let g:solarized_contrast = "normal"
"let g:solarized_visibility = "normal"
syntax enable
set backspace=indent,eol,start
"colorscheme solarized
" highlight StatusLine guifg=SlateBlue guibg=Yellow
" highlight StatusLineNC guifg=Black guibg=Black
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set go=
set guifont=Courier_New:h10:cANSI
syntax on
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
"" goto last exit point
autocmd BufReadPost * normal! g`"
set ruler
set showcmd
set cmdheight=1
"set whichwrap+=<,>,h,l
set scrolloff=3
set novisualbell
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set foldenable
set foldmethod=manual
"set background=dark
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
autocmd BufNewFile *.[ch] exec ":call SetTitle(\"c\")"
autocmd BufNewFile *.cpp exec ":call SetTitle(\"cpp\")"
autocmd BufNewFile *.sh exec ":call SetTitle(\"sh\")"
func SetTitle(filetype)
	if a:filetype == 'sh'
		call setline(1,"\#########################################################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: zhujiongfu")
		call append(line(".")+2, "\# mail: zhujiongfu@live.cn")
		call append(line(".")+3, "\# Created Time: ".strftime("%c"))
		call append(line(".")+4, "\#########################################################################")
		call append(line(".")+5, "\#!/bin/bash")
		call append(line(".")+6, "")
	else
		call setline(1,"/**")
		call append(line("."), " * ".expand("%:t"))
		call append(line(".")+1, " *")
		call append(line(".")+2, " * Copyright (C) ".strftime("%Y zhujiongfu <zhujiongfu@live.cn>"))
		call append(line(".")+3, " * Creation Date: ".strftime("%b %d, %Y"))
		call append(line(".")+4, " *")
		call append(line(".")+5, " */")
	endif
	if a:filetype == 'cpp'
		call append(line(".")+8, "#include <iostream>")
		call append(line(".")+9, "using namespace std;")
		call append(line(".")+10, "")
	endif
	if a:filetype == 'c'
		call append(line(".")+8, "#include <stdio.h>")
		call append(line(".")+9, "")
	endif
	autocmd BufNewFile * normal G
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
vmap <C-c> "+y
nnoremap <F2> :g/^\s*$/d<CR>
nnoremap <C-F2> :vert diffsplit
map <M-F2> :tabnew<CR>
"map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunc
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoread
""autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
set completeopt=preview,menu
set clipboard+=unnamed
set nobackup
:set makeprg=g++\ -Wall\ \ %
set autowrite
"set ruler
set cursorline
set magic
set guioptions-=T
set guioptions-=m
set foldcolumn=0
set foldmethod=indent
set foldlevel=3
set foldenable
set nocompatible
set noeb
set confirm
set autoindent
set cindent
set tabstop=8
" set softtabstop=8
set shiftwidth=8
set noexpandtab
set smarttab
set number
set history=1000
set nobackup
set noswapfile
set ignorecase
set hlsearch
set incsearch
set gdefault
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
set helplang=cn
set laststatus=2
set hidden
filetype on
filetype plugin on
filetype indent on
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
set linespace=0
set wildmenu
set whichwrap+=<,>,h,l
"set mouse=a
set mousehide
set selection=exclusive
"set selectmode=mouse,key
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=1
set scrolloff=3
set smartindent
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
""""""""""""""""""""""""""""""""""""""
"Myself
""""""""""""""""""""""""""""""""""""""
" set cscopequickfix=s-,c-,d-,i-,t-,e-
" set cscopetag
" set csprg=gtags-cscope
"""""""""""""""""""""""""""""""""""""""
"move mouse
"""""""""""""""""""""""""""""""""""""""""""""""
"map <C-h> <ESC>i
"map <C-j> <ESC><Down>I
"map <C-k> <ESC><Up>A
"map <C-l> <ESC>a
"map <C-x> <ESC>xi
"nnoremap f :NERDTreeToggle
map <F7> :NERDTree<CR>
" Use Tab to switch tab pages
nmap <tab> gt
" - Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'ctrlpvim/ctrlp.vim'
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
Plug 'w0rp/ale'
" Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer'}
Plug 'Raimondi/delimitMate'
Plug 'drmingdrmer/xptemplate'
let g:xptemplate_vars = "SParg=&BRfun= \n"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'morhetz/gruvbox'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'
Plug 'acarapetis/vim-colors-github'
Plug 'powerline/powerline'

" 函数参数提示
" Plug 'Shougo/echodoc.vim'

" 撤销记录列表
Plug 'mbbill/undotree'

Plug 'tpope/vim-surround'

" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Plug 'ludovicchabant/vim-gutentags'
    " Plug 'skywind3000/gutentags_plus'
    "预览 quickfix 窗口 ctrl-w z 关闭
    " Plug 'skywind3000/vim-preview'
Plug 'jsfaint/gen_tags.vim'
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1
let g:gen_tags#gtags_auto_update = 1
let g:gen_tags#ctags_auto_update = 1
" let g:gen_tags#use_cache_dir = 0
let g:gen_tags#statusline = 1
" Initialize plugin system
call plug#end()

" airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2

let laststatus = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme = 'molokai'
let g:airline#extensions#ale#enabled = 0

" ale
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" delemeter
let delimitMate_expand_cr = 1

" tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 0
nmap <F3> :TagbarToggle<CR>

" solarized theme
let g:solarized_termtrans = 1
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized

" coc.nvim
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <C-n> coc#refresh()
else
	inoremap <silent><expr> <C-n> coc#refresh()
endif

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
let g:airline#extensions#coc#enabled = 1

function! s:gotoDefinition() abort
  let l:current_tag = expand('<cWORD>')

  let l:current_position    = getcurpos()
  let l:current_position[0] = bufnr()

  let l:current_tag_stack = gettagstack()
  let l:current_tag_index = l:current_tag_stack['curidx']
  let l:current_tag_items = l:current_tag_stack['items']

  if CocAction('jumpDefinition')
    let l:new_tag_index = l:current_tag_index + 1
    let l:new_tag_item = [#{tagname: l:current_tag, from: l:current_position}]
    let l:new_tag_items = l:current_tag_items[:]
    if l:current_tag_index <= len(l:current_tag_items)
      call remove(l:new_tag_items, l:current_tag_index - 1, -1)
    endif
    let l:new_tag_items += l:new_tag_item

    call settagstack(winnr(), #{curidx: l:new_tag_index, items: l:new_tag_items}, 'r')
  endif
endfunction

augroup Coc
  autocmd!
  autocmd FileType c,cpp nnoremap <buffer><silent> gd :call <SID>gotoDefinition()<CR>
augroup end

"自动载入ctags gtags
" if version >= 800
if 0
    ""let $GTAGSLABEL = 'native-pygments'
    ""let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
    let g:gutentags_modules = ['ctags', 'gtags_cscope']
    "gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
    let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
    " 所生成的数据文件的名称 "
    let g:gutentags_ctags_tagfile = '.tags'
    " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
    "
    let s:vim_tags = expand('~/.cache/tags')
    let g:gutentags_cache_dir = s:vim_tags
    " 检测 ~/.cache/tags 不存在就新建 "
    if !isdirectory(s:vim_tags)
       silent! call mkdir(s:vim_tags, 'p')
    endif
    " 配置 ctags 的参数 "
    let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
    let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
    let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
    " forbid gutentags adding gtags databases
    let g:gutentags_auto_add_gtags_cscope = 0
    let g:gutentags_plus_switch = 1
endif
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

" search the highlight words
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>"
