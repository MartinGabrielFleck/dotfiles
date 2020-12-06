"Highlight search matches with an underscore (this is nice because it keeps
"the matched text very readable still)
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline


" #################################### vimplug ####################################
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
"ultisnips plugin
Plug 'SirVer/ultisnips'
"default ultisnips snippets
Plug 'honza/vim-snippets'
" latex snippets like vim-latex-suite
" Plug 'kiryph/vim-snippets' 
" Plug 'dart-lang/dart-vim-plugin'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tpope/vim-surround'
" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'nanotech/jellybeans.vim'
call plug#end()

colorscheme jellybeans

" with vim-airline: do not show mode (inser / visual / normal / replace)
set noshowmode

"" ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"" ctrlp plugin:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" #################################### end vimplug ####################################

" ########## legacy vim stuff ##########
set nocompatible
" set guifont=Anonymous\ Pro\ 13
" set guifont=Source\ Code\ Pro\ Light\ 12
behave xterm
set encoding=utf8
" ########## legacy vim stuff ##########

"save with ctrl+s
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <ESC>:update<CR>gi
silent
" copy paste with ctrl+c, ctrl-v. Yank and paste to/from system register:
nnoremap <C-c> "+y
vnoremap <C-c> "+y
inoremap <C-c> "+y

"normal paste
":inoremap <C-v> <C-o>"+p
:inoremap <C-v> <C-R>+
:nnoremap <C-v> "+p
:vnoremap <C-v> "+p

" Quick save
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>

" Search for files with fzf
nmap <silent> <leader>f :FZF<cr>

"Clear highlights
nmap <silent> <leader>] :noh<cr>

" split windows
map <leader>- <C-W>s
map <leader><leader> <C-W>v
" Move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set nobackup

set number                     " Show current line number
set relativenumber             " Show relative line numbers
set numberwidth=1

syntax on

" map control-backspace to delete the previous word
:imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
inoremap <C-w> <C-\><C-o>dB
inoremap <C-BS> <C-\><C-o>db

" Kein blinkender Cursor
set gcr=a:blinkon0

" Während der Eingabe zum entsprechenden Text springen
set incsearch

" ignore case for searching (ignorecase). Case sensitive, if at least one character is uppercase (smartcase)
set ignorecase
set smartcase

" Keep cursor centered vertically on the screen
set scrolloff=999

" toggle scrolloff behavior
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" Don't always create *.un~ file that saves undo informatoin
set noundofile

set viewoptions=folds,cursor
au BufWinLeave * mkview
au BufWinEnter * silent! loadview	"automatisch Folds (und nur Folds + cursorposition wegen  set viewoptions=folds,cursor ) speichern und laden wenn datei geschlossen wird

" move through wrapped lines
":noremap j gj
":noremap k gk

" paste without change of cursor position
:noremap p p`[

" auto completion of names when using e.g. :e for switching between files
set wildmode=longest,list,full
set wildmenu

" Prevent Vim from clearing the clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

let g:tex_flavor='latex'

filetype plugin on

syntax spell toplevel	"fixing a bug i experienced: Spell check was only enabeld for comments in latex files
set spelllang=en
let g:tex_comment_nospell=1

" always enable gvim option 'show filetypes in menu' that allows to choose syntax highlight language. Saves one click
let do_syntax_sel_menu = 1
runtime! synmenu.vim

" disbale arrow keys
nnoremap <Left> <nop>
vnoremap <Left> <nop>
inoremap <Left> <nop>
nnoremap <Right> <nop>
vnoremap <Right> <nop>
inoremap <Right> <nop>
nnoremap <Up> <nop>
vnoremap <Up> <nop>
inoremap <Up> <nop>
nnoremap <Down> <nop>
vnoremap <Down> <nop>
inoremap <Down> <nop>


"Rather than failing a command!, ask for confirmation
set confirm

"In gvim, don't open a dialog box when asking for confirmation
set guioptions+=c

"Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
xnoremap <leader>p "+p
xnoremap <leader>P "+P

"Automagically resize splits when the host is resized
autocmd VimResized * wincmd =

"Wrap options
set wrap
set linebreak
set display+=lastline

"Make basic movements work better with wrapped lines
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" Ctrl+j is a special key in terminals. Thus <c-j> is usable in vim 
let g:BASH_Ctrl_j = 'off'

" Spellcheck in Latex:
autocmd FileType tex set spell
autocmd FileType tex setlocal shiftwidth=2

"Syntax highlighting for rare file extensions
au BufNewFile,BufRead *.ctl set filetype=c

" default comment symbol in unkown filetypes
let Comment='#'


let skip_defaults_vim=1


" COC suggested vi configuration:
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif

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

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" " Remap <C-f> and <C-b> for scroll float windows/popups.
" " Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" " NeoVim-only mapping for visual mode scroll
" " Useful on signatureHelp after jump placeholder of snippet expansion
" if has('nvim')
"   vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
"   vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
" endif

" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)

" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')

" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" Highlight of spellcheck
hi SpellBad cterm=underline ctermbg=NONE ctermfg=NONE " ctermfg=red if using tmux. Kitty is able to underline in red

" Alle Suchtreffer farblich hervorheben 
set hlsearch

" Always use vertical diffs
set diffopt+=vertical
"
" Switch between the last two files
nnoremap <Leader>s <C-^>

map <space> <leader>

