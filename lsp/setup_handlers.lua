return {
  -- add custom handler
  tsserver = function(_, opts) require("typescript").setup { server = opts } end,
}
