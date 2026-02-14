{
  programs.nixvim = {
    plugins = {
      # Motion / jumping
      flash = {
        enable = true;
        settings = {
          jump.autojump = true;
          label = {
            uppercase = false;
            rainbow = {
              enabled = true;
              shade = 5;
            };
          };
          modes = {
            char = {
              enabled = true;
              jump_labels = true;
            };
            search = {
              enabled = false;
            };
          };
          highlight = {
            backdrop = true;
          };
        };
      };

      # Surround operations
      vim-surround.enable = true;

      # Comments
      comment.enable = true;

      # TODO/FIXME/HACK highlighting
      todo-comments.enable = true;

      # Auto pairs
      nvim-autopairs = {
        enable = true;
        settings = {
          check_ts = true;
          fast_wrap = {
            enable = true;
            map = "<M-e>";
          };
        };
      };

      # Better quickfix
      nvim-bqf.enable = true;

      # Auto-detect indentation
      guess-indent = {
        enable = true;
      };

      # Buffer removal without breaking layout
      mini = {
        enable = true;
        modules = {
          bufremove = { };
        };
      };

      # Undo tree visualization
      undotree = {
        enable = true;
        settings = {
          SetFocusWhenToggle = true;
          WindowLayout = 3;
        };
      };

      # Markdown preview
      markdown-preview.enable = true;
    };
  };
}
