return {
    {
        'kaarmu/typst.vim',
        config = function()
            vim.g.typst_pdf_viewer = 'okular'
            vim.g.typst_auto_open_quickfix = '0'
        end,
    }
}
