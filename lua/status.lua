-- -- setup status bar
-- require('feline').setup()


-- ctp_feline.setup()


local clrs = require("catppuccin.palettes").get_palette()
local ctp_feline = require('catppuccin.groups.integrations.feline')
local U = require "catppuccin.utils.colors"


ctp_feline.setup({
    assets = {
        left_separator = "",
        right_separator = "",
        mode_icon = "",
        dir = "󰉖",
        file = "󰈙",
        lsp = {
            server = "󰅡",
            error = "",
            warning = "",
            info = "",
            hint = "",
        },
        git = {
            branch = "",
            added = "",
            changed = "",
            removed = "",
        },
    },
    sett = {
--        text = U.vary_color({ latte = latte.base }, clrs.surface0),
--        bkg = U.vary_color({ latte = latte.crust }, clrs.surface0),
        diffs = clrs.mauve,
        extras = clrs.overlay1,
        curr_file = clrs.maroon,
        curr_dir = clrs.flamingo,
        show_modified = true -- show if the file has been modified
    },
    mode_colors = {
        ["n"] = { "NORMAL", clrs.lavender },
        ["no"] = { "N-PENDING", clrs.lavender },
        ["i"] = { "INSERT", clrs.green },
        ["ic"] = { "INSERT", clrs.green },
        ["t"] = { "TERMINAL", clrs.green },
        ["v"] = { "VISUAL", clrs.flamingo },
        ["V"] = { "V-LINE", clrs.flamingo },
        ["�"] = { "V-BLOCK", clrs.flamingo },
        ["R"] = { "REPLACE", clrs.maroon },
        ["Rv"] = { "V-REPLACE", clrs.maroon },
        ["s"] = { "SELECT", clrs.maroon },
        ["S"] = { "S-LINE", clrs.maroon },
        ["�"] = { "S-BLOCK", clrs.maroon },
        ["c"] = { "COMMAND", clrs.peach },
        ["cv"] = { "COMMAND", clrs.peach },
        ["ce"] = { "COMMAND", clrs.peach },
        ["r"] = { "PROMPT", clrs.teal },
        ["rm"] = { "MORE", clrs.teal },
        ["r?"] = { "CONFIRM", clrs.mauve },
        ["!"] = { "SHELL", clrs.green },
    }
})

-- require("feline").setup({
--     components = ctp_feline.get(),
-- })

require('feline').winbar.setup()
require('feline').statuscolumn.setup()

-- vim.api.nvim_create_autocmd("ColorScheme", {
--     pattern = "*",
--     callback = function()
--         package.loaded["feline"] = nil
--         package.loaded["catppuccin.groups.integrations.feline"] = nil
--         require("feline").setup {
--             components = require("catppuccin.groups.integrations.feline").get(),
--         }
--     end,
-- })
-- 
-- local feline_gruvbox = {
-- 	fg = "#ebdbb2",
-- 	bg = "#32302f",
-- 	black = "#32302f",
-- 	skyblue = "#83a598",
-- 	cyan = "#a89984",
-- 	green = "#98971a",
-- 	oceanblue = "#458588",
-- 	magenta = "#fb4934",
-- 	orange = "#d65d0e",
-- 	red = "#fb4934",
-- 	violet = "#b16286",
-- 	white = "#ebdbb2",
-- 	yellow = "#d79921",
-- }
-- 
-- require('feline').use_theme(feline_gruvbox)
