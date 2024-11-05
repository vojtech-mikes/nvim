return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function()
				-- Go to definition
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end)
				-- Rename symbol
				vim.keymap.set("n", "rs", function()
					vim.lsp.buf.rename()
				end)
				-- Go to declaration
				vim.keymap.set("n", "gD", function()
					vim.lsp.buf.declaration()
				end)
				-- Go to declaration
				vim.keymap.set("n", "gD", function()
					vim.lsp.buf.declaration()
				end)
				-- Display references
				vim.keymap.set("n", "dr", function()
					vim.lsp.buf.references()
				end)
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		require("mason").setup()

		local servers = {
			pyright = {},
			lua_ls = {},
		}

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
