return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local lint = require("lint")

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    lint.linters_by_ft = {
      typescript = { "eslint_d", "eslint" },
      javascript = { "eslint_d", "eslint" },
      typescriptreact = { "eslint_d", "eslint" },
      javascriptreact = { "eslint_d", "eslint" },
      svelte = { "eslint_d", "eslint" },
      python = { "pylint" },
    }

    local eslint = lint.linters.eslint_d

    eslint.args = {
      "--no-warn-ignored", -- <-- this is the key argument
      "--format",
      "json",
      "--stdin",
      "--stdin-filename",
      function()
        return vim.api.nvim_buf_get_name(0)
      end,
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
