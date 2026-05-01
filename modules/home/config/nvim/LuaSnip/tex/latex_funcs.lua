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
    -- Latex functions
    s({trig="//",wordTrig=false,snippetType="autosnippet"},
      fmta(
         [[\frac{<>}{<>}]],
         { i(1), i(2) }
      ),
      {condition=in_mathzone}
    ),
    s({trig="bf",wordTrig=false,snippetType="autosnippet"},
      fmta(
         [[\mathbf{<>}]],
         { i(1) }
      ),
      {condition=in_mathzone}
    ),
    s({trig="cal",wordTrig=false,snippetType="autosnippet"},
      fmta(
         [[\mathcal{<>}]],
         { i(1) }
      ),
      {condition=in_mathzone}
    ),
    s({trig="tt",wordTrig=false,snippetType="autosnippet"},
      fmta(
         [[\text{<>}]],
         { i(1) }
      ),
      {condition=in_mathzone}
    ),
    s({trig="rm",wordTrig=false,snippetType="autosnippet"},
      fmta(
         [[\mathrm{<>}]],
         { i(1) }
      ),
      {condition=in_mathzone}
    ),
    s({trig="bb",wordTrig=false,snippetType="autosnippet"},
      fmta(
         [[\mathbb{<>}]],
         { i(1) }
      ),
      {condition=in_mathzone}
    ),
}
