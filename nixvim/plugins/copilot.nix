{
  programs.nixvim = {
    plugins = {
      # GitHub Copilot
      copilot-lua = {
        enable = true;
        settings = {
          suggestion = {
            # Disabled in favor of blink-cmp integration
            enabled = false;
          };
          panel = {
            enabled = true;
            auto_refresh = true;
            keymap = {
              open = "<M-CR>";
              accept = "<CR>";
              jump_prev = "[[";
              jump_next = "]]";
              refresh = "gr";
            };
            layout = {
              position = "bottom";
              ratio = 0.4;
            };
          };
          filetypes = {
            markdown = true;
            help = false;
            gitcommit = true;
            gitrebase = false;
            "." = false;
          };
        };
      };

      # Copilot as a completion source for blink-cmp
      blink-copilot = {
        enable = true;
      };
    };
  };
}
