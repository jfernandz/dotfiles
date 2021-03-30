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
Plug 'tpope/vim-dispatch'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'SirVer/ultisnips'
Plug 'cjrh/vim-conda'
Plug 'wakatime/vim-wakatime'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'mg979/vim-visual-multi'
Plug 'hugolgst/vimsence'

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
"Plug 'stevearc/vim-arduino'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'habamax/vim-asciidoctor'
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }


""""""""""""""""""""""""""""""""""""""""""
" Colorschemes
""""""""""""""""""""""""""""""""""""""""""
Plug 'morhetz/gruvbox'
Plug 'jaapie/vim-colours-dusk'
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
augroup ON_ASCIIDOCTOR_SAVE | au!
	au BufWritePost *.adoc :compiler asciidoctor2html | Make!
augroup end


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
let g:VM_maps["Select Cursor Down"] = '<S-C-Down>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<S-C-Up>'        " start selecting up

"""""""""""""""""""""
" CoC config
"""""""""""""""""""""
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" I have first to disable mapping to not break coc.nvim (I don't even use them anyways)
let g:endwise_no_mappings = 1
" see https://github.com/neoclide/coc.nvim/issues/617
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
