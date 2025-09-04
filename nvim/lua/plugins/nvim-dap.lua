-- [nfnl] fnl/plugins/nvim-dap.fnl
local function _1_()
  local dap = require("dap")
  dap.configurations.javascript = {{console = "integratedTerminal", cwd = vim.fn.getcwd(), name = "Launch file", program = "${file}", protocol = "inspector", request = "launch", sourceMaps = true, type = "node2"}, {name = "Attach to process", processId = require("dap.utils").pick_process, request = "attach", type = "node2"}}
  dap.configurations.typescript = dap.configurations.javascript
  dap.configurations.javascriptreact = dap.configurations.javascript
  dap.configurations.typescriptreact = dap.configurations.typescript
  return nil
end
return {{"mfussenegger/nvim-dap", lazy = true, init = _1_}}
