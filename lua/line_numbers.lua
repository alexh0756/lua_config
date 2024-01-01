local numtogGrp = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
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
