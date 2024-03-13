return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup({})

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end

    local keymap = vim.keymap

    keymap.set("n", "<leader>a", function()
      harpoon:list():append()
    end)

    keymap.set("n", "<leader>m", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end)
    keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end)
    keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end)
    keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end)
    keymap.set("n", "<leader>5", function()
      harpoon:list():select(5)
    end)
    keymap.set("n", "<leader>6", function()
      harpoon:list():select(6)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    keymap.set("n", "<leader>p", function()
      harpoon:list():prev()
    end)
    keymap.set("n", "<leader>n", function()
      harpoon:list():next()
    end)

    -- Telescope binding
    keymap.set("n", "<leader>t", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
  end,
}