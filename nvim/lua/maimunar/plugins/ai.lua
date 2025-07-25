return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- setup ai
    local neocodeium = require("neocodeium")

    neocodeium.setup({
      manual = true, -- recommended to not conflict with nvim-cmp
    })

    -- create an autocommand which closes cmp when ai completions are displayed
    vim.api.nvim_create_autocmd("User", {
      pattern = "NeoCodeiumCompletionDisplayed",
      callback = function()
        require("cmp").abort()
      end,
    })

    -- set up some sort of keymap to cycle and complete to trigger completion
    vim.keymap.set("i", "<C-e>", function()
      neocodeium.cycle_or_complete()
    end)
    -- make sure to have a mapping to accept a completion
    vim.keymap.set("i", "<C-f>", function()
      neocodeium.accept()
    end)
  end,
}
