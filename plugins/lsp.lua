local utils = require "astrocommunity.utils"
local events = require "neo-tree.events"

local function on_file_remove(args)
  local ts_clients = vim.lsp.get_active_clients { name = "tsserver" }
  for _, ts_client in ipairs(ts_clients) do
    ts_client.request("workspace/executeCommand", {
      command = "_typescript.applyRenameFile",
      arguments = {
        {
          sourceUri = vim.uri_from_fname(args.source),
          targetUri = vim.uri_from_fname(args.destination),
        },
      },
    })
  end
end

return {
  {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = true,
    event = "BufRead package.json",
  },
  -- {
  --   "jose-elias-alvarez/typescript.nvim",
  --   init = function() utils.list_insert_unique(astronvim.lsp.skip_setup, "tsserver") end,
  --   ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  --   opts = function() return { server = require("astronvim.utils.lsp").config "tsserver" } end,
  -- },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = events.FILE_MOVED,
          handler = on_file_remove,
        },
        {
          event = events.FILE_RENAMED,
          handler = on_file_remove,
        },
      },
    },
  },
}
