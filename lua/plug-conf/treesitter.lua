require("nvim-treesitter.configs").setup {
  ensure_installed = {"lua", "rust"},
  auto_install = false,
  highlight = {
    enable = true
  }
}
