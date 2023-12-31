-- require('harpoon-core').setup({
--             -- Make existing window active rather than creating a new window
--             use_existing = true,
--             -- Default action when opening a mark, defaults to current window
--             -- Example: 'vs' will open in new vertical split, 'tabnew' will open in new tab
--             default_action = nil,
--             -- Set marks specific to each git branch inside git repository
--             mark_branch = false,
--             -- Use the previous cursor position of marked files when opened
--             use_cursor = true,
--             -- Settings for popup window
--             menu = {
--                 width = 60,
--                 height = 10,
--             },
--             -- Highlight groups to use for various components
--             highlight_groups = {
--                 window = 'HarpoonWindow',
--                 border = 'HarpoonBorder',
--             },
--         })

-- local setkey = vim.keymap.set

-- setkey('n', '<leader>hm', ":lua require('harpoon-core.ui').toggle_quick_menu()<CR>", {})
-- setkey('n', '<O-,>', ":lua require('harpoon-core.ui').nav_prev()<CR>", {noremap=true})
-- setkey('n', '<O-.>', ":lua require('harpoon-core.ui').nav_next()<CR>", {})
-- setkey('n', '<leader>ha', ":lua require('harpoon-core.mark').add_file()<CR>", {})
-- setkey('n', '<leader>hr', ":lua require('harpoon-core.mark').remove_file()<CR>", {})

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
