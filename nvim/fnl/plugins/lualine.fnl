(local {: autoload} (require :nfnl.module))
(local nvim (autoload :nvim))
(local core (autoload :nfnl.core))


(fn lsp_connection []
  (if (vim.tbl_isempty (vim.lsp.get_clients 0)) "" ""))

(local github-lua-theme
  (core.assoc
    (require :lualine.themes.auto)
    :inactive {:a {:bg "#19181e" :fg "#a4a3a6"}
               :b {:bg "#19181e" :fg "#a4a3a6"}
               :c {:bg "#19181e" :fg "#a4a3a6"}}
    :normal {:a {:bg "#131217" :fg "#24292e"}
             :b {:bg "#131217" :fg "#3b8eea"}
             :c {:bg "#19181e" :fg "#d1d5da"}}
    :command {:a {:bg "#131217" :fg "#24292e"}
              :b {:bg "#131217" :fg "#ccbed8"}
              :c {:bg "#19181e" :fg "#d1d5da"}}
    :terminal {:a {:bg "#131217" :fg "#24292e"}
              :b {:bg "#131217" :fg "#ccbed8"}
              :c {:bg "#19181e" :fg "#d1d5da"}}
    :visual {:a {:bg "#131217" :fg "#24292e"}
             :b {:bg "#131217" :fg "#ced4b1"}
             :c {:bg "#19181e" :fg "#d1d5da"}}
    :replace {:a {:bg "#131217" :fg "#24292e"}
              :b {:bg "#131217" :fg "#d1b6bd"}
              :c {:bg "#19181e" :fg "#d1d5da"}}
    :insert {:a {:bg "#131217" :fg "#24292e"}
             :b {:bg "#131217" :fg "#a8d1c9"}
             :c {:bg "#19181e" :fg "#d1d5da"}}))

[{1 :nvim-lualine/lualine.nvim
  :config (fn []
            (let [lualine (require :lualine)]
              (lualine.setup
                {:options {:theme github-lua-theme
                           :icons_enabled true
                           :section_separators ["" ""]
                           :component_separators ["" ""]}
                 :sections {:lualine_a []
                            :lualine_b [[:mode {:upper true}]]
                            :lualine_c [["FugitiveHead"]
                                        ["orgmode.statusline()"]
                                        ["tostring(string.gsub(vim.fn.getcwd(), os.getenv('HOME'), ''))"]
                                        [:filename {:filestatus true
                                                    :path 1}]]
                            :lualine_x [[:diagnostics {:sections [:error
                                                                  :warn
                                                                  :info
                                                                  :hint]
                                                       :sources [:nvim_lsp]}]
                                        [lsp_connection]
                                        :location
                                        :filetype]
                            :lualine_y [:encoding]
                            :lualine_z []}
                 :inactive_sections {:lualine_a []
                                     :lualine_b []
                                     :lualine_c [[:filename {:filestatus true
                                                             :path 1}]]
                                     :lualine_x []
                                     :lualine_y []
                                     :lualine_z []}})))}]
