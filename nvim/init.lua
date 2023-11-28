local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {
  -- My plugins here
  -- 'foo1/bar1.nvim';
  -- 'foo2/bar2.nvim';
  'dense-analysis/ale';
  'nvim-lua/completion-nvim';
  { 'Shougo/deoplete.nvim', run = ':UpdateRemotePlugins' };
  'sbdchd/neoformat';
  'morhetz/gruvbox';
  'f-person/git-blame.nvim';
  -- { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' };

  'Vigemus/iron.nvim';
  -- 'github/copilot.vim';
  -- 'deoplete-plugins/deoplete-clang';
  --  {
  --    'chipsenkbeil/distant.nvim',
  --    branch = 'v0.3',
  --    config = function()
  --        require('distant'):setup()
  --    end
  --  }
}

vim.cmd("set nu")
vim.cmd("set rnu")
vim.cmd("colorscheme gruvbox")
vim.cmd("set colorcolumn=80")

-- vim.opt.runtimepath:append('~/.config/nvim/')

-- vim.g.magma_image_provide = "kitty"
-- vim.g.magma_automatically_open_output = false

vim.g["enable_at_startup"] = 1

-- the following section relating to iron ends at line 150
local iron = require("iron.core")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').bottom(40),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_until_cursor = "<space>su",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

require "local"
