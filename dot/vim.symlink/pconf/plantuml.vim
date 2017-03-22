Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
  \  matchlist(system('grep plantuml.jar /usr/local/bin/plantuml'), '\v.* (\S+plantuml\.jar).*'),
  \  1,
  \  0
  \)
