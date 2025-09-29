return {
  -- LSP for Go
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        },
      },
    },
  },

  -- Mason: ensure Go tools are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",                    -- LSP
        "golangci-lint-langserver", -- Linter
        "delve",                    -- Debugger
        "goimports",                -- Formatter
      },
    },
  },

  -- Formatter
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofmt" },
      },
    },
  },

  -- Linter
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangci-lint" },
      },
    },
  },

  -- Debugger (DAP)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
    },
    opts = function(_, opts)
      require("dap-go").setup()
    end,
  },
}
