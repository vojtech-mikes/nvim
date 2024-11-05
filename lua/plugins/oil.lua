return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>")
	end,
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
