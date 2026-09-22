return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      ensure_installed = {
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-lspconfig.nvim" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local root_pattern = require("lspconfig.util").root_pattern

      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end

      local servers = {
      pyright = {
        root_dir = function(bufnr, on_dir)
          local fname = vim.api.nvim_buf_get_name(bufnr)
          local root = root_pattern(".git", "pyproject.toml", "setup.py", "setup.cfg")(fname)
          on_dir(root or vim.fs.dirname(fname))
        end,
      },
        lua_ls = {
          settings = {
            Lua = { diagnostics = { globals = { "vim" } } },
          },
        },
        kotlin_language_server = {},
        jdtls = {},
        clangd = {},
        csharp_ls = {},
        ts_ls = {},
        html = {},
        cssls = {},
        nixd = {},
      }

      for name, cfg in pairs(servers) do
        vim.lsp.config(name, vim.tbl_deep_extend("force", {
          on_attach = on_attach,
          capabilities = capabilities,
        }, cfg))
        vim.lsp.enable(name)
      end

      -- qmlls: not mason-managed, comes from Qt itself
      vim.lsp.config("qmlls", {
        cmd = { "qmlls" },
        filetypes = { "qml" },
        root_dir = root_pattern(".git"),
        on_attach = on_attach,
        capabilities = capabilities,
      })
      vim.lsp.enable("qmlls")
    end,
  },
}
