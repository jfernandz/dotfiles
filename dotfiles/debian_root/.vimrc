""""""""""""""""""""""""""""""""""""""""""
" Init vim-plug plugins (You need to install vim-plug from AUR)
" I don't need another plugin manager and people in IRC did 
" recommended me this one, all plugin manager do basically the
" same.
""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/vim-plug')


""""""""""""""""""""""""""""""""""""""""""
" General purpose plugins
""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-buftabline'
"Plug 'mattn/emmet-vim'
"Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/nerdtree'
"Plug 'mileszs/ack.vim'
"Plug 'vimwiki/vimwiki'
Plug 'itchyny/lightline.vim'
"Plug 'Valloric/YouCompleteMe'
"Plug 'SirVer/ultisnips'
Plug 'cjrh/vim-conda'
Plug 'wakatime/vim-wakatime'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'mg979/vim-visual-multi'
"Plug 'hugolgst/vimsence'

""""""""""""""""""""""""""""""""""""""""""
" Language support
""""""""""""""""""""""""""""""""""""""""""
"Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
"Plug 'tfnico/vim-gradle'
"Plug 'tpope/vim-rails'
"Plug 'tpope/vim-endwise'
"Plug 'alvan/vim-closetag'
"Plug 'racer-rust/vim-racer'
"Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
"Plug 'stevearc/vim-arduino'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
"Plug 'habamax/vim-asciidoctor'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }


""""""""""""""""""""""""""""""""""""""""""
" Colorschemes
""""""""""""""""""""""""""""""""""""""""""
Plug 'morhetz/gruvbox'
"Plug 'jaapie/vim-colours-dusk'
Plug 'flazz/vim-colorschemes'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""
" python-mode
""""""""""""""""""""""""""""""""""""""""""
"let g:pymode_rope = 1
"let g:pymode_rope_completion = 1
"let g:pymode_rope_completion_bind = '<C-Space>'
let g:pymode_preview_position = 'botright'
let g:pymode_options_max_line_length=120


""""""""""""""""""""""""""""""""""""""""""
" Vim-arduino.
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
let g:tex_flavor = 'latex'


""""""""""""""""""""""""""""""""""""""""""
" LigthLine 
""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2
set noshowmode

""""""""""""""""""""""""""""""""""""""""""
" Auto build on save for Asciidoctor files
" It is using `vim-dispatch` (:compiler)
""""""""""""""""""""""""""""""""""""""""""
"augroup ON_ASCIIDOCTOR_SAVE | au!
"	au BufWritePost *.adoc :compiler asciidoctor2html | Make!
"augroup end


"""""""""""""""""""""""""""""""""""""""""
" Markdown plugin
"""""""""""""""""""""""""""""""""""""""""
let g:mkdp_markdown_css = '/home/wyre/MEGA/CONFS/markdown2.css'
"let g:mkdp_highlight_css = '/home/wyre/AUR/CSS_Styles/retro/css/retro.css'


""""""""""""""""""""""""""""""""""""""""""
" My personal configuration parameters for Vim.
" they must be at the end of the file, because
" Vim needs to load first the plugins and then 
" configure them, so ... the first thing in 
" the whole config file is TO LOAD THE PLUGINS
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
"colorscheme molokai
" to powerline properly working
let g:powerline_pycmd = 'py3'
"set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim

" To close warning buffers from pylint
autocmd WinEnter * if winnr('$') == 1 && ! empty(&buftype) && ! &modified | quit | endif


"""""""""""""""""""""
" Comment the following to prevent Vim jump to the last position when                                                       
" reopening a file see `:h last-position-jump`
"""""""""""""""""""""
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"""""""""""""""""""""
" Spell settings
"""""""""""""""""""""
setlocal spell spelllang=en,es
set nospell

"""""""""""""""""""""
" Key mapping to move lines up or down
"""""""""""""""""""""
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
inoremap <A-Up> <Esc>:m .-2<CR>==gi
inoremap <A-Down> <Esc>:m .+1<CR>==gi
vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

"""""""""""""""""""""
" Visual Multi keybindings
" You can check: https://github.com/mg979/vim-visual-multi/wiki/Mappings#customization
"""""""""""""""""""""
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
