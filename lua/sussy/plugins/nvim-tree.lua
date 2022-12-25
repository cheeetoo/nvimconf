require('nvim-tree').setup({
    renderer = {
        indent_markers = {
            enable = true
        },
    },
    diagnostics = {
       enable = true,
       show_on_dirs = true,
       icons = {
         hint = "",
         info = "",
         warning = "",
         error = "",
       }
    }
})
