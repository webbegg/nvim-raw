-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#8ab3b5',
  black  = '#111111',
  white  = '#c6c6c6',
  red    = '#ab6077',
  violet = '#d183e8',
  grey   = '#282828',
  green  = '#a1b56c',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.cyan },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.green } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

return  { -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = 'onedark',
      component_separators = '|',
      section_separators = '',
    },
  },
  config = function()
    require('lualine').setup {
      options = {
        theme = bubbles_theme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {
          -- { 'filename', separator = { left = '' }, right_padding = 2 },
          { 'mode', separator = { left = '' }, right_padding = 2 },
        },
        lualine_b = { 'branch' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'filetype' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = {},
        lualine_b = {
          {
            'filename',
            path = 0,
            file_status = true,
          }
        },
        lualine_x = {
          {
            'filename',
            path = 1,
          }
        },
      },
      extensions = {},
    }
  end
}

