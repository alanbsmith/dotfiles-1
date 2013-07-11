set rtp+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

"" ==========  These come from Mislav (http://mislav.uniqpath.com/2011/12/vim-revisited/)  ==========
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

"" ==========  Pathogen, vim path manager (https://github.com/tpope/vim-pathogen#readme)  ==========
call pathogen#infect()

"" ==========  Powerline, toolbar (https://github.com/Lokaltog/vim-powerline/) ==========
let g:Powerline_colorscheme = 'josh'
let g:Powerline_symbols = 'compatible'
let g:Powerline_stl_path_style = 'relative'
set laststatus=2   " Always show the statusline
set t_Co=256       " Explicitly tell vim that the terminal supports 256 colors

" got this list from here: https://github.com/Lokaltog/vim-powerline/blob/c4b72c5be57b165bb6a89d0b8a974fe62c0091d0/autoload/Powerline/Themes/default.vim
call Pl#Theme#RemoveSegment('fugitive:branch')
call Pl#Theme#RemoveSegment('syntastic:errors')
call Pl#Theme#RemoveSegment('fileformat')
call Pl#Theme#RemoveSegment('fileencoding')
call Pl#Theme#RemoveSegment('filetype')
call Pl#Theme#RemoveSegment('lineinfo')

"" ========== NERDTree  ==========
" autocmd vimenter * if !argc() | NERDTree | endif  " load NERDTree automatically if started with no files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif " close vim if NERDTree is the only open buffer

"" ========== C-p ==========
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|coverage)$',
  \ }
  " \ 'file': '\v\.(exe|so|dll)$',
  " \ 'link': 'some_bad_symbolic_links',


"" ========== vim-textobj-rubyblock ==========
runtime macros/matchit.vim " a dependency

"" ==========  My shit  ==========
colorscheme Autumn

set nobackup                                        " no backup files
set nowritebackup                                   " only in case you don't want a backup file while editing
set noswapfile                                      " no swap files
set scrolloff=4                                     " adds top/bottom buffer between cursor and window
set cursorline                                      " colours the line the cursor is on
set number                                          " line numbers
nmap <Leader>p orequire "pry"<CR>binding.pry<ESC>;  " pry insertion
vnoremap . :norm.<CR>                               " in visual mode, "." will for each line, go into normal mode and execute the "."

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Emacs/Readline keybindings for commandline mode
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>


"" :set guifont=Monaco:h14

"" filetypes
au  BufRead,BufNewFile *.rabl setfiletype ruby    " .rabl -> ruby

"" strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" replaces %/ with current directory, and %% with current file
cmap %/ <C-R>=expand("%:p:h")."/"<CR>
cmap %% <C-R>=expand("%")<CR>


" .vm, from TECS, should be highlighted with assembly
au BufNewFile,BufRead *.vm set filetype=asm
au BufNewFile,BufRead *.jack set filetype=java "not really, but close enough

" ========== Pathogen plugins ==========
"
" Color-Sampler-Pack
" ZoomWin
" ack.vim
" ctrlp.vim
" nerdcommenter
" nerdtree
" supertab
" vim-coffee-script
" vim-commentary
" vim-cucumber
" vim-endwise
" vim-fish-script
" vim-fugitive
" vim-haml
" vim-haskell
" vim-javascript
" vim-markdown
" vim-powerline
" vim-repeat
" vim-rspec
" vim-ruby
" vim-speeddating
" vim-surround
" vim-textobj-rubyblock
" vim-textobj-user