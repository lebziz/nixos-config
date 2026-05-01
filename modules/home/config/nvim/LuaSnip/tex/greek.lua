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
    s({trig=";a", wordTrig=false, snippetType="autosnippet"}, {t("\\alpha")}, {condition = in_mathzone}),
    s({trig=";A", wordTrig=false, snippetType="autosnippet"}, {t("\\Alpha")},{condition=in_mathzone}),

    s({trig=";b", wordTrig=false, snippetType="autosnippet"}, {t("\\beta")},{condition=in_mathzone}),
    s({trig=";B", wordTrig=false, snippetType="autosnippet"}, {t("\\Beta")},{condition=in_mathzone}),

    s({trig=";g", wordTrig=false, snippetType="autosnippet"}, {t("\\gamma")},{condition=in_mathzone}),
    s({trig=";G", wordTrig=false, snippetType="autosnippet"}, {t("\\Gamma")},{condition=in_mathzone}),

    s({trig=";d", wordTrig=false, snippetType="autosnippet"}, {t("\\delta")},{condition=in_mathzone}),
    s({trig=";D", wordTrig=false, snippetType="autosnippet"}, {t("\\Delta")},{condition=in_mathzone}),

    s({trig=";e", wordTrig=false, snippetType="autosnippet"}, {t("\\epsilon")},{condition=in_mathzone}),
    s({trig=";E", wordTrig=false, snippetType="autosnippet"}, {t("\\Epsilon")},{condition=in_mathzone}),

    s({trig=";z", wordTrig=false, snippetType="autosnippet"}, {t("\\zeta")},{condition=in_mathzone}),
    s({trig=";Z", wordTrig=false, snippetType="autosnippet"}, {t("\\Zeta")},{condition=in_mathzone}),

    s({trig=";h", wordTrig=false, snippetType="autosnippet"}, {t("\\eta")},{condition=in_mathzone}),
    s({trig=";H", wordTrig=false, snippetType="autosnippet"}, {t("\\Eta")},{condition=in_mathzone}),

    s({trig=";q", wordTrig=false, snippetType="autosnippet"}, {t("\\theta")},{condition=in_mathzone}),
    s({trig=";Q", wordTrig=false, snippetType="autosnippet"}, {t("\\Theta")},{condition=in_mathzone}),

    s({trig=";l", wordTrig=false, snippetType="autosnippet"}, {t("\\lambda")},{condition=in_mathzone}),
    s({trig=";L", wordTrig=false, snippetType="autosnippet"}, {t("\\Lambda")},{condition=in_mathzone}),

    s({trig=";m", wordTrig=false, snippetType="autosnippet"}, {t("\\mu")},{condition=in_mathzone}),
    s({trig=";M", wordTrig=false, snippetType="autosnippet"}, {t("\\Mu")},{condition=in_mathzone}),

    s({trig=";n", wordTrig=false, snippetType="autosnippet"}, {t("\\nu")},{condition=in_mathzone}),
    s({trig=";N", wordTrig=false, snippetType="autosnippet"}, {t("\\Nu")},{condition=in_mathzone}),

    s({trig=";p", wordTrig=false, snippetType="autosnippet"}, {t("\\pi")},{condition=in_mathzone}),
    s({trig=";P", wordTrig=false, snippetType="autosnippet"}, {t("\\Pi")},{condition=in_mathzone}),

    s({trig=";r", wordTrig=false, snippetType="autosnippet"}, {t("\\rho")},{condition=in_mathzone}),
    s({trig=";R", wordTrig=false, snippetType="autosnippet"}, {t("\\Rho")},{condition=in_mathzone}),

    s({trig=";s", wordTrig=false, snippetType="autosnippet"}, {t("\\sigma")},{condition=in_mathzone}),
    s({trig=";S", wordTrig=false, snippetType="autosnippet"}, {t("\\Sigma")},{condition=in_mathzone}),

    s({trig=";t", wordTrig=false, snippetType="autosnippet"}, {t("\\tau")},{condition=in_mathzone}),
    s({trig=";T", wordTrig=false, snippetType="autosnippet"}, {t("\\Tau")},{condition=in_mathzone}),

    s({trig=";f", wordTrig=false, snippetType="autosnippet"}, {t("\\phi")},{condition=in_mathzone}),
    s({trig=";F", wordTrig=false, snippetType="autosnippet"}, {t("\\Phi")},{condition=in_mathzone}),

    s({trig=";c", wordTrig=false, snippetType="autosnippet"}, {t("\\chi")},{condition=in_mathzone}),
    s({trig=";C", wordTrig=false, snippetType="autosnippet"}, {t("\\Chi")},{condition=in_mathzone}),

    s({trig=";y", wordTrig=false, snippetType="autosnippet"}, {t("\\psi")},{condition=in_mathzone}),
    s({trig=";Y", wordTrig=false, snippetType="autosnippet"}, {t("\\Psi")},{condition=in_mathzone}),

    s({trig=";w", wordTrig=false, snippetType="autosnippet"}, {t("\\omega")},{condition=in_mathzone}),
    s({trig=";W", wordTrig=false, snippetType="autosnippet"}, {t("\\Omega")},{condition=in_mathzone})
}
