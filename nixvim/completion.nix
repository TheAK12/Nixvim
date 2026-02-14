{
  programs.nixvim = {
    plugins = {
      blink-cmp = {
        enable = true;
        settings = {
          keymap = {
            preset = "default";
            "<CR>" = [
              "accept"
              "fallback"
            ];
            "<Tab>" = [
              "select_next"
              "fallback"
            ];
            "<S-Tab>" = [
              "select_prev"
              "fallback"
            ];
            "<C-l>" = [
              "snippet_forward"
              "fallback"
            ];
            "<C-h>" = [
              "snippet_backward"
              "fallback"
            ];
          };
          completion = {
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 200;
              window = {
                border = "rounded";
                winblend = 10;
              };
            };
            ghost_text = {
              enabled = true;
            };
            menu = {
              border = "rounded";
              winblend = 10;
              draw = {
                treesitter = [ "lsp" ];
                columns.__raw = ''
                  {
                    { "kind_icon" },
                    { "label", gap = 1, "label_description" },
                    { "source_name" },
                  }
                '';
              };
            };
          };
          appearance = {
            nerd_font_variant = "mono";
            kind_icons = {
              Text = "󰉿";
              Method = "󰊕";
              Function = "󰊕";
              Constructor = "󰒓";
              Field = "󰜢";
              Variable = "󰀫";
              Class = "󰠱";
              Interface = "";
              Module = "󰏗";
              Property = "";
              Unit = "";
              Value = "󰎠";
              Enum = "";
              Keyword = "󰌋";
              Snippet = "";
              Color = "󰏘";
              File = "󰈙";
              Reference = "";
              Folder = "󰉋";
              EnumMember = "";
              Constant = "󰏿";
              Struct = "󰙅";
              Event = "";
              Operator = "󰆕";
              TypeParameter = "󰅲";
              Copilot = "";
            };
          };
          sources = {
            default = [
              "lsp"
              "copilot"
              "path"
              "snippets"
              "buffer"
            ];
            providers = {
              copilot = {
                name = "copilot";
                module = "blink-copilot";
                score_offset = 100;
                async = true;
              };
            };
          };
          snippets.preset = "luasnip";
          signature.enabled = true;
          fuzzy.implementation = "prefer_rust_with_warning";
        };
      };

      luasnip.enable = true;
      friendly-snippets.enable = true;

      # Database completion
      vim-dadbod.enable = true;
      vim-dadbod-ui.enable = true;
      vim-dadbod-completion.enable = true;
    };
  };
}
