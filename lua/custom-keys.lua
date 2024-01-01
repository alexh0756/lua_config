-- fetch keymap function
local map = vim.api.nvim_set_keymap
local setkey = vim.keymap.set
-- map the key n to run the command :NvimTreeToggle
map('n', 'n', [[:NvimTreeToggle<CR>]], {})

-- CTRL+s to save file
map('n', '<C-s>', [[:w<CR>]], {})

-- Nvim-dap keymappings
map('n', '<F5>', [[:lua require'dap'.continue()<CR>]], {})
-- CTRL+d will enter debugmode and remove NvimTree
map('n', '<C-d>', [[:NvimTreeClose<CR> :lua require'dapui'.toggle()<CR>]], {})
-- CTRL+b sets a breakpoint
map('n', '<C-b>', [[:lua require'dap'.toggle_breakpoint()<CR>]], {})
-- Press CTRL+I to set log points
map('n', '<C-l>', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR> ]], {})

-- Press f10 to set over
map('n', '<F10>', [[:lua require'dap'.set_over()<CR>]], {})
map('n', '<F11>', [[:lua require'dap'.step_into()<CR>]], {})
map('n', '<F12>', [[:lua require'dap'.step_out()<CR>]], {})
map('n', '<F6>', [[:lua require'dap'.repl.open()<CR>]], {})
map('n', 'dl', [[:lua require'dap'.run_last()<CR>]], {})
map('n', '<leader>dr', [[:lua require'dapui'.float_element('repl', {width = 50, height = 80, position='right'})<CR>]], {})
map('n', '<leader>de', [[:lua require'dapui'.eval()<CR>]], {})
setkey('v', '<leader>de', function() require'dapui'.eval() end, {})
-- vnoremap <M-k> <Cmd>lua require("dapui").eval()<CR>


map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

local builtin = require('telescope.builtin')
setkey('n', '<leader>ff', builtin.find_files, {})
setkey('n', '<leader>fg', builtin.live_grep, {})
setkey('n', '<leader>fb', builtin.buffers, {})
setkey('n', '<leader>fh', builtin.help_tags, {})

-- map('n', '<leader>ad', [[:! git add .<CR>]], {})
-- map('n', '<leader>cm', [[:! git commit -m ]], {})
-- map('n', '<leader>ph', [[:! git push <CR>]], {})
-- map('n', '<leader>pl', [[:! git pull <CR>]], {})

-- git hotkeys
setkey('n', '<leader>go', [[: lua require'neogit'.open()<CR>]], {})
