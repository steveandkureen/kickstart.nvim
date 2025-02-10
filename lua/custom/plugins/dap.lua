return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      require('dapui').setup()
      require('dap-go').setup()

      vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'set breakpoint' })
      vim.keymap.set('n', '<leader>gb', dap.run_to_cursor, { desc = 'run to cursor' })
      vim.keymap.set('n', '<space>?', function()
        require('dapui').eval(nil, { enter = true })
      end)

      vim.keymap.set('n', '<F5>', dap.continue)
      vim.keymap.set('n', '<F6>', function()
        dap.terminate()
        ui.close()
      end)
      vim.keymap.set('n', '<F11>', dap.step_into)
      vim.keymap.set('n', '<F10>', dap.step_over)
      vim.keymap.set('n', '<S-F11>', dap.step_out)
    end,
  },
}
