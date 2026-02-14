{
  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = false;
        term_colors = true;
        dim_inactive = {
          enabled = false;
          shade = "dark";
          percentage = 0.12;
        };
        integrations = {
          alpha = true;
          blink_cmp = true;
          gitsigns = true;
          illuminate = true;
          indent_blankline = {
            enabled = true;
            scope_color = "mauve";
            colored_indent_levels = false;
          };
          markdown = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          native_lsp = {
            enabled = true;
            underlines = {
              errors = [ "undercurl" ];
              hints = [ "undercurl" ];
              warnings = [ "undercurl" ];
              information = [ "undercurl" ];
              ok = [ "undercurl" ];
            };
            inlay_hints = {
              background = true;
            };
          };
          navic = {
            enabled = true;
            custom_bg = "none";
          };
          noice = true;
          notify = true;
          telescope = {
            enabled = true;
          };
          treesitter = true;
          treesitter_context = true;
          trouble = true;
          which_key = true;
          flash = true;
          fzf = true;
          copilot_vim = true;
          fidget = true;
          dap = true;
          dap_ui = true;
          diffview = true;
        };
      };
    };

    plugins = {
      # Icons
      web-devicons.enable = true;

      # ── Statusline ─────────────────────────────────────────
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "catppuccin";
            globalstatus = true;
            component_separators = {
              left = "";
              right = "";
            };
            section_separators = {
              left = "";
              right = "";
            };
            disabled_filetypes = {
              statusline = [
                "alpha"
                "dashboard"
              ];
              winbar = [
                "alpha"
                "dashboard"
                "oil"
                "toggleterm"
                "Trouble"
                "dapui_scopes"
                "dapui_breakpoints"
                "dapui_stacks"
                "dapui_watches"
                "dap-repl"
              ];
            };
          };
          sections = {
            lualine_a = [ "mode" ];
            lualine_b = [
              "branch"
              {
                __unkeyed-1 = "diff";
                symbols = {
                  added = " ";
                  modified = " ";
                  removed = " ";
                };
              }
              "diagnostics"
            ];
            lualine_c = [
              {
                __unkeyed-1 = "filetype";
                icon_only = true;
                separator = "";
                padding = {
                  left = 1;
                  right = 0;
                };
              }
              {
                __unkeyed-1 = "filename";
                path = 1;
                symbols = {
                  modified = " ●";
                  readonly = " ";
                  unnamed = "[No Name]";
                  newfile = "[New]";
                };
              }
              {
                __unkeyed-1.__raw = ''
                  function()
                    local reg = vim.fn.reg_recording()
                    if reg ~= "" then return "  @" .. reg end
                    return ""
                  end
                '';
                color = {
                  fg = "#f38ba8";
                };
              }
            ];
            lualine_x = [
              {
                __unkeyed-1.__raw = ''
                  function()
                    local clients = vim.lsp.get_clients({ bufnr = 0 })
                    if #clients == 0 then return "" end
                    local names = {}
                    for _, c in ipairs(clients) do
                      table.insert(names, c.name)
                    end
                    return "  " .. table.concat(names, ", ")
                  end
                '';
                color = {
                  fg = "#89b4fa";
                };
              }
              {
                __unkeyed-1.__raw = ''
                  function()
                    local ok, _ = pcall(require, "copilot.api")
                    if ok then return " " end
                    return ""
                  end
                '';
                color = {
                  fg = "#a6e3a1";
                };
              }
              {
                __unkeyed-1.__raw = ''
                  function()
                    local count = vim.fn.wordcount()
                    if count.visual_chars then
                      return "SEL:" .. count.visual_chars
                    end
                    return ""
                  end
                '';
                color = {
                  fg = "#fab387";
                };
              }
              "encoding"
              "filetype"
            ];
            lualine_y = [
              {
                __unkeyed-1.__raw = ''
                  function()
                    local result = vim.fn.searchcount({ maxcount = 999, timeout = 500 })
                    if result.total and result.total > 0 then
                      return string.format("  %d/%d", result.current, result.total)
                    end
                    return ""
                  end
                '';
              }
              "progress"
            ];
            lualine_z = [ "location" ];
          };
          # ── Winbar with navic breadcrumbs ──
          winbar = {
            lualine_c = [
              {
                __unkeyed-1 = "navic";
                color_correction = "static";
                navic_opts = {
                  highlight = true;
                  depth_limit = 5;
                  separator = "  ";
                };
              }
            ];
          };
          inactive_winbar = {
            lualine_c = [
              {
                __unkeyed-1 = "filename";
                path = 1;
                color = {
                  fg = "#6c7086";
                };
              }
            ];
          };
        };
      };

      # ── Bufferline ─────────────────────────────────────────
      bufferline = {
        enable = true;
        settings.options = {
          diagnostics = "nvim_lsp";
          diagnostics_indicator.__raw = ''
            function(count, level)
              local icon = level:match("error") and " " or " "
              return " " .. icon .. count
            end
          '';
          separator_style = "slant";
          always_show_bufferline = true;
          show_close_icon = false;
          show_buffer_close_icons = false;
          indicator = {
            style = "underline";
          };
          offsets = [
            {
              filetype = "oil";
              text = "File Browser";
              highlight = "Directory";
              text_align = "left";
            }
            {
              filetype = "undotree";
              text = "Undo Tree";
              highlight = "Directory";
              text_align = "center";
            }
          ];
        };
      };

      # ── Indent guides ──────────────────────────────────────
      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            char = "▏";
            tab_char = "▏";
          };
          scope = {
            enabled = true;
            show_start = true;
            show_end = false;
            highlight = [
              "RainbowDelimiterRed"
              "RainbowDelimiterYellow"
              "RainbowDelimiterBlue"
              "RainbowDelimiterOrange"
              "RainbowDelimiterGreen"
              "RainbowDelimiterViolet"
              "RainbowDelimiterCyan"
            ];
          };
          exclude = {
            filetypes = [
              "help"
              "alpha"
              "dashboard"
              "Trouble"
              "toggleterm"
              "oil"
            ];
          };
        };
      };

      # ── Color previews ─────────────────────────────────────
      colorizer.enable = true;

      # ── Word highlighting ──────────────────────────────────
      illuminate.enable = true;

      # ── Notifications ──────────────────────────────────────
      notify = {
        enable = true;
        settings = {
          timeout = 2000;
          stages = "fade_in_slide_out";
          render = "wrapped-compact";
          max_width = 60;
          min_width = 30;
          top_down = true;
        };
      };

      # ── Command palette / messages ─────────────────────────
      noice = {
        enable = true;
        settings = {
          presets = {
            bottom_search = true;
            command_palette = true;
            long_message_to_split = true;
            inc_rename = true;
            lsp_doc_border = true;
          };
          lsp = {
            override = {
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
              "cmp.entry.get_documentation" = true;
            };
            hover = {
              enabled = true;
              silent = true;
            };
            signature = {
              enabled = true;
            };
          };
          views = {
            cmdline_popup = {
              position = {
                row = 5;
                col = "50%";
              };
              size = {
                width = 60;
                height = "auto";
              };
              border = {
                style = "rounded";
              };
            };
            popupmenu = {
              relative = "editor";
              position = {
                row = 8;
                col = "50%";
              };
              size = {
                width = 60;
                height = 10;
              };
              border = {
                style = "rounded";
              };
            };
          };
        };
      };

      # ── Keybinding hints ───────────────────────────────────
      which-key = {
        enable = true;
        settings = {
          preset = "modern";
          spec = [
            {
              __unkeyed-1 = "<leader>f";
              group = " Find";
            }
            {
              __unkeyed-1 = "<leader>g";
              group = "󰊢 Git";
            }
            {
              __unkeyed-1 = "<leader>b";
              group = "󰓩 Buffers";
            }
            {
              __unkeyed-1 = "<leader>d";
              group = " Debug";
            }
            {
              __unkeyed-1 = "<leader>x";
              group = "󰒡 Diagnostics";
            }
            {
              __unkeyed-1 = "<leader>c";
              group = " Code/Copilot";
            }
            {
              __unkeyed-1 = "<leader>s";
              group = "󰓡 Swap";
            }
            {
              __unkeyed-1 = "<leader>D";
              group = " Database";
            }
            {
              __unkeyed-1 = "<leader>w";
              group = " Window/Save";
            }
            {
              __unkeyed-1 = "<leader>u";
              group = "󰔡 UI/Toggle";
            }
            {
              __unkeyed-1 = "<leader>t";
              group = " Terminal/Tab";
            }
            {
              __unkeyed-1 = "<leader>q";
              group = "󰗼 Quit";
            }
            {
              __unkeyed-1 = "<leader>r";
              group = "󰑕 Rename";
            }
            {
              __unkeyed-1 = "<leader>h";
              group = "󰋖 Help";
            }
          ];
        };
      };

      # ── Better UI elements ─────────────────────────────────
      dressing = {
        enable = true;
        settings = {
          input = {
            enabled = true;
            border = "rounded";
            win_options = {
              winblend = 10;
            };
          };
          select = {
            enabled = true;
          };
        };
      };

      # ── Dashboard ──────────────────────────────────────────
      # NOTE: alpha is loaded via extraPlugins in default.nix
      # and configured entirely in extraConfigLua to avoid
      # nixvim calling alpha.setup({}) with empty/default config.

      # ── Incremental rename with live preview ───────────────
      inc-rename = {
        enable = true;
      };

      # ── LSP progress indicator ─────────────────────────────
      fidget = {
        enable = true;
        settings = {
          notification = {
            window = {
              winblend = 0;
              border = "rounded";
              x_padding = 1;
              y_padding = 0;
              align = "bottom";
            };
            override_vim_notify = false;
          };
          progress = {
            display = {
              render_limit = 5;
              done_ttl = 2;
              progress_icon = {
                pattern = "dots";
                period = 1;
              };
            };
          };
        };
      };
    };
  };
}
