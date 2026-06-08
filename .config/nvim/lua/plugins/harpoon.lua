return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  opts = {},
  keys = function()
    local keys = {
      {
        "<C-w>",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<C-q>",
        function()
          local function toggle_telescope(harpoon_files)
            local finder = function()
              local paths = {}
              for i, item in ipairs(harpoon_files.items) do
                table.insert(paths, {
                  value = item.value,
                  display = string.format("F%d: %s", i, item.value),
                  ordinal = item.value,
                })
              end

              return require("telescope.finders").new_table({
                results = paths,
                entry_maker = function(entry)
                  return {
                    value = entry.value,
                    display = entry.display,
                    ordinal = entry.ordinal,
                  }
                end,
              })
            end

            require("telescope.pickers").new({}, {
              prompt_title = "harpoon",
              finder = finder(),
              sorter = require("telescope.config").values.generic_sorter({}),
              previewer = require("telescope.config").values.file_previewer({}),
              attach_mappings = function(prompt_bufnr, map)
                map({ "n", "i" }, "<C-d>", function()
                  local state = require("telescope.actions.state")
                  local selected_entry = state.get_selected_entry()
                  local current_picker = state.get_current_picker(prompt_bufnr)

                  table.remove(harpoon_files.items, selected_entry.index)
                  current_picker:refresh(finder())
                end)
                return true
              end,
            }):find()
          end
          toggle_telescope(require("harpoon"):list())
        end,
        desc = "Harpoon Quick Menu",
      },
    }

    for i = 1, 12 do
      table.insert(keys, {
        "<F" .. i .. ">",
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}
