{
  programs.nixvim = {
    plugins = {
      # File explorer
      oil = {
        enable = true;
        settings = {
          default_file_explorer = true;
          delete_to_trash = true;
          skip_confirm_for_simple_edits = true;
          view_options = {
            show_hidden = true;
            is_hidden_file.__raw = ''
              function(name, _)
                return vim.startswith(name, "..")
              end
            '';
          };
          float = {
            border = "rounded";
            padding = 2;
            max_width = 90;
            max_height = 30;
            win_options = {
              winblend = 10;
            };
          };
          keymaps = {
            "q" = "actions.close";
            "<C-p>" = false;
          };
        };
      };

      # Fuzzy finder
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          ui-select.enable = true;
        };
        settings = {
          defaults = {
            layout_strategy = "horizontal";
            layout_config = {
              horizontal = {
                prompt_position = "top";
                preview_width = 0.55;
                results_width = 0.8;
              };
              vertical = {
                mirror = false;
              };
              width = 0.87;
              height = 0.80;
              preview_cutoff = 120;
            };
            sorting_strategy = "ascending";
            prompt_prefix = "   ";
            selection_caret = "  ";
            entry_prefix = "  ";
            path_display = [ "truncate" ];
            winblend = 10;
            file_ignore_patterns = [
              "node_modules"
              ".git/"
              "dist/"
              "build/"
              "target/"
              "__pycache__/"
              "%.lock"
            ];
            borderchars = [
              "─"
              "│"
              "─"
              "│"
              "╭"
              "╮"
              "╯"
              "╰"
            ];
            results_title = false;
            color_devicons = true;
          };
          pickers = {
            buffers = {
              theme = "dropdown";
              previewer = false;
              sort_lastused = true;
              sort_mru = true;
            };
            spell_suggest = {
              theme = "cursor";
            };
            colorscheme = {
              enable_preview = true;
            };
          };
        };
      };

      # Project detection
      project-nvim = {
        enable = true;
        settings = {
          manual_mode = false;
          use_lsp = true;
          patterns = [
            ".git"
            "flake.nix"
            "package.json"
            "pyproject.toml"
            "Cargo.toml"
            "go.mod"
            "Makefile"
          ];
        };
      };

      # Sessions
      auto-session = {
        enable = true;
        settings = {
          auto_restore = false;
          auto_save = true;
          auto_create = true;
          suppressed_dirs = [
            "~/"
            "/"
          ];
          session_lens = {
            load_on_setup = true;
          };
        };
      };

      # Terminal
      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          float_opts = {
            border = "rounded";
            winblend = 10;
            width.__raw = ''
              function()
                return math.floor(vim.o.columns * 0.85)
              end
            '';
            height.__raw = ''
              function()
                return math.floor(vim.o.lines * 0.85)
              end
            '';
          };
          highlights = {
            FloatBorder = {
              link = "FloatBorder";
            };
          };
        };
      };
    };
  };
}
