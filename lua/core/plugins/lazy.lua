local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "ellisonleao/gruvbox.nvim",
    event = "VimEnter",
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "n",
        },
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`
        default_file_explorer = true,
        -- Restore window options to previous values when leaving an oil buffer
        restore_win_options = true,
        -- Skip the confirmation popup for simple operations
        skip_confirm_for_simple_edits = false,
        -- Deleted files will be removed with the trash_command (below).
        delete_to_trash = false,
        -- Change this to customize the command used when deleting to trash
        trash_command = "trash-put",
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        prompt_save_on_select_new_entry = true,
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", nowait = true })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-s>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["g."] = "actions.toggle_hidden",
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = false,
          -- This function defines what is considered a "hidden" file
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          is_always_hidden = function(name, bufnr)
            return false
          end,
        },
        -- Configuration for the floating window in oil.open_float
        float = {
          -- Padding around the floating window
          padding = 2,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 10,
          },
        },
        -- Configuration for the actions floating preview window
        preview = {
          -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a single value or a list of mixed integer/float types.
          -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
          max_width = 0.9,
          -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
          min_width = { 40, 0.4 },
          -- optionally define an integer/float for the exact width of the preview window
          width = nil,
          -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_height and max_height can be a single value or a list of mixed integer/float types.
          -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
          max_height = 0.9,
          -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
          min_height = { 5, 0.1 },
          -- optionally define an integer/float for the exact height of the preview window
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        -- Configuration for the floating progress window
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })
      vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end,
  },
  {
    "tpope/vim-commentary",
  },
  {
    "tpope/vim-fugitive",
    cmd = { "G" },
  },
  {
    "tpope/vim-unimpaired",
  },
  { "williamboman/mason.nvim" }, -- Optional
  { "williamboman/mason-lspconfig.nvim" }, -- Optional
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("core.plugin_configs.lsp")
    end,
    -- dependencies = {},
  },
  { "SirVer/ultisnips" },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("core.plugin_configs.cmp")
    end,
    dependencies = {
      { "quangnguyen30192/cmp-nvim-ultisnips" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.plugin_configs.dap.dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("core.plugin_configs.dap.dap-ui")
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.0",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    lazy = true,
    cmd = { "Telescope", "Telescope find_files", "Telescope live_grep", "Telescope buffers", "Telescope help_tags" },
    config = function()
      require("core.plugin_configs.telescope")
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    keys = { "<leader>dcc", "<leader>dco" },
    config = function()
      require("core.plugin_configs.dap.telescope-dap")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = { "go", "gomod", "gowork", "gotmpl" },
    config = function()
      require("core.plugin_configs.dap.go")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufWinEnter",
    config = function()
      require("core.plugin_configs.treesitter")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("core.plugin_configs.nvim-autopairs")
    end,
  },
  {
    "fatih/vim-go",
    ft = { "go", "gomod", "gowork", "gotmpl" },
    config = function()
      require("core.plugin_configs.vimgo")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      require("core.plugin_configs.lualine")
    end,
    requires = {
      {
        "kyazdani42/nvim-web-devicons",
      },
    },
  },
  {
    "ziglang/zig",
    ft = "zig",
    config = function()
      require("core.plugin_configs.zig")
    end,
  },
  {
    "ziglang/zig.vim",
    ft = "zig",
  },
  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm" },
    config = function()
      require("toggleterm").setup()
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "cshuaimin/ssr.nvim",
    -- init is always executed during startup, but doesn't load the plugin yet.
    init = function()
      vim.keymap.set({ "n", "x" }, "<leader>sr", function()
        -- this require will automatically load the plugin
        require("ssr").open()
      end, { desc = "Structural Replace" })
    end,
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    config = function()
      require("dap-vscode-js").setup({
        debugger_path = "/Users/mbp183/.local/share/nvim/mason/packages/js-debug-adapter",
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
      })

      for _, language in ipairs({ "typescript", "javascript" }) do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
              "./node_modules/jest/bin/jest.js",
              "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
        }
      end
    end,
  },
  {
    "DanielGavin/ols",
    config = function() end,
  },
  {
    "leafOfTree/vim-svelte-plugin",
    config = function() end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.opt.termguicolors = true
      vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]])
      vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]])

      require("indent_blankline").setup({
        char = "",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        },
        space_char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
        },
        show_trailing_blankline_indent = false,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          json = { "prettierd" },
          yaml = { "prettierd" },
          proto = { "buf" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timout_ms = 500,
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        json = { "eslint_d" },
        yaml = { "eslint_d" },
        proto = { "buf" },
      }
      local lint_aug = vim.api.nvim_create_augroup("lint", {
        clear = true,
      })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_aug,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
})
