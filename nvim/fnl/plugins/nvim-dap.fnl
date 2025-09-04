[{1 :mfussenegger/nvim-dap
  :lazy true
  :init (fn []
          (let [dap (require "dap")]
            (set dap.configurations.javascript
                 [{:console :integratedTerminal
                   :cwd (vim.fn.getcwd)
                   :name "Launch file"
                   :program "${file}"
                   :protocol :inspector
                   :request :launch
                   :sourceMaps true
                   :type :node2}
                  {:name "Attach to process"
                   :processId (. (require :dap.utils) :pick_process)
                   :request :attach
                   :type :node2}])

            (set dap.configurations.typescript dap.configurations.javascript)
            (set dap.configurations.javascriptreact dap.configurations.javascript)
            (set dap.configurations.typescriptreact dap.configurations.typescript)))}]
