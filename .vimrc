execute pathogen#infect()

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

set number
syntax on
colorscheme monokai
filetype plugin indent on
highlight ColorColumn ctermbg=gray
set colorcolumn=80
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set tabstop=2 shiftwidth=2 expandtab

filetype plugin on
filetype indent on

autocmd FileType htm,html,php,css setl ts=2 sw=2 sts=2 et
autocmd FileType make setlocal noexpandtab
autocmd FileType c,h,cpp set tabstop=2|set shiftwidth=2|set expandtab
autocmd BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

nnoremap <C-F> :FZF  <CR>
nnoremap <C-B> :Gblame <CR>
noremap <F5> :set list!<CR>
inoremap <F5> <C-o>:set list!<CR>
cnoremap <F5> <C-c>:set list!<CR>
