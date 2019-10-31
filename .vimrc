 
 call plug#begin('~/.vim/plugged')
 
 " For MS Windows, this is probably better:
 "call plug#begin('~/vimfiles/plugged')
 
 Plug 'vim-airline/vim-airline'
 " ... etc
 
 call plug#end()
 
 " FEATURES TO COVER:
 " - Fuzzy File Search
 " - Tag jumping
 " - Autocomplete
 " - File Browsing
 " - Snippets
 " - Build Integration (if we have time)
 
 " GOALS OF THIS TALK:
 " - Increase Vim understanding
 " - Offer powerful options
 
 " NOT GOALS OF THiS TALK:
 " - Hate on plugins
 " - Get people to stop using plugins
 
 " {{{ BASIC SETUP
 " BASIC SETUP:
 
 " enter the current millenium
 set nocompatible
 
 " enable syntax and plugins (for netrw)
 syntax enable
 filetype plugin on
 
 " FINDING FILES:
 
 " Search down into subfolders
 " Provides tab-completion for all file-related tasks
 set path+=**
 
 " Display all matching files when we tab complete
 set wildmenu
 
 " NOW WE CAN:
 " - Hit tab to :find by partial match
 " - Use * to make it fuzzy
 
 " THINGS TO CONSIDER:
 " - :b lets you autocomplete any open buffer
 
 
 " TAG JUMPING:
 
 " Create the `tags` file (may need to install ctags first)
 command! MakeTags !ctags -R .
 
 " NOW WE CAN:
 " - Use ^] to jump to tag under cursor
 " - Use g^] for ambiguous tags
 " - Use ^t to jump back up the tag stack
 
 " THINGS TO CONSIDER:
 " - This doesn't help if you want a visual list of tags
 
 " AUTOCOMPLETE:
 
 " The good stuff is documented in |ins-completion|
 
 " HIGHLIGHTS:
 " - ^x^n for JUST this file
 " - ^x^f for filenames (works with our path trick!)
 " - ^x^] for tags only
 " - ^n for anything specified by the 'complete' option
 
 " NOW WE CAN:
 " - Use ^n and ^p to go back and forth in the suggestion list
 " FILE BROWSING:
 
 " Tweaks for browsing
 let g:netrw_banner=0        " disable annoying banner
 let g:netrw_browse_split=4  " open in prior window
 let g:netrw_altv=1          " open splits to the right
 let g:netrw_liststyle=3     " tree view
 let g:netrw_list_hide=netrw_gitignore#Hide()
 let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
 
 " NOW WE CAN:
 " - :edit a folder to open a file browser
 " - <CR>/v/t to open in an h-split/v-split/tab
 " - check |netrw-browse-maps| for more mappings
 
 
 " SNIPPETS:
 
 " Read an empty HTML template and move cursor to title
 nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
 
 " NOW WE CAN:
 " - Take over the world!
 "   (with much fewer keystrokes)
 
 " BUILD INTEGRATION:
 
 " Steal Mr. Bradley's formatter & add it to our spec_helper
 " http://philipbradley.net/rspec-into-vim-with-quickfix
 
 " Configure the `make` command to run RSpec
 set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter
 set noshowmode  " to get rid of thing like --INSERT--
 set noshowcmd  " to get rid of display of last command
 "set shortmess+=F  " to get rid of the file name displayed in the command line bar
 " NOW WE CAN:
 " - Run :make to run RSpec
 " - :cl to list errors
 " - :cc# to jump to error by number
 " - :cn and :cp to navigate forward and back
 
 "
 " air-line
  let g:airline_powerline_fonts = 1
 
  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
      endif
 
      " unicode symbols
      let g:airline_left_sep = '»'
      let g:airline_left_sep = '▶'
      let g:airline_right_sep = '«'
      let g:airline_right_sep = '◀'
      let g:airline_symbols.linenr = '␊'
      let g:airline_symbols.linenr = '␤'
      let g:airline_symbols.linenr = '¶'
      let g:airline_symbols.branch = '⎇'
      let g:airline_symbols.paste = 'ρ'
      let g:airline_symbols.paste = 'Þ'
      let g:airline_symbols.paste = '∥'
      let g:airline_symbols.whitespace = 'Ξ'
 
      " airline symbols
      let g:airline_left_sep = ''
      let g:airline_left_alt_sep = ''
      let g:airline_right_sep = ''
      let g:airline_right_alt_sep = ''
      let g:airline_symbols.branch = ''
      let g:airline_symbols.readonly = ''
      let g:airline_symbols.linenr = ''
 
 
 
 " Enable the list of buffers
  let g:airline#extensions#tabline#enabled = 1
 
 
 let g:airline#extensions#tabline#fnamemod = ':t'
 
 
 
 
 
 
 
 
 
 
 
 
 
 
     " airline symbols
 "
 
 
 
 
 
 :nnoremap <F5> :buffers<CR>:buffer<Space>
 "   let g:airline_powerline_fonts = 1
 "fancy symbols
 
 "" airline config
 ""let g:airline_section_z ="%3l/%L:%2v"
 "let g:airline#extensions#bufferline#enabled = 1
 "let g:airline#extensions#bufferline#left_sep = ""
 "let g:airline#extensions#bufferline#right_sep = ""
 "let g:airline#extensions#bufferline#left_alt_sep = ""
 "let g:airline#extensions#bufferline#right_alt_sep = ""
 "let g:airline#extensions#tabline#left_sep = " "
 "let g:airline#extensions#tabline#right_sep = ""
 "let g:airline#extensions#tabline#left_alt_sep = ""
 "let g:airline#extensions#tabline#right_alt_sep = ""
 "let g:airline#extensions#tabline#enabled = 1
 "let g:airline#extensions#tabline#show_tabs = 1
 "let g:airline#extensions#whitespace#enabled = 0
 "let g:airline#extensions#ale#enabled = 1
 
 
 "                          THANK YOU!
 
 "                    Download this file at:
 "                github.com/mcantor/no_plugins
 
 "                Follow me for kitten pictures:
 "                     twitter.com/mcantor
 
 "          Contact me at `max at maxcantor dot net` for:
 "                  - Consulting (Dev and PM)
 "                          - Tutoring
 "                     - Classroom Teaching
 "                     - Internal Training
 "                       - Encouragement
