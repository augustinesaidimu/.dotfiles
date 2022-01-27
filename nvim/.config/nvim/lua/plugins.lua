
-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
local packer = require('packer')

packer.init({
    git = {
        clone_timeout = false, -- Timeout, in seconds, for git clones
    },
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
})

local use = packer.use

-- Packer can manage itself
use {'wbthomason/packer.nvim',
    cmd={"PackerCompile", "PackerLoad", "PackerSync", "PackerClean", "PackerStatus", "PackerUpdate", "PackerInstall", "PackerProfile",}
}

-- colorscheme
use {
    'sainnhe/gruvbox-material',
    cmd="colorscheme gruvbox",
}

use {
    'EdenEast/nightfox.nvim',
    config = function ()
        require("plugin/_nightfox")
    end
}

-- show indentation levels
use {
    'lukas-reineke/indent-blankline.nvim',
    config = function ()
        require("indent_blankline").setup { }
    end
}

-- pretty icons
use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('plugin/_nvim-web-devicons') end
}

-- status line
use {
    'nvim-lualine/lualine.nvim',
    config = function () require('plugin/_lualine') end
}

-- buffer line
use {
    'akinsho/bufferline.nvim',
    config = function () require('plugin/_bufferline') end
}

-- auto pairs
use {
    'windwp/nvim-autopairs',
    config = function() require('plugin/_nvim-autopairs') end
}

-- align stuff
use {
    'godlygeek/tabular',
    cmd="Tabularize"
}

-- quick comments
use {
    'scrooloose/nerdcommenter',
    cmd={ "NERDCommenterToggle", "NERDCommenterComment"}
}

-- fuzzy finder
use {
    'junegunn/fzf.vim',
    cmd={"Fzf", "Buffers"}
}

-- file manager
use  {
    'kyazdani42/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeOpen' },
    config = function() require('plugin/_nvim-tree') end
}

-- git in vim
use {
    'tpope/vim-fugitive',
    cmd= { "G", "Git"}
}

-- git signs
use {
    'lewis6991/gitsigns.nvim',
    requires = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('plugin/_gitsigns')
    end
}

-- project
use {
    "ahmedkhalf/project.nvim",
    config = function()
        require('plugin/_project')
    end
}

-- language support
use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require('plugin/_nvim-treesitter')
    end
}

use {
    "neovim/nvim-lspconfig",
    config = function()
        require('plugin/_nvim-lspconfig')
    end
}

use {
    "tamago324/nlsp-settings.nvim",
    cmd={ "NlspConfig", "NlspLocalConfig", "NlspLocalBufConfig", "NlspUpdateSettings", },
    config = function()
        require('plugin/_nlsp-settings')
    end
}

-- completion
use {'hrsh7th/cmp-nvim-lsp'}
use {'hrsh7th/cmp-buffer'  }
use {'hrsh7th/cmp-path'    }
use {'hrsh7th/cmp-cmdline' }

use {
    'SirVer/ultisnips',
    requires = {{'honza/vim-snippets', rtp = '.'}},
    config = function()
      vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
      vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
      vim.g.UltiSnipsJumpBackwardTrigger = '<Plug>(ultisnips_jump_backward)'
      vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
      vim.g.UltiSnipsRemoveSelectModeMappings = 0
    end
}

use {
    'quangnguyen30192/cmp-nvim-ultisnips',
    config=  function()
        require("cmp_nvim_ultisnips").setup {
            filetype_source = "treesitter",
            show_snippets = "all",
            documentation = function(snippet)
                return snippet.description
            end
        }
    end
}

use {
    "hrsh7th/nvim-cmp",
    config = function()
        require('plugin/_nvim-cmp')
    end,
}

-- lsp installer
use {
    "williamboman/nvim-lsp-installer",
    cmd = { 'LspInstall',  'LspInstallInfo', 'LspUninstall'},
    config = function()
        require('plugin/__nvim-lsp-installer')
    end
}

-- show errors
use {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle" },
  requires = "kyazdani42/nvim-web-devicons",
  config = function() require("trouble").setup { } end
}

-- vim for writers
use {
    'junegunn/goyo.vim',
    cmd = { "Goyo" }
}
use {
    'junegunn/limelight.vim',
    cmd = { "limelight" }
}
use {
    'reedes/vim-pencil',
    cmd={ "Pencil", "Pexplore", "PencilOff", "PencilHard", "PencilSoft", "PencilToggle"},
    ft={"markdown","text" }
}
use {'reedes/vim-wordy',
    ft={"markdown","text" }
}
use {'reedes/vim-lexical',
    ft={"markdown","text" }
}
use { 'dbmrq/vim-ditto',
    ft={"markdown","text" }
}
use { 'rhysd/vim-grammarous',
    ft={"markdown","text" }
}

-- harpoon
use {
    'ThePrimeagen/harpoon',
    config = function() require('harpoon').setup() end
}

-- fuzzy finder
use {
    "nvim-telescope/telescope.nvim",
    cmd={"Telescope"},
    config = function() require('plugin/_telescope') end
}

use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
}

-- basic debugger
use {
    'mfussenegger/nvim-dap',
    config = function() require('plugin/_dap') end
}
