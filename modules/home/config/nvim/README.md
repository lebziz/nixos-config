# My_nvim_config
My neovim configuration.

# Credits
- I am using luasnip for my snippets.
- I draw significant inspiration from Gilles Castel's work. I have modified Gilles Castel's ultisnip syntaxed snippet file to a luasnip syntaxed snippet file in order to implement it in my setup.

# Usage
+ Clone the repository into ~/.config and rename the newly created directory to "nvim".
+ Create your equivalent preamble files corresponding to paths referenced in after/ftplugin/c.vim and after/ftplugin/tex.vim and change the existing path definitions in those files to match the paths of your newly created preamble files accordingly.
+ Open init.vim using nvim
+ Run :Lazy and (I)nstall all plugins.

# Preview
![alt text](https://raw.githubusercontent.com/Vizkid04/My_nvim_config/master/Screenshot_preview.png)
![alt text](https://raw.githubusercontent.com/Vizkid04/My_nvim_config/master/Screenshot_preview2.png)

# Requirements for full functionality
+ Neovim 0.9 or above
+ Lazy plugin managemen
+ texlive full suite
+ Rust standard libraries (optional: not needed if you do not want to write code in rust)
+ basedpyright (optional: not needed if you do not want language support for python)
+ texlab (optional: not needed if you do not want language support for latex)
+ clangd (optional: not needed if you do not want language support for c/cpp)
+ rust-analyzer (optional: Not needed if you do not want language support for rust)
+ fortls (optional: not needed if you do not want language support for Fortran)
+ julials (optional: not needed if you do not want language support for julia)
+ tinymist (optional: not needed if you do not want language support for typst)
+ vs code's html/css/js/ts language servers (optional: not needed if you do not want language support for htnl/css/js/ts)
+ okular pdf viewer (optional: you can modify the config file easily to accomodate for other pdf viewers for writing latex)

# To Do List
- Adding latex inkscape support.
- Making pgfplots and tikz libraries' latex workflow incredibly fast.
- Improving the typst setup to make workflow robust, efficient and easy.
