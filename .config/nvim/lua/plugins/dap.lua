return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require("dap")
      local has_dapui, dapui = pcall(require, "dapui")
      if has_dapui then
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
      end
    end,
  }
}
