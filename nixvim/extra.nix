{ config, ... }:
{
  programs.nixvim = {
    extraConfigLua = ''
      -- ── Diagnostics config (modern API) ──────────────────────
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          spacing = 2,
          format = function(d)
            local icons = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.HINT] = " ",
              [vim.diagnostic.severity.INFO] = " ",
            }
            return (icons[d.severity] or "") .. d.message
          end,
        },
        update_in_insert = false,
        severity_sort = true,
        underline = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        float = {
          border = "rounded",
          source = "if_many",
          header = "",
          prefix = function(d)
            local icons = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.HINT] = " ",
              [vim.diagnostic.severity.INFO] = " ",
            }
            return icons[d.severity] or "● ", "DiagnosticSign" .. ({ "Error", "Warn", "Hint", "Info" })[d.severity]
          end,
        },
      })

      -- ── Float winblend for subtle transparency ────────────────
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#${config.lib.stylix.colors.base00}" })
      vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#${config.lib.stylix.colors.base0D}", bg = "#${config.lib.stylix.colors.base00}" })

      -- ── Subtle ColorColumn ────────────────────────────────────
      vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#${config.lib.stylix.colors.base01}" })

      -- ── Telescope highlights (Catppuccin accents) ─────────────
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#${config.lib.stylix.colors.base0D}", bg = "#${config.lib.stylix.colors.base00}" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#${config.lib.stylix.colors.base0E}", bg = "#${config.lib.stylix.colors.base00}" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#${config.lib.stylix.colors.base0D}", bg = "#${config.lib.stylix.colors.base00}" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#${config.lib.stylix.colors.base0B}", bg = "#${config.lib.stylix.colors.base00}" })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = "#${config.lib.stylix.colors.base00}", bg = "#${config.lib.stylix.colors.base0E}", bold = true })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = "#${config.lib.stylix.colors.base00}", bg = "#${config.lib.stylix.colors.base0D}", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = "#${config.lib.stylix.colors.base00}", bg = "#${config.lib.stylix.colors.base0B}", bold = true })
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = "#${config.lib.stylix.colors.base0E}" })
      vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = "#${config.lib.stylix.colors.base0E}" })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#${config.lib.stylix.colors.base02}", bold = true })

      -- ── Pmenu / CursorLine / WinSeparator ─────────────────────
      vim.api.nvim_set_hl(0, "Pmenu", { bg = "#${config.lib.stylix.colors.base00}" })
      vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#${config.lib.stylix.colors.base02}", bold = true })
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#${config.lib.stylix.colors.base02}" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#${config.lib.stylix.colors.base0E}", bold = true })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "#${config.lib.stylix.colors.base01}" })
      vim.api.nvim_set_hl(0, "Visual", { bg = "#${config.lib.stylix.colors.base02}" })
      vim.api.nvim_set_hl(0, "QuickFixLine", { bg = "#${config.lib.stylix.colors.base01}", bold = true })

      -- ── Flash label highlight (high contrast) ─────────────────
      vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#${config.lib.stylix.colors.base00}", bg = "#${config.lib.stylix.colors.base0E}", bold = true })
      vim.api.nvim_set_hl(0, "FlashCurrent", { fg = "#${config.lib.stylix.colors.base00}", bg = "#${config.lib.stylix.colors.base0A}", bold = true })
      vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#${config.lib.stylix.colors.base0D}", bg = "#${config.lib.stylix.colors.base01}" })

      -- ── Winbar / Navic icon highlights ────────────────────────
      vim.api.nvim_set_hl(0, "NavicSeparator", { fg = "#${config.lib.stylix.colors.base04}" })
      vim.api.nvim_set_hl(0, "NavicText", { fg = "#${config.lib.stylix.colors.base05}" })
      vim.api.nvim_set_hl(0, "NavicIconsFile", { fg = "#${config.lib.stylix.colors.base05}" })
      vim.api.nvim_set_hl(0, "NavicIconsModule", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsNamespace", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsPackage", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsClass", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsMethod", { fg = "#${config.lib.stylix.colors.base0D}" })
      vim.api.nvim_set_hl(0, "NavicIconsProperty", { fg = "#${config.lib.stylix.colors.base0B}" })
      vim.api.nvim_set_hl(0, "NavicIconsField", { fg = "#${config.lib.stylix.colors.base0B}" })
      vim.api.nvim_set_hl(0, "NavicIconsConstructor", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsEnum", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsInterface", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsFunction", { fg = "#${config.lib.stylix.colors.base0D}" })
      vim.api.nvim_set_hl(0, "NavicIconsVariable", { fg = "#${config.lib.stylix.colors.base0E}" })
      vim.api.nvim_set_hl(0, "NavicIconsConstant", { fg = "#${config.lib.stylix.colors.base09}" })
      vim.api.nvim_set_hl(0, "NavicIconsString", { fg = "#${config.lib.stylix.colors.base0B}" })
      vim.api.nvim_set_hl(0, "NavicIconsNumber", { fg = "#${config.lib.stylix.colors.base09}" })
      vim.api.nvim_set_hl(0, "NavicIconsBoolean", { fg = "#${config.lib.stylix.colors.base09}" })
      vim.api.nvim_set_hl(0, "NavicIconsArray", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsObject", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsKey", { fg = "#${config.lib.stylix.colors.base0E}" })
      vim.api.nvim_set_hl(0, "NavicIconsNull", { fg = "#${config.lib.stylix.colors.base09}" })
      vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { fg = "#${config.lib.stylix.colors.base0B}" })
      vim.api.nvim_set_hl(0, "NavicIconsStruct", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsEvent", { fg = "#${config.lib.stylix.colors.base0A}" })
      vim.api.nvim_set_hl(0, "NavicIconsOperator", { fg = "#${config.lib.stylix.colors.base05}" })
      vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { fg = "#${config.lib.stylix.colors.base0A}" })

      -- ── Lazygit terminal integration ─────────────────────────
      local ok_tt, Terminal = pcall(function()
        return require("toggleterm.terminal").Terminal
      end)
      if ok_tt and Terminal then
        local lazygit = Terminal:new({
          cmd = "lazygit",
          hidden = true,
          direction = "float",
          float_opts = {
            border = "rounded",
            width = function() return math.floor(vim.o.columns * 0.9) end,
            height = function() return math.floor(vim.o.lines * 0.9) end,
          },
          on_open = function(term)
            vim.cmd("startinsert!")
          end,
        })
        function _Lazygit_toggle()
          lazygit:toggle()
        end
      else
        function _Lazygit_toggle()
          vim.notify("toggleterm not available", vim.log.levels.WARN)
        end
      end

      -- ── Telescope projects extension ─────────────────────────
      pcall(function()
        require("telescope").load_extension("projects")
      end)

      -- ── DAP: codelldb adapter for C/C++/Rust ─────────────────
      local ok_dap, dap = pcall(require, "dap")
      if ok_dap then
        dap.adapters.codelldb = {
          type = "server",
          port = "''${port}",
          executable = {
            command = "codelldb",
            args = { "--port", "''${port}" },
          },
        }

        dap.configurations.c = {
          {
            name = "Launch (codelldb)",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "''${workspaceFolder}",
            stopOnEntry = false,
          },
        }
        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = dap.configurations.c

        -- DAP UI auto-open/close
        local ok_dapui, dapui = pcall(require, "dapui")
        if ok_dapui then
          dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
          dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
          dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
        end
      end

      -- ── Notify: set background colour for Stylix + assign vim.notify ──
      local ok_notify, notify = pcall(require, "notify")
      if ok_notify then
        notify.setup({
          background_colour = "#${config.lib.stylix.colors.base01}",
        })
        vim.notify = notify
      end

      -- ── Dashboard branding ───────────────────────────────────
      do
        local ok_alpha, alpha = pcall(require, "alpha")
        if ok_alpha then
          local dashboard = require("alpha.themes.dashboard")

          -- ── Header highlight groups (Catppuccin gradient) ──
          vim.api.nvim_set_hl(0, "AlphaHeader1", { fg = "#${config.lib.stylix.colors.base0E}" })
          vim.api.nvim_set_hl(0, "AlphaHeader2", { fg = "#${config.lib.stylix.colors.base0D}" })
          vim.api.nvim_set_hl(0, "AlphaHeader3", { fg = "#${config.lib.stylix.colors.base0C}" })
          vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#${config.lib.stylix.colors.base0D}" })
          vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#${config.lib.stylix.colors.base0E}", bold = true })
          vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#${config.lib.stylix.colors.base04}", italic = true })

          -- ── Static NIXVIM header ──
          local header_lines = {
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                  ╔═╗╦═╗╔═╗╔═╗╔╦╗╔═╗╔╦╗  ╦ ╦╦╔╦╗╦ ╦                 ]],
            [[                  ╠═╝║╠═╣║  ║╣  ║║║║╠╣║║  ║║║║ ║ ╠═╣                 ]],
            [[                  ╩  ╩╩ ╩╚═╝╚═╝═╩╝╩ ╩╩╩  ╚╩╝╩ ╩ ╩ ╩                 ]],
            [[                       N I X  +  N E O V I M                          ]],
            [[                                                                     ]],
          }

          -- Apply gradient highlight per line
          -- alpha expects hl as a list of { { "HlGroup", col_start, col_end } } per line
          local header_hls = {}
          for i, _ in ipairs(header_lines) do
            local group
            if i <= 3 then
              group = "AlphaHeader1"
            elseif i <= 8 then
              group = "AlphaHeader2"
            else
              group = "AlphaHeader3"
            end
            header_hls[i] = { { group, 0, -1 } }
          end

          dashboard.section.header.val = header_lines
          dashboard.section.header.opts = {
            hl = header_hls,
            position = "center",
          }

          -- ── Buttons with icons ──
          local button = dashboard.button
          dashboard.section.buttons.val = {
            button("f", "  Find file",       ":Telescope find_files<CR>"),
            button("r", "  Recent files",    ":Telescope oldfiles<CR>"),
            button("g", "󰺮  Live grep",       ":Telescope live_grep<CR>"),
            button("e", "  File browser",    ":Oil<CR>"),
            button("s", "  Sessions",        ":AutoSession search<CR>"),
            button("p", "  Projects",        ":Telescope projects<CR>"),
            button("c", "  Configuration",   ":e $MYVIMRC<CR>"),
            button("h", "󰋖  Health Check",     ":checkhealth<CR>"),
            button("q", "  Quit",             ":qa<CR>"),
          }
          for _, btn in ipairs(dashboard.section.buttons.val) do
            btn.opts.hl = "AlphaButtons"
            btn.opts.hl_shortcut = "AlphaShortcut"
          end

          -- ── Footer with stats ──
          dashboard.section.footer.val = ""
          dashboard.section.footer.opts.hl = "AlphaFooter"

          -- ── Layout with breathing room ──
          dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
          }

          dashboard.opts.opts.noautocmd = true
          alpha.setup(dashboard.config)

          -- Update footer on VimEnter with NixVim stats
          vim.api.nvim_create_autocmd("VimEnter", {
            once = true,
            callback = function()
              local plugins = vim.fn.globpath(vim.o.runtimepath, "pack/*/start/*", 0, 1)
              local v = vim.version()
              dashboard.section.footer.val = string.format(
                "⚡ NixVim │ %d plugins │ Neovim %d.%d.%d",
                #plugins, v.major, v.minor, v.patch
              )
              pcall(vim.cmd, "AlphaRedraw")
            end,
          })

          vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            callback = function()
              vim.opt_local.foldenable = false
              vim.opt_local.cursorline = false
            end,
          })
        end
      end

      -- ── Inc-rename setup for expression mapping ──────────────
      vim.keymap.set("n", "<leader>rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true, desc = "Incremental rename" })
    '';
  };
}
