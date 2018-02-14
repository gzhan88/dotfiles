"" dein.vim
let s:dein_dir = expand('~/.vim/rc')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

syntax on
set encoding=utf-8
set number
set cursorline
set wrap
set wrapscan
set showmatch
set hlsearch
set laststatus=2
set tabstop=4
set shiftwidth=4
set nobackup
set noswapfile
set backspace=indent,eol,start
"for cron
set backupskip=/tmp/*,/private/tmp/*
set smarttab
set expandtab
set clipboard+=autoselect
set clipboard+=unnamed

"markdown
vnoremap <leader>mdu ygvs[](<c-r>")<esc>?[]<cr>a
