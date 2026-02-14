{
  programs.nixvim = {
    plugins = {
      conform-nvim = {
        enable = true;
        settings = {
          notify_on_error = true;
          format_on_save.__raw = ''
            function(bufnr)
              if vim.g.disable_autoformat then return end
              return { lsp_format = "fallback", timeout_ms = 1500 }
            end
          '';
          formatters_by_ft = {
            nix = [ "alejandra" ];
            lua = [ "stylua" ];
            javascript = [ "prettierd" ];
            typescript = [ "prettierd" ];
            javascriptreact = [ "prettierd" ];
            typescriptreact = [ "prettierd" ];
            css = [ "prettierd" ];
            html = [ "prettierd" ];
            json = [ "prettierd" ];
            yaml = [ "prettierd" ];
            markdown = [ "prettierd" ];
            sh = [ "shfmt" ];
            c = [ "clang-format" ];
            cpp = [ "clang-format" ];
            h = [ "clang-format" ];
            hpp = [ "clang-format" ];
            python = [ "ruff_format" ];
            sql = [ "sqlfluff" ];
            toml = [ "taplo" ];
            go = [
              "gofumpt"
              "goimports"
            ];
            rust = [ "rustfmt" ];
          };
        };
      };
    };
  };
}
