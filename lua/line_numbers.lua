local numtogGrp = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd(
  { "BufEnter", "InsertLeave", "FocusGained"},
  { pattern = "*",
    --command = "set relativenumber",  -- if callback, vim.api.nvim_buf_set_option(0,relativenumber,true) ?
    callback = function()
      vim.api.nvim_buf_set_option(0, 'relativenumber', true)
    end,
    group = numtogGrp,
    desc = "Turn on relative line numbering when the buffer is entered.",
  }
)
vim.api.nvim_create_autocmd(
  { "BufLeave", "InsertEnter", "FocusLost"},
  { pattern = "*",
    --command = "set norelativenumber",
    callback = function()
	    vim.wo.relativenumber = true
    end,
    group = numtogGrp,
    desc = "Turn off relative line numbering when the buffer is exited.",
  }
)
