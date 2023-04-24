-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local buffer = require "astronvim.utils.buffer"
local astro_utils = require "astronvim.utils"

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) buffer.close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- Disable default navigation bindings
    ["[b"] = false,
    ["b]"] = false,
    -- Navigate through buffers
    ["<S-l>"] = { function() buffer.nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next Buffer" },
    ["<S-h>"] = { function() buffer.nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous Buffer" },
    -- Use telescope buffer browser
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers {
            sort_mru = true,
            ignore_current_buffer = true,
          }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },
    -- Scroll half page down/up and center the mouse
    ["<C-d>"] = { "<C-d>zz", desc = "Scroll half page down" },
    ["<C-u>"] = { "<C-u>zz", desc = "Scroll half page up" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
