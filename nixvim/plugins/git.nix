{
  programs.nixvim = {
    plugins = {
      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = true;
          current_line_blame_opts = {
            delay = 300;
            virt_text_pos = "eol";
          };
          current_line_blame_formatter = "  <author>, <author_time:%R> - <summary>";
          signcolumn = true;
          signs = {
            add = {
              text = "▎";
            };
            change = {
              text = "▎";
            };
            delete = {
              text = "";
            };
            topdelete = {
              text = "";
            };
            changedelete = {
              text = "▎";
            };
            untracked = {
              text = "▎";
            };
          };
          signs_staged = {
            add = {
              text = "▎";
            };
            change = {
              text = "▎";
            };
            delete = {
              text = "";
            };
            topdelete = {
              text = "";
            };
            changedelete = {
              text = "▎";
            };
          };
          preview_config = {
            border = "rounded";
          };
        };
      };

      diffview.enable = true;
    };
  };
}
