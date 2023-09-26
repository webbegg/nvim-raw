require('user.keymaps')

local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

require('prettier').setup {
  format_on_save = true,
  auto_format_on_insert = true,
}

require('lspsaga').setup({
  lightbulbs_enable = false,
  lightbulbs_warning_enable = false,
  error_sign_priority = 10,
  sign_column_padding = 0,
  diagnostic_signs = false,
  code_action_prompt = {
    enable = true,
  },
  code_action_prompt = {
    enable = false,
  },
  ui = {
    code_action = '󰜋',
  },
  symbol_in_winbar = {
    enable = false,
  },
  lightbulb = {
    enable = false,
    enable_in_insert = false,
  }
})

-- When you don't have mason.nvim installed
-- You'll need to list the servers installed in your system
lsp.setup_servers({'tsserver', 'eslint'})

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function()
  local opts = { noremap = true, silent = true }
  require('lspsaga').setup {
    code_action_prompt = {
      enable = false,  -- Deshabilitar la bombilla de código de acción
      sign = true,
      sign_priority = 20,
      virtual_text = true
    },
    code_actions = {
      enable = true,
      use_prettier = true,
    },
  }

  vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  vim.keymap.set('n', 'ca', '<cmd>Lspsaga code_action<CR>', opts)
  vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.keymap.set('n', '<leader>dj', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  vim.keymap.set('n', '<leader>dk', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  vim.keymap.set('n', '<leader>r', '<cmd>Lspsaga rename<CR>', opts)
  vim.keymap.set('n', '<leader>tt', '<cmd>Trouble<CR>', opts)
end

lsp.setup()

local lspconfig = require('lspconfig')

lspconfig.volar.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
