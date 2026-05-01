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
    -- Trig and friends
    s({ trig = "sin", wordTrig = false, snippetType = "autosnippet" }, { t("\\sin") }, { condition = in_mathzone }),
    s({ trig = "cos", wordTrig = false, snippetType = "autosnippet" }, { t("\\cos") }, { condition = in_mathzone }),
    s({ trig = "tan", wordTrig = false, snippetType = "autosnippet" }, { t("\\tan") }, { condition = in_mathzone }),
    s({ trig = "cot", wordTrig = false, snippetType = "autosnippet" }, { t("\\cot") }, { condition = in_mathzone }),
    s({ trig = "ln", wordTrig = false, snippetType = "autosnippet" }, { t("\\ln") }, { condition = in_mathzone }),
    s({ trig = "log", wordTrig = false, snippetType = "autosnippet" }, { t("\\log") }, { condition = in_mathzone }),
    s({ trig = "exp", wordTrig = false, snippetType = "autosnippet" }, { t("\\exp") }, { condition = in_mathzone }),
    s({ trig = "int", wordTrig = false, snippetType = "autosnippet", priority=100 }, { t("\\int") }, { condition = in_mathzone }),
    s({ trig = "oo", wordTrig = false, snippetType = "autosnippet" }, { t("\\infty") }, { condition = in_mathzone }),

    -- Calculus
    s({ trig = "dint", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ \int_{<>}^{<>} ]],
            { i(1, [[-\infty]]), i(2, [[\infty]]) }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "dv", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ \frac{\mathrm{d}<>}{\mathrm{d}<>} ]],
            { i(1), i(2) }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "part", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ \frac{\partial <>}{\partial <>} ]],
            { i(1), i(2) }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "sum", wordTrig = false }, { t("\\sum") }, { condition = in_mathzone }),
    s({ trig = "sumt", wordTrig = false },
        fmta(
            [[ \sum_{<>=<>}^{<>} ]],
            { i(1, [[n]]), i(2, [[0]]), i(3, [[\infty]]) }
        ),
        { condition = in_mathzone }
    ),

    -- Quantum
    s({ trig = "ket", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ \ket{<>} ]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "bra", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ \bra{<>} ]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "inp", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ \braket{<>}{<>} ]],
            { i(1), i(2) }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "oup", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ \ketbra{<>}{<>} ]],
            { i(1), i(2) }
        ),
        { condition = in_mathzone }
    ),

    -- Math symbols
    s({ trig = "AA", wordTrig = false, snippetType = "autosnippet" }, { t("\\forall") }, { condition = in_mathzone }),
}
