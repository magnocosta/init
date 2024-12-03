vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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

return require('packer').startup(function(use)

  -- Basic Editor
  use({'wbthomason/packer.nvim'             })
  use({'windwp/nvim-autopairs'              })
  use({'goolord/alpha-nvim'                 })
  use({'numToStr/Comment.nvim'              })
  use({'lewis6991/impatient.nvim'           })
  use({'kyazdani42/nvim-web-devicons'       })
  use({'tpope/vim-fugitive'                 })
  use({'tpope/vim-unimpaired'               })
  use({'tpope/vim-surround'                 })
  use({'lukas-reineke/indent-blankline.nvim'})
  use({'alexghergh/nvim-tmux-navigation'    })
  use({'akinsho/bufferline.nvim'            })

  -- Theme
  use({ "Mofiqul/dracula.nvim" })

  use({'nvim-lualine/lualine.nvim' })
  use({'nvim-tree/nvim-tree.lua' })

  use({'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'} })
  use({'Slotos/telescope-lsp-handlers.nvim' })
  use({'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use({'hrsh7th/nvim-cmp'                    })
  use({'hrsh7th/cmp-buffer'                  })
  use({'hrsh7th/cmp-path'                    })
  use({'hrsh7th/cmp-nvim-lsp'                })
  use({'hrsh7th/cmp-nvim-lua'                })
  use({'hrsh7th/cmp-cmdline'                 })
  use({'hrsh7th/cmp-nvim-lsp-signature-help' })

  use({'neovim/nvim-lspconfig'           })
  use({'L3MON4D3/LuaSnip'                })
  use({'onsails/lspkind.nvim'            })
  use({'saadparwaiz1/cmp_luasnip'        })
  use({'jose-elias-alvarez/null-ls.nvim' })

  -- Additional language support
  -- use({'fatih/vim-go' })
  use({'hashivim/vim-terraform' })
  use({'dart-lang/dart-vim-plugin' })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
