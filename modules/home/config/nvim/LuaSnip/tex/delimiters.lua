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
    -- Delimeters
    s({ trig = "{", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[{<>}]],
            { i(1) }
        )
    ),
    s({ trig = "(", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[(<>)]],
            { i(1) }
        )
    ),
    s({ trig = "[", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ [<>] ]],
            { i(1) }
        )
    ),
    s({ trig = [["]], wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [["<>"]],
            { i(1) }
        )
    ),
    -- s({ trig = [[']], wordTrig = false, snippetType = "autosnippet" },
    --     fmta(
    --         [['<>']],
    --         { i(1) }
    --     )
    -- ),

    -- Big Delimeters
    s({ trig = "lr", wordTrig = false },
        fmta(
            [[\left( <> \right)]],
            { i(1) }
        )
    ),
    s({ trig = "lrs", wordTrig = false },
        fmta(
            [[ \left[ <> \right] ]],
            { i(1) }
        )
    ),
    s({ trig = "lrc", wordTrig = false },
        fmta(
            [[\left\{ <> \right\}]],
            { i(1) }
        )
    ),
    s({ trig = "lra", wordTrig = false },
        fmt(
            [[ \left< () \right> ]],
            { i(1) },
            { delimiters = "()" } -- manually specifying angle bracket delimiters
        )
    ),
    s({ trig = "||", wordTrig = false, snippetType = "autosnippet" },
        fmt(
            [[\left| () \right|]],
            { i(1) },
            { delimiters = "()" } -- manually specifying angle bracket delimiters
        )
    ),

    -- For math environments
    s({ trig = "mk", snippetType = "autosnippet" },
        fmta(
            [[\( <> \)]],
            { i(1) }
        )
    ),
    s({ trig = "dm", snippetType = "autosnippet" },
        fmta(
            [[
             \[
                <>
             \]
         ]],
            { i(1) }
        )
    ),

    -- Exponential and subscript
    s({ trig = "sr", wordTrig = false, snippetType = "autosnippet" }, { t("^2") }, { condition = in_mathzone }),
    s({ trig = "cb", wordTrig = false, snippetType = "autosnippet" }, { t("^3") }, { condition = in_mathzone }),
    s({ trig = "xx", wordTrig = false, snippetType = "autosnippet" }, { t("\\times") }, { condition = in_mathzone }),
    s({ trig = "cd", wordTrig = false, snippetType = "autosnippet" }, { t("\\cdot") }, { condition = in_mathzone }),
    s({ trig = "dag", wordTrig = false, snippetType = "autosnippet" }, { t("^{\\dag}") }, { condition = in_mathzone }),
    s({ trig = "td", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[^{<>}]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "__", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[_{<>}]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "sq", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ \sqrt{<>} ]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),

    s({ trig = "==", wordTrig = false, snippetType = "autosnippet" },
        fmta(
            [[ &= <> \\ ]],
            { i(1) }
        ),
        { condition = in_mathzone }
    ),
    s({ trig = "<=", wordTrig = false, snippetType = "autosnippet" }, { t("\\le") }, { condition = in_mathzone }),
    s({ trig = ">=", wordTrig = false, snippetType = "autosnippet" }, { t("\\ge") }, { condition = in_mathzone }),
}
