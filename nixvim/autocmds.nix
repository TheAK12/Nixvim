{
  programs.nixvim = {
    autoGroups = {
      HighlightYank.clear = true;
      AutoResize.clear = true;
      TrailingWhitespace.clear = true;
      RestoreCursor.clear = true;
      CloseWithQ.clear = true;
      CheckOutsideChange.clear = true;
    };

    autoCmd = [
      # Highlight text on yank
      {
        event = [ "TextYankPost" ];
        group = "HighlightYank";
        callback.__raw = ''
          function()
            vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
          end
        '';
      }

      # Auto-resize splits when terminal is resized
      {
        event = [ "VimResized" ];
        group = "AutoResize";
        callback.__raw = ''
          function()
            local current_tab = vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd =")
            vim.cmd("tabnext " .. current_tab)
          end
        '';
      }

      # Remove trailing whitespace on save
      {
        event = [ "BufWritePre" ];
        group = "TrailingWhitespace";
        pattern = [ "*" ];
        callback.__raw = ''
          function()
            local save_cursor = vim.fn.getpos(".")
            vim.cmd([[%s/\s\+$//e]])
            vim.fn.setpos(".", save_cursor)
          end
        '';
      }

      # Restore cursor position when reopening a file
      {
        event = [ "BufReadPost" ];
        group = "RestoreCursor";
        callback.__raw = ''
          function(args)
            local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
            local lcount = vim.api.nvim_buf_line_count(args.buf)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
        '';
      }

      # Close certain filetypes with 'q'
      {
        event = [ "FileType" ];
        group = "CloseWithQ";
        pattern = [
          "help"
          "man"
          "notify"
          "qf"
          "checkhealth"
          "lspinfo"
          "spectre_panel"
          "startuptime"
          "dbout"
          "gitsigns.blame"
        ];
        callback.__raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
            vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
          end
        '';
      }

      # Check if file was changed outside of Neovim
      {
        event = [
          "FocusGained"
          "TermClose"
          "TermLeave"
        ];
        group = "CheckOutsideChange";
        command = "checktime";
      }
    ];
  };
}
