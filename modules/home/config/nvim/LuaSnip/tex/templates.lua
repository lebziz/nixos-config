local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
return {
    s({trig="TEMP",dscr="Template"},
      fmt(
         [[ 
            \documentclass[a4paper]{()}

            \usepackage{graphicx}
            \usepackage{amsmath, amssymb}
            \usepackage{gensymb}
            \usepackage{hyperref}
            \usepackage{float}

            \usepackage[margin=0.5in]{geometry}

            \newcommand{\ket}[1]{%
                \bigl| #1 \bigr>
            }
            \newcommand{\bra}[1]{%
                \bigl< #1 \bigr|
            }
            \newcommand{\braket}[2]{%
                \bigl< #1 \bigr| #2 \bigr>
            }
            \newcommand{\ketbra}[2]{%
                \bigl| #1 \bigr> \bigl< #2 \bigr|
            }
            \title{()}
            \author{Ganesh Arvindh Ramanan}
            \date{()}
            
            \begin{document}
            \maketitle
            ()
            \end{document}
         ]],
         { i(1), i(2), i(3), i(4) },
         {delimiters = "()"} -- manually specifying angle bracket delimiters
      )
    ),
    s({trig="BEAM",dscr="Beamer Template"},
      fmt(
         [[ 
            \documentclass[aspectratio=169]{beamer}
            \usefonttheme{serif} 
            \usetheme{()} % RED: CambridgeUS, GREEN: EastLansing, BLUE: Copenhagen
            \useinnertheme{rectangles}

            \usepackage{float}
            \usepackage{graphicx}
            \usepackage{amsmath, amssymb}
            \usepackage{gensymb}
            \usepackage{hyperref}

            \title{()}
            \author{Ganesh Arvindh Ramanan}
            \date{\today}
            \begin{document}
            \maketitle
            ()
            \end{document}
         ]],
         { i(1, "EastLansing"), i(2), i(3)},
         {delimiters = "()"} -- manually specifying angle bracket delimiters
      )
    ),
}
