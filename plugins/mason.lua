-- customize mason plugins
return {
  "jose-elias-alvarez/typescript.nvim",
  -- "simrat39/rust-tools.nvim",
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        -- lua
        "lua_ls",
        -- typescript
        "tsserver",
        -- python
        "pyright",
        "ruff_lsp",
        -- golang
        "gopls",
        -- toml
        "taplo",
        -- rust
        "rust_analyzer",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        -- lua
        "stylua",
        -- typescript
        "prettierd",
        "eslint_d",
        -- python
        "isort",
        "black",
        "pylint",
        -- golang
        "gomodifytags",
        "gofumpt",
        "iferr",
        "impl",
        "goimports",
        -- rust
        "rustfmt",
      },
      handlers = {
        taplo = function()
        end,                    -- disable taplo in null-ls, it's taken care of by lspconfig
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = { "python", "codelldb" },
    },
  },
  {
    -- This is needed for pylint to work in a virtualenv. See https://github.com/williamboman/mason.nvim/issues/668#issuecomment-1320859097
    "williamboman/mason.nvim",
    opts = {
      PATH = "append",
    },
  },
}
