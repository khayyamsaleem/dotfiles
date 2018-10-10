set nocompatible              " be iMproved, required
let g:ycm_path_to_python_interpreter="/usr/bin/python"

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'chrisbra/Colorizer'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'wlangstroth/vim-racket'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lervag/vimtex'
Plug 'vim-scripts/promela'
Plug 'vim-syntastic/syntastic'


call plug#end()

syntax enable
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set autoindent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set number
set cursorline
set wildmenu
set showmatch
set incsearch
set hlsearch
set scrolloff=1
set undofile
colorscheme tomorrow-night-eighties

" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>
" nnoremap <Left>  <NOP>
" nnoremap <Right> <NOP>
" nnoremap <Up>    <NOP>
" nnoremap <Down>  <NOP>

map <C-n> :NERDTreeToggle<CR>
" open nerdtree on start
" autocmd vimenter * NERDTree
" autocmd vimenter * wincmd p

 " close nerdtree if its the only window left
 " breaks on standard vim
 if has('nvim')
     autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 endif

let g:airline_theme='bubblegum'
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

hi Normal guibg=NONE ctermbg=NONE

autocmd! BufWritePost * Neomake " run neomake on write
set guifont=Sauce_Code_Powerline:h11
let g:airline_powerline_fonts = 1
if has("gui_running")
  syntax on
  set hlsearch
  colorscheme tomorrow-night-eighties
  set bs=2
  set ai
  set ruler
endif
let g:livepreview_previewer = 'evince'

cnoreabbrev lat LLPStartPreview
set mouse=a
let g:neomake_cpp_gcc_args = ['-std=c++11', '-Wall', '-Wextra', '-Werror', ['-pedantic']]
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
execute "helptags " . substitute(system('opam config var share'),'\n$','','''') .  "/merlin/vim/doc"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ocaml_checkers = ['merlin']


" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## 0c7ccd80b9402756984390c340054fae ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/khayyamsaleem/.opam/4.05.0/share/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
