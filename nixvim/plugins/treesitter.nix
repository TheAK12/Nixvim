{
  programs.nixvim = {
    plugins = {
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
          incremental_selection = {
            enable = true;
            keymaps = {
              init_selection = "<C-space>";
              node_incremental = "<C-space>";
              scope_incremental = false;
              node_decremental = "<bs>";
            };
          };
        };
      };

      treesitter-context = {
        enable = true;
        settings = {
          max_lines = 3;
          multiline_threshold = 5;
        };
      };

      # Treesitter text objects (select/move/swap functions, classes, etc.)
      treesitter-textobjects = {
        enable = true;
        settings = {
          select = {
            enable = true;
            lookahead = true;
            keymaps = {
              "af" = "@function.outer";
              "if" = "@function.inner";
              "ac" = "@class.outer";
              "ic" = "@class.inner";
              "aa" = "@parameter.outer";
              "ia" = "@parameter.inner";
              "ai" = "@conditional.outer";
              "ii" = "@conditional.inner";
              "al" = "@loop.outer";
              "il" = "@loop.inner";
            };
          };
          move = {
            enable = true;
            set_jumps = true;
            goto_next_start = {
              "]f" = "@function.outer";
              "]c" = "@class.outer";
              "]a" = "@parameter.outer";
            };
            goto_next_end = {
              "]F" = "@function.outer";
              "]C" = "@class.outer";
            };
            goto_previous_start = {
              "[f" = "@function.outer";
              "[c" = "@class.outer";
              "[a" = "@parameter.outer";
            };
            goto_previous_end = {
              "[F" = "@function.outer";
              "[C" = "@class.outer";
            };
          };
          swap = {
            enable = true;
            swap_next = {
              "<leader>sn" = "@parameter.inner";
            };
            swap_previous = {
              "<leader>sp" = "@parameter.inner";
            };
          };
        };
      };

      rainbow-delimiters.enable = true;
    };
  };
}
