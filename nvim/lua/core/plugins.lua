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
  use({'nathom/filetype.nvim'               })
  use({'goolord/alpha-nvim'                 })
  use({'numToStr/Comment.nvim'              })
  use({'lewis6991/impatient.nvim'           })
  use({'akinsho/toggleterm.nvim'            })
  use({'APZelos/blamer.nvim'                })
  use({'ahmedkhalf/project.nvim'            })
  use({'kyazdani42/nvim-web-devicons'       })
  use({'tpope/vim-fugitive'                 })
  use({'tpope/vim-unimpaired'               })
  use({'lukas-reineke/indent-blankline.nvim'})
  use({'alexghergh/nvim-tmux-navigation'    })
  use({'akinsho/bufferline.nvim'            })

  use({ "Mofiqul/dracula.nvim" })

  use({'nvim-lualine/lualine.nvim', opt = true     })
  use({'nvim-tree/nvim-tree.lua',   tag = 'nightly'})

  use({'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}, tag = '0.1.0'  })
  use({'Slotos/telescope-lsp-handlers.nvim' })
  use({'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  use({'neovim/nvim-lspconfig'    })
  use({'L3MON4D3/LuaSnip'         })
  use({'onsails/lspkind.nvim'     })
  use({'hrsh7th/nvim-cmp'         })
  use({'hrsh7th/cmp-buffer'       })
  use({'hrsh7th/cmp-path'         })
  use({'hrsh7th/cmp-nvim-lsp'     })
  use({'hrsh7th/cmp-nvim-lua'     })
  use({'hrsh7th/cmp-cmdline'      })
  use({'saadparwaiz1/cmp_luasnip' })
  use({'jose-elias-alvarez/null-ls.nvim' })

  use({'fatih/vim-go' })
  use({'hashivim/vim-terraform' })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
