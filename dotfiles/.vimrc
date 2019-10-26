""""""""""""""""""""""""""""""""""""""""""
" My personal configs parameters for vim.
""""""""""""""""""""""""""""""""""""""""""

" to edit cfg file with '\init' command
nnoremap <Leader>init :e<Space>~/.vimrc<CR>
set number
set relativenumber
set ignorecase
"set clipboard=unnamed
set clipboard=unnamedplus
set listchars+=space:␣ 
set nowrap
set cursorline
set cursorcolumn
"colorscheme solarized
colorscheme cobalt
" to powerline properly working
let g:powerline_pycmd = 'py3'
"set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim




""""""""""""""""""""""""""""""""""""""""""
" Init vim-plug plugins
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/my_plugins')
""""""""""""""""""""""""""""""""""""""""""
" General purpose plugins
""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-buftabline'
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'SirVer/ultisnips'
Plug 'cjrh/vim-conda'
Plug 'wakatime/vim-wakatime'
"Plug 'dhruvasagar/vim-table-mode'
""""""""""""""""""""""""""""""""""""""""""
" Language support
""""""""""""""""""""""""""""""""""""""""""
Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag'
Plug 'racer-rust/vim-racer'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'stevearc/vim-arduino'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
""""""""""""""""""""""""""""""""""""""""""
" Colorschemes
""""""""""""""""""""""""""""""""""""""""""
Plug 'morhetz/gruvbox'
Plug 'jaapie/vim-colours-dusk'
call plug#end()




""""""""""""""""""""""""""""""""""""""""""
" vim-arduino.
""""""""""""""""""""""""""""""""""""""""""
let g:arduino_cmd = '/usr/share/arduino/arduino'
let g:arduino_dir = '/usr/share/arduino'
let g:arduino_args = '--verbose-upload'
"let g:arduino_board = 'arduino:avr:mega:cpu=atmega2560'
"let g:arduino_programmer = 'arduino:usbtinyisp'
let g:arduino_serial_cmd = 'screen /dev/ttyACM0 9600'
"let g:arduino_serial_cmd = 'LC_ALL=C tmux /dev/ttyACM0 9600'        " Apparently tmux does not support serial connections.
"let g:arduino_serial_cmd = 'picocom /dev/ttyACM0 -b 9600 -l'        " You can use the multiplexer you want.
let g:arduino_serial_baud = '9600'
let g:arduino_auto_baud = 1
"let g:arduino_serial_tmux = 'split-window -d'
let g:arduino_serial_port = '/dev/ttyACM0'




""""""""""""""""""""""""""""""""""""""""""
" VimTex
""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_automatic = 0




""""""""""""""""""""""""""""""""""""""""""
" LigthLine 
""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
