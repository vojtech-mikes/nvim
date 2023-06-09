local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use { "bluz71/vim-moonfly-colors", as = "moonfly" }


  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {'nvim-telescope/telescope.nvim', tag = '0.1.1'}

  use { 'nvim-telescope/telescope-fzf-native.nvim'}

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }

  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate"
  }

  use {"williamboman/mason-lspconfig.nvim"}

  use {"neovim/nvim-lspconfig"}

  use {"hrsh7th/cmp-nvim-lsp"}

  use {"hrsh7th/cmp-buffer"}

  use {"hrsh7th/cmp-path"}

  use {"hrsh7th/nvim-cmp"}

  use({
	  "L3MON4D3/LuaSnip",
	  -- follow latest release.
	  tag = "v1.2.1",
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
    "windwp/nvim-autopairs",
   config = function() require("nvim-autopairs").setup {} end
  }

	if packer_bootstrap then
    		require('packer').sync()
  	end
end)
