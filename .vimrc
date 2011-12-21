" vimrc for jake@home
" Last updated: 2009-01-23

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Put those pesky swap and backup files elsewhere
set directory=~/.vim/swap//
set backupdir=~/.vim/backup//

set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set ignorecase          " ignore case when searching
set wrap
set formatoptions=1
set lbr                 " intelligent word wrap
set nu                  " enable line numbers
set encoding=utf8
set t_Co=256            " 256 colours
set autoindent
set fdm=marker          " use fold markers ie {{{ }}}

" Colours
set background=dark
colorscheme solarized

" show invisibles:
set list
set listchars=trail:·

" tabs:
set tabstop=4           " (ts)
set softtabstop=4       " (sts) Turned off with 0
set shiftwidth=4        " (sw)  Used for autoindent, and << and >>
set expandtab           " (et)  Expand tabs to spaces

" GVIM settings
set guioptions-=T        " Disable toolbar
set guioptions-=m        " Disable file menu

syntax on
"au FileType * setl fo+=cro " enable auto comments
"hi Comment ctermfg=blue	" make comments blue

let javascript_enable_domhtmlcss=1
" Special for Javascript 
" TODO:  - Add colors to the cterm 
"hi javaScriptBrowserObjects       guifg=#DBB6D2 ctermfg=182   gui=italic 
"
"hi javaScriptDOMObjects           guifg=#DBB6D2 gui=BOLD 
"hi javaScriptDOMMethods           guifg=#D4FA9B ctermfg=192 
"hi link javaScriptDOMProperties   Keyword 
"
"hi javaScriptAjaxObjects          guifg=#5d91d3 gui=underline 
"hi javaScriptAjaxMethods          guifg=#6699CC ctermfg=68 
"hi javaScriptAjaxProperties       guifg=#FF9494 ctermfg=210 
"
"hi javaScriptFuncName             guifg=#B5E4F7 ctermfg=153 
"hi javaScriptHtmlElemProperties   guifg=#FF9494 ctermfg=210 
"hi javaScriptEventListenerKeyword guifg=#6699CC ctermfg=68 

"make netrw sync its working directory with vim
let g:netrw_keepdir = 0
