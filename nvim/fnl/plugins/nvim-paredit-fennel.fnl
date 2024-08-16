[{1 "julienvincent/nvim-paredit-fennel"
  :dependencies [:julienvincent/nvim-paredit]
  :ft [:fennel]
  :config (fn []
            (let [nvim-paredit-fennel (require "nvim-paredit-fennel")]
              (nvim-paredit-fennel.setup)))}]
