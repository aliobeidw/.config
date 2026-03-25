vim.g.netrw_winsize = 15
vim.opt.termguicolors = true
vim.opt.syntax = "on"
vim.cmd.filetype("plugin indent on")

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("vscode")
    end,
  },
  { "projekt0n/github-nvim-theme", lazy = true },
})

-- Enable treesitter highlighting (built into Neovim 0.11+)
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
