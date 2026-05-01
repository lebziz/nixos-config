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
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	s(
		{ trig = "ali", dscr = "align*", priority = 10000 },
		fmta(
			[[ 
            \begin{align*}
                <>
            \end{align*}
         ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "case", dscr = "cases", priority = 10000 },
		fmta(
			[[ 
          \begin{cases}
              <>
          \end{cases}
         ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "beg", dscr = "begin", snippetType = "autosnippet" },
		fmta(
			[[ 
            \begin{<>}
                <>
            \end{<>}
         ]],
			{ i(1), i(2), rep(1) }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "itm", dscr = "item", snippetType = "autosnippet" },
		fmta(
			[[ 
            \begin{itemize}
                \item <>
            \end{itemize}
         ]],
			{ i(1) }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "enm", dscr = "enumerate", snippetType = "autosnippet" },
		fmta(
			[[ 
            \begin{enumerate}
                \item <>
            \end{enumerate}
         ]],
			{ i(1) }
		),
		{ condition = line_begin }
	),
	s(
		{ trig = "eqn", dscr = "equation" },
		fmta(
			[[ 
            \begin{equation}
                <>
            \end{equation}
         ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "fig", dscr = "figure" },
		fmta(
			[[ 
            \begin{figure}[H]
                \centering
                \includegraphics[width=<>\textwidth]{<>}
            \end{figure}
         ]],
			{ i(1), i(2) }
		)
	),
	s(
		{ trig = "tab", dscr = "table" },
		fmta(
			[[ 
            \begin{table}[H]
                \begin{center}
                    \begin{tabular}{<>}
                        <>
                    \end{tabular}
                \begin{center}
            \end{table}
         ]],
			{ i(1), i(2) }
		)
	),
	s(
		{ trig = "mini", dscr = "minipage" },
		fmta(
			[[ 
            \begin{minipage}{<>\textwidth}
                \includegraphics[width=<>\textwidth]{<>}
            \end{minipage}
         ]],
			{ i(1), i(2), i(3) }
		)
	),
}
