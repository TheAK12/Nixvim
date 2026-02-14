{
  programs.nixvim = {
    keymaps = [
      # ── Better defaults ──────────────────────────────────────
      {
        key = "jk";
        mode = [ "i" ];
        action = "<ESC>";
        options.desc = "Exit insert mode";
      }
      {
        key = "<Esc>";
        mode = [ "n" ];
        action = "<cmd>nohlsearch<CR>";
        options.desc = "Clear search highlight";
      }

      # ── Window navigation ────────────────────────────────────
      {
        key = "<C-h>";
        mode = [ "n" ];
        action = "<C-w>h";
        options.desc = "Move to left window";
      }
      {
        key = "<C-j>";
        mode = [ "n" ];
        action = "<C-w>j";
        options.desc = "Move to lower window";
      }
      {
        key = "<C-k>";
        mode = [ "n" ];
        action = "<C-w>k";
        options.desc = "Move to upper window";
      }
      {
        key = "<C-l>";
        mode = [ "n" ];
        action = "<C-w>l";
        options.desc = "Move to right window";
      }

      # ── Window resizing ──────────────────────────────────────
      {
        key = "<C-Up>";
        mode = [ "n" ];
        action = "<cmd>resize +2<CR>";
        options.desc = "Increase window height";
      }
      {
        key = "<C-Down>";
        mode = [ "n" ];
        action = "<cmd>resize -2<CR>";
        options.desc = "Decrease window height";
      }
      {
        key = "<C-Left>";
        mode = [ "n" ];
        action = "<cmd>vertical resize -2<CR>";
        options.desc = "Decrease window width";
      }
      {
        key = "<C-Right>";
        mode = [ "n" ];
        action = "<cmd>vertical resize +2<CR>";
        options.desc = "Increase window width";
      }

      # ── Window / split management ────────────────────────────
      {
        key = "<leader>wv";
        mode = [ "n" ];
        action = "<cmd>vsplit<CR>";
        options.desc = "Vertical split";
      }
      {
        key = "<leader>ws";
        mode = [ "n" ];
        action = "<cmd>split<CR>";
        options.desc = "Horizontal split";
      }
      {
        key = "<leader>wc";
        mode = [ "n" ];
        action = "<cmd>close<CR>";
        options.desc = "Close window";
      }
      {
        key = "<leader>wo";
        mode = [ "n" ];
        action = "<cmd>only<CR>";
        options.desc = "Close other windows";
      }
      {
        key = "<leader>w=";
        mode = [ "n" ];
        action = "<C-w>=";
        options.desc = "Equalize windows";
      }
      {
        key = "<leader>ww";
        mode = [ "n" ];
        action = "<cmd>w<CR>";
        options.desc = "Save file";
      }
      {
        key = "<leader>wa";
        mode = [ "n" ];
        action = "<cmd>wa<CR>";
        options.desc = "Save all files";
      }

      # ── Buffer cycling ───────────────────────────────────────
      {
        key = "<S-h>";
        mode = [ "n" ];
        action = "<cmd>BufferLineCyclePrev<CR>";
        options.desc = "Previous buffer";
      }
      {
        key = "<S-l>";
        mode = [ "n" ];
        action = "<cmd>BufferLineCycleNext<CR>";
        options.desc = "Next buffer";
      }
      {
        key = "<leader>bp";
        mode = [ "n" ];
        action = "<cmd>BufferLineTogglePin<CR>";
        options.desc = "Pin buffer";
      }

      # ── Move lines ──────────────────────────────────────────
      {
        key = "<A-j>";
        mode = [ "n" ];
        action = "<cmd>m .+1<CR>==";
        options.desc = "Move line down";
      }
      {
        key = "<A-k>";
        mode = [ "n" ];
        action = "<cmd>m .-2<CR>==";
        options.desc = "Move line up";
      }
      {
        key = "<A-j>";
        mode = [ "v" ];
        action = ":m '>+1<CR>gv=gv";
        options.desc = "Move selection down";
      }
      {
        key = "<A-k>";
        mode = [ "v" ];
        action = ":m '<-2<CR>gv=gv";
        options.desc = "Move selection up";
      }

      # ── Better visual paste (don't yank replaced text) ──────
      {
        key = "p";
        mode = [ "x" ];
        action = ''"_dP'';
        options.desc = "Paste without yanking";
      }

      # ── Better indenting ────────────────────────────────────
      {
        key = "<";
        mode = [ "v" ];
        action = "<gv";
        options.desc = "Indent left and reselect";
      }
      {
        key = ">";
        mode = [ "v" ];
        action = ">gv";
        options.desc = "Indent right and reselect";
      }

      # ── Telescope ───────────────────────────────────────────
      {
        key = "<leader>ff";
        mode = [ "n" ];
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Find files";
      }
      {
        key = "<leader>fg";
        mode = [ "n" ];
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "Live grep";
      }
      {
        key = "<leader>fw";
        mode = [ "n" ];
        action = "<cmd>Telescope grep_string<CR>";
        options.desc = "Find word under cursor";
      }
      {
        key = "<leader>fo";
        mode = [ "n" ];
        action = "<cmd>Telescope oldfiles<CR>";
        options.desc = "Recent files";
      }
      {
        key = "<leader>fb";
        mode = [ "n" ];
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "Find buffers";
      }
      {
        key = "<leader>fh";
        mode = [ "n" ];
        action = "<cmd>Telescope help_tags<CR>";
        options.desc = "Help tags";
      }
      {
        key = "<leader>fr";
        mode = [ "n" ];
        action = "<cmd>Telescope resume<CR>";
        options.desc = "Resume last search";
      }
      {
        key = "<leader>fd";
        mode = [ "n" ];
        action = "<cmd>Telescope diagnostics<CR>";
        options.desc = "Find diagnostics";
      }
      {
        key = "<leader>fk";
        mode = [ "n" ];
        action = "<cmd>Telescope keymaps<CR>";
        options.desc = "Find keymaps";
      }
      {
        key = "<leader>fp";
        mode = [ "n" ];
        action = "<cmd>Telescope projects<CR>";
        options.desc = "Find projects";
      }

      # ── Explorer (Oil) ─────────────────────────────────────
      {
        key = "<leader>e";
        mode = [ "n" ];
        action = "<cmd>Oil<CR>";
        options.desc = "Open parent directory (Oil)";
      }

      # ── Flash jump ─────────────────────────────────────────
      {
        key = "s";
        mode = [
          "n"
          "x"
          "o"
        ];
        action = "<cmd>lua require('flash').jump()<CR>";
        options.desc = "Flash jump";
      }
      {
        key = "S";
        mode = [
          "n"
          "x"
          "o"
        ];
        action = "<cmd>lua require('flash').treesitter()<CR>";
        options.desc = "Flash treesitter";
      }

      # ── Sessions ───────────────────────────────────────────
      {
        key = "<leader>fs";
        mode = [ "n" ];
        action = "<cmd>AutoSession search<CR>";
        options.desc = "Find sessions";
      }

      # ── Terminal ───────────────────────────────────────────
      {
        key = "<leader>tt";
        mode = [ "n" ];
        action = "<cmd>ToggleTerm<CR>";
        options.desc = "Toggle terminal";
      }

      # ── Terminal mode keymaps ──────────────────────────────
      {
        key = "<Esc><Esc>";
        mode = [ "t" ];
        action = "<C-\\><C-n>";
        options.desc = "Exit terminal mode";
      }
      {
        key = "<C-h>";
        mode = [ "t" ];
        action = "<C-\\><C-n><C-w>h";
        options.desc = "Move to left window (term)";
      }
      {
        key = "<C-j>";
        mode = [ "t" ];
        action = "<C-\\><C-n><C-w>j";
        options.desc = "Move to lower window (term)";
      }
      {
        key = "<C-k>";
        mode = [ "t" ];
        action = "<C-\\><C-n><C-w>k";
        options.desc = "Move to upper window (term)";
      }
      {
        key = "<C-l>";
        mode = [ "t" ];
        action = "<C-\\><C-n><C-w>l";
        options.desc = "Move to right window (term)";
      }

      # ── Tab management ─────────────────────────────────────
      {
        key = "<leader>tn";
        mode = [ "n" ];
        action = "<cmd>tabnew<CR>";
        options.desc = "New tab";
      }
      {
        key = "<leader>tc";
        mode = [ "n" ];
        action = "<cmd>tabclose<CR>";
        options.desc = "Close tab";
      }
      {
        key = "]t";
        mode = [ "n" ];
        action = "<cmd>tabnext<CR>";
        options.desc = "Next tab";
      }
      {
        key = "[t";
        mode = [ "n" ];
        action = "<cmd>tabprevious<CR>";
        options.desc = "Previous tab";
      }

      # ── Lazygit ────────────────────────────────────────────
      {
        key = "<leader>gg";
        mode = [ "n" ];
        action = "<cmd>lua _Lazygit_toggle()<CR>";
        options.desc = "Lazygit";
      }

      # ── Buffer management ──────────────────────────────────
      {
        key = "<leader>bd";
        mode = [ "n" ];
        action = "<cmd>lua require('mini.bufremove').delete(0, false)<CR>";
        options.desc = "Delete buffer (keep layout)";
      }
      {
        key = "<leader>bD";
        mode = [ "n" ];
        action = "<cmd>lua require('mini.bufremove').delete(0, true)<CR>";
        options.desc = "Force delete buffer";
      }

      # ── Comments ───────────────────────────────────────────
      {
        key = "<leader>/";
        mode = [ "n" ];
        action = "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>";
        options.desc = "Toggle comment line";
      }
      {
        key = "<leader>/";
        mode = [ "v" ];
        action = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>";
        options.desc = "Toggle comment selection";
      }

      # ── Diagnostics (Trouble) ──────────────────────────────
      {
        key = "<leader>xx";
        mode = [ "n" ];
        action = "<cmd>Trouble diagnostics toggle<CR>";
        options.desc = "Diagnostics (Trouble)";
      }
      {
        key = "<leader>xX";
        mode = [ "n" ];
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<CR>";
        options.desc = "Buffer diagnostics (Trouble)";
      }
      {
        key = "<leader>xq";
        mode = [ "n" ];
        action = "<cmd>Trouble qflist toggle<CR>";
        options.desc = "Quickfix (Trouble)";
      }
      {
        key = "<leader>xl";
        mode = [ "n" ];
        action = "<cmd>Trouble loclist toggle<CR>";
        options.desc = "Location list (Trouble)";
      }

      # ── UI Toggles ────────────────────────────────────────
      {
        key = "<leader>uh";
        mode = [ "n" ];
        action = "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>";
        options.desc = "Toggle inlay hints";
      }
      {
        key = "<leader>us";
        mode = [ "n" ];
        action = "<cmd>set spell!<CR>";
        options.desc = "Toggle spell check";
      }
      {
        key = "<leader>un";
        mode = [ "n" ];
        action = "<cmd>lua require('notify').dismiss({ silent = true, pending = true })<CR>";
        options.desc = "Dismiss notifications";
      }
      {
        key = "z=";
        mode = [ "n" ];
        action = "<cmd>Telescope spell_suggest<CR>";
        options.desc = "Spell suggestions";
      }

      # ── Format ─────────────────────────────────────────────
      {
        key = "<leader>cf";
        mode = [
          "n"
          "v"
        ];
        action.__raw = ''
          function()
            require("conform").format({ async = true, lsp_format = "fallback" })
          end
        '';
        options.desc = "Format buffer/selection";
      }
      {
        key = "<leader>uf";
        mode = [ "n" ];
        action.__raw = ''
          function()
            vim.g.disable_autoformat = not vim.g.disable_autoformat
            vim.notify(
              vim.g.disable_autoformat and "Format-on-save disabled" or "Format-on-save enabled",
              vim.log.levels.INFO
            )
          end
        '';
        options.desc = "Toggle format on save";
      }

      # ── Undo tree ──────────────────────────────────────────
      {
        key = "<leader>uu";
        mode = [ "n" ];
        action = "<cmd>UndotreeToggle<CR>";
        options.desc = "Toggle undo tree";
      }

      # ── Rename (inc-rename) is set via extraConfigLua (expression mapping) ──

      # ── Dadbod ─────────────────────────────────────────────
      {
        key = "<leader>Du";
        mode = [ "n" ];
        action = "<cmd>DBUI<CR>";
        options.desc = "Dadbod UI";
      }
      {
        key = "<leader>Df";
        mode = [ "n" ];
        action = "<cmd>DBUIFindBuffer<CR>";
        options.desc = "Dadbod find buffer";
      }
      {
        key = "<leader>Dr";
        mode = [ "n" ];
        action = "<cmd>DBUIRenameBuffer<CR>";
        options.desc = "Dadbod rename buffer";
      }

      # ── DAP ────────────────────────────────────────────────
      {
        key = "<F5>";
        mode = [ "n" ];
        action = "<cmd>lua require('dap').continue()<CR>";
        options.desc = "DAP continue";
      }
      {
        key = "<F10>";
        mode = [ "n" ];
        action = "<cmd>lua require('dap').step_over()<CR>";
        options.desc = "DAP step over";
      }
      {
        key = "<F11>";
        mode = [ "n" ];
        action = "<cmd>lua require('dap').step_into()<CR>";
        options.desc = "DAP step into";
      }
      {
        key = "<F12>";
        mode = [ "n" ];
        action = "<cmd>lua require('dap').step_out()<CR>";
        options.desc = "DAP step out";
      }
      {
        key = "<leader>db";
        mode = [ "n" ];
        action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
        options.desc = "DAP toggle breakpoint";
      }
      {
        key = "<leader>dB";
        mode = [ "n" ];
        action = "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>";
        options.desc = "DAP conditional breakpoint";
      }
      {
        key = "<leader>dui";
        mode = [ "n" ];
        action = "<cmd>lua require('dapui').toggle()<CR>";
        options.desc = "DAP UI toggle";
      }
      {
        key = "<leader>dr";
        mode = [ "n" ];
        action = "<cmd>lua require('dap').restart()<CR>";
        options.desc = "DAP restart";
      }
      {
        key = "<leader>dt";
        mode = [ "n" ];
        action = "<cmd>lua require('dap').terminate()<CR>";
        options.desc = "DAP terminate";
      }
      {
        key = "<leader>dl";
        mode = [ "n" ];
        action = "<cmd>lua require('dap').run_last()<CR>";
        options.desc = "DAP run last";
      }
      {
        key = "<leader>de";
        mode = [
          "n"
          "v"
        ];
        action = "<cmd>lua require('dapui').eval()<CR>";
        options.desc = "DAP eval expression";
      }

      # ── Git (gitsigns) ────────────────────────────────────
      {
        key = "]g";
        mode = [ "n" ];
        action = "<cmd>Gitsigns next_hunk<CR>";
        options.desc = "Next git hunk";
      }
      {
        key = "[g";
        mode = [ "n" ];
        action = "<cmd>Gitsigns prev_hunk<CR>";
        options.desc = "Previous git hunk";
      }
      {
        key = "<leader>gs";
        mode = [ "n" ];
        action = "<cmd>Gitsigns stage_hunk<CR>";
        options.desc = "Stage hunk";
      }
      {
        key = "<leader>gr";
        mode = [ "n" ];
        action = "<cmd>Gitsigns reset_hunk<CR>";
        options.desc = "Reset hunk";
      }
      {
        key = "<leader>gS";
        mode = [ "n" ];
        action = "<cmd>Gitsigns stage_buffer<CR>";
        options.desc = "Stage buffer";
      }
      {
        key = "<leader>gu";
        mode = [ "n" ];
        action = "<cmd>Gitsigns undo_stage_hunk<CR>";
        options.desc = "Undo stage hunk";
      }
      {
        key = "<leader>gp";
        mode = [ "n" ];
        action = "<cmd>Gitsigns preview_hunk<CR>";
        options.desc = "Preview hunk";
      }
      {
        key = "<leader>gb";
        mode = [ "n" ];
        action = "<cmd>Gitsigns blame_line<CR>";
        options.desc = "Blame line";
      }
      {
        key = "<leader>gd";
        mode = [ "n" ];
        action = "<cmd>DiffviewOpen<CR>";
        options.desc = "Open diffview";
      }
      {
        key = "<leader>gD";
        mode = [ "n" ];
        action = "<cmd>DiffviewClose<CR>";
        options.desc = "Close diffview";
      }

      # ── Help ───────────────────────────────────────────────
      {
        key = "<leader>h";
        mode = [ "n" ];
        action = ":help<Space>";
        options = {
          desc = "Help prompt";
          nowait = true;
        };
      }
      {
        key = "<leader>H";
        mode = [ "n" ];
        action = ":help <C-r><C-w><CR>";
        options.desc = "Help under cursor";
      }

      # ── Quit ───────────────────────────────────────────────
      {
        key = "<leader>qq";
        mode = [ "n" ];
        action = "<cmd>qa<CR>";
        options.desc = "Quit all";
      }

      # ── Lazy plugin manager ────────────────────────────────
      {
        key = "<leader>L";
        mode = [ "n" ];
        action = "<cmd>Lazy<CR>";
        options.desc = "Lazy plugin manager";
      }

      # ── Disable accidental F1 ─────────────────────────────
      {
        key = "<F1>";
        mode = [
          "n"
          "i"
          "v"
          "x"
          "s"
          "o"
          "t"
          "c"
        ];
        action = "<Nop>";
        options.desc = "Disable F1";
      }

      # ── Copilot ────────────────────────────────────────────
      {
        key = "<leader>cp";
        mode = [ "n" ];
        action = "<cmd>Copilot panel<CR>";
        options.desc = "Copilot panel";
      }
      {
        key = "<leader>ct";
        mode = [ "n" ];
        action = "<cmd>Copilot toggle<CR>";
        options.desc = "Copilot toggle";
      }
    ];
  };
}
