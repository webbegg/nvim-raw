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
  use 'wbthomason/packer.nvim'
  
  use {
    'ldelossa/nvim-ide',
    config = function ()
      local bufferlist      = require('ide.components.bufferlist')
      local explorer        = require('ide.components.explorer')
      local outline         = require('ide.components.outline')
      local callhierarchy   = require('ide.components.callhierarchy')
      local timeline        = require('ide.components.timeline')
      local terminal        = require('ide.components.terminal')
      local terminalbrowser = require('ide.components.terminal.terminalbrowser')
      local changes         = require('ide.components.changes')
      local commits         = require('ide.components.commits')
      local branches        = require('ide.components.branches')
      local bookmarks       = require('ide.components.bookmarks')

      require('ide').setup({
          -- The global icon set to use.
          -- values: "nerd", "codicon", "default"
          icon_set = "default",
          -- Set the log level for nvim-ide's log. Log can be accessed with 
          -- 'Workspace OpenLog'. Values are 'debug', 'warn', 'info', 'error'
          log_level = "info",
          -- Component specific configurations and default config overrides.
          components = {
              -- The global keymap is applied to all Components before construction.
              -- It allows common keymaps such as "hide" to be overridden, without having
              -- to make an override entry for all Components.
              --
              -- If a more specific keymap override is defined for a specific Component
              -- this takes precedence.
              global_keymaps = {
                  -- example, change all Component's hide keymap to "h"
                  -- hide = h
              },
              -- example, prefer "x" for hide only for Explorer component.
              -- Explorer = {
              --     keymaps = {
              --         hide = "x",
              --     }
              -- }
          },
          -- default panel groups to display on left and right.
          panels = {
              left = "explorer",
              right = "git"
          },
          -- panels defined by groups of components, user is free to redefine the defaults
          -- and/or add additional.
          panel_groups = {
              explorer = { outline.Name, bufferlist.Name, explorer.Name, bookmarks.Name, callhierarchy.Name, terminalbrowser.Name },
              terminal = { terminal.Name },
              git = { changes.Name, commits.Name, timeline.Name, branches.Name }
          },
          -- workspaces config
          workspaces = {
              -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
              auto_open = 'left',
          },
          -- default panel sizes for the different positions
          panel_sizes = {
              left = 30,
              right = 30,
              bottom = 15
          }
      })
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

