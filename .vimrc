                                                                                                                                                                                                                                                                                           buffers 
  1 
  2 call plug#begin('~/.vim/plugged')
  3 
  4 " For MS Windows, this is probably better:
  5 "call plug#begin('~/vimfiles/plugged')
  6 
  7 Plug 'vim-airline/vim-airline'
  8 " ... etc
  9 
 10 call plug#end()
 11 
 12 " FEATURES TO COVER:
 13 " - Fuzzy File Search
 14 " - Tag jumping
 15 " - Autocomplete
 16 " - File Browsing
 17 " - Snippets
 18 " - Build Integration (if we have time)
 19 
 20 " GOALS OF THIS TALK:
 21 " - Increase Vim understanding
 22 " - Offer powerful options
 23 
 24 " NOT GOALS OF THiS TALK:
 25 " - Hate on plugins
 26 " - Get people to stop using plugins
 27 
 28 " {{{ BASIC SETUP
 29 " BASIC SETUP:
 30 
 31 " enter the current millenium
 32 set nocompatible
 33 
 34 " enable syntax and plugins (for netrw)
 35 syntax enable
 36 filetype plugin on
 37 
 38 " FINDING FILES:
 39 
 40 " Search down into subfolders
 41 " Provides tab-completion for all file-related tasks
 42 set path+=**
 43 
 44 " Display all matching files when we tab complete
 45 set wildmenu
 46 
 47 " NOW WE CAN:
 48 " - Hit tab to :find by partial match
 49 " - Use * to make it fuzzy
 50 
 51 " THINGS TO CONSIDER:
 52 " - :b lets you autocomplete any open buffer
 53 
 54 
 55 " TAG JUMPING:
 56 
 57 " Create the `tags` file (may need to install ctags first)
 58 command! MakeTags !ctags -R .
 59 
 60 " NOW WE CAN:
 61 " - Use ^] to jump to tag under cursor
 62 " - Use g^] for ambiguous tags
 63 " - Use ^t to jump back up the tag stack
 64 
 65 " THINGS TO CONSIDER:
 66 " - This doesn't help if you want a visual list of tags
 67 
 68 " AUTOCOMPLETE:
 69 
 70 " The good stuff is documented in |ins-completion|
 71 
 72 " HIGHLIGHTS:
 73 " - ^x^n for JUST this file
 74 " - ^x^f for filenames (works with our path trick!)
 75 " - ^x^] for tags only
 76 " - ^n for anything specified by the 'complete' option
 77 
 78 " NOW WE CAN:
 79 " - Use ^n and ^p to go back and forth in the suggestion list
 80 " FILE BROWSING:
 81 
 82 " Tweaks for browsing
 83 let g:netrw_banner=0        " disable annoying banner
 84 let g:netrw_browse_split=4  " open in prior window
 85 let g:netrw_altv=1          " open splits to the right
 86 let g:netrw_liststyle=3     " tree view
 87 let g:netrw_list_hide=netrw_gitignore#Hide()
 88 let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
 89 
 90 " NOW WE CAN:
 91 " - :edit a folder to open a file browser
 92 " - <CR>/v/t to open in an h-split/v-split/tab
 93 " - check |netrw-browse-maps| for more mappings
 94 
 95 
 96 " SNIPPETS:
 97 
 98 " Read an empty HTML template and move cursor to title
 99 nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
100 
101 " NOW WE CAN:
102 " - Take over the world!
103 "   (with much fewer keystrokes)
104 
105 " BUILD INTEGRATION:
106 
107 " Steal Mr. Bradley's formatter & add it to our spec_helper
108 " http://philipbradley.net/rspec-into-vim-with-quickfix
109 
110 " Configure the `make` command to run RSpec
111 set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter
112 set noshowmode  " to get rid of thing like --INSERT--
113 set noshowcmd  " to get rid of display of last command
114 "set shortmess+=F  " to get rid of the file name displayed in the command line bar
115 " NOW WE CAN:
116 " - Run :make to run RSpec
117 " - :cl to list errors
118 " - :cc# to jump to error by number
119 " - :cn and :cp to navigate forward and back
120 
121 "
122 " air-line
123  let g:airline_powerline_fonts = 1
124 
125  if !exists('g:airline_symbols')
126      let g:airline_symbols = {}
127      endif
128 
129      " unicode symbols
130      let g:airline_left_sep = '»'
131      let g:airline_left_sep = '▶'
132      let g:airline_right_sep = '«'
133      let g:airline_right_sep = '◀'
134      let g:airline_symbols.linenr = '␊'
135      let g:airline_symbols.linenr = '␤'
136      let g:airline_symbols.linenr = '¶'
137      let g:airline_symbols.branch = '⎇'
138      let g:airline_symbols.paste = 'ρ'
139      let g:airline_symbols.paste = 'Þ'
140      let g:airline_symbols.paste = '∥'
141      let g:airline_symbols.whitespace = 'Ξ'
142 
143      " airline symbols
144      let g:airline_left_sep = ''
145      let g:airline_left_alt_sep = ''
146      let g:airline_right_sep = ''
147      let g:airline_right_alt_sep = ''
148      let g:airline_symbols.branch = ''
149      let g:airline_symbols.readonly = ''
150      let g:airline_symbols.linenr = ''
151 
152 
153 
154 " Enable the list of buffers
155  let g:airline#extensions#tabline#enabled = 1
156 
157 
158 let g:airline#extensions#tabline#fnamemod = ':t'
159 
160 
161 
162 
163 
164 
165 
166 
167 
168 
169 
170 
171 
172 
173     " airline symbols
174 "
175 
176 
177 
178 
179 
180 :nnoremap <F5> :buffers<CR>:buffer<Space>
181 "   let g:airline_powerline_fonts = 1
182 "fancy symbols
183 
184 "" airline config
185 ""let g:airline_section_z ="%3l/%L:%2v"
186 "let g:airline#extensions#bufferline#enabled = 1
187 "let g:airline#extensions#bufferline#left_sep = ""
188 "let g:airline#extensions#bufferline#right_sep = ""
189 "let g:airline#extensions#bufferline#left_alt_sep = ""
190 "let g:airline#extensions#bufferline#right_alt_sep = ""
191 "let g:airline#extensions#tabline#left_sep = " "
192 "let g:airline#extensions#tabline#right_sep = ""
193 "let g:airline#extensions#tabline#left_alt_sep = ""
194 "let g:airline#extensions#tabline#right_alt_sep = ""
195 "let g:airline#extensions#tabline#enabled = 1
196 "let g:airline#extensions#tabline#show_tabs = 1
197 "let g:airline#extensions#whitespace#enabled = 0
198 "let g:airline#extensions#ale#enabled = 1
199 
200 
201 "                          THANK YOU!
202 
203 "                    Download this file at:
204 "                github.com/mcantor/no_plugins
205 
206 "                Follow me for kitten pictures:
207 "                     twitter.com/mcantor
208 
209 "          Contact me at `max at maxcantor dot net` for:
210 "                  - Consulting (Dev and PM)
211 "                          - Tutoring
212 "                     - Classroom Teaching
213 "                     - Internal Training
214 "                       - Encouragement
215 
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                                                                                                                                                                            
~                                                                                                                                                
