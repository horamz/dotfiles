if vim.g.neovide then
    vim.g.neovide_fullscreen = false

    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    vim.g.neovide_refresh_rate = 240
    vim.g.neovide_no_idle = true

    vim.o.guifont = "Berkeley Mono:h12"

    vim.g.neovide_text_gamma = 0.8
    vim.g.neovide_text_contrast = 0.1

    vim.g.neovide_font_hinting = 'none'
    vim.g.neovide_font_edging = 'subpixelantialias'

    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_antialiasing = true

    --vim.g.neovide_cursor_vfx_mode = "pixiedust"

    function toggle_neovide_fullscreen()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end

    vim.keymap.set("n", "<F11>", ":lua toggle_neovide_fullscreen()<CR>", {noremap = true, silent = true})
end
