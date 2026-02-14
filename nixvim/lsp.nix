{
  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          nil_ls = {
            enable = true;
            settings = {
              nix = {
                flake = {
                  autoEvalInputs = true;
                };
                formatting = {
                  command = [ "alejandra" ];
                };
              };
            };
          };
          lua_ls = {
            enable = true;
            settings = {
              Lua = {
                diagnostics = {
                  globals = [ "vim" ];
                };
                workspace = {
                  checkThirdParty = false;
                };
                telemetry = {
                  enable = false;
                };
                hint = {
                  enable = true;
                };
              };
            };
          };
          pyright.enable = true;
          ruff.enable = true;
          ts_ls.enable = true;
          html.enable = true;
          cssls.enable = true;
          clangd.enable = true;
          zls.enable = true;
          marksman.enable = true;
          hyprls.enable = true;
          bashls.enable = true;
          yamlls.enable = true;
          taplo.enable = true;
          dockerls.enable = true;
          gopls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          cmake.enable = true;
          sqlls = {
            enable = true;
            package = null;
          };
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = "definition";
            gD = "declaration";
            gi = "implementation";
            gr = "references";
            K = "hover";
            "<leader>ca" = "code_action";
          };
          diagnostic = {
            "[d" = "goto_prev";
            "]d" = "goto_next";
            "<leader>dl" = "open_float";
          };
        };
      };

      # LSP progress indicator
      fidget.enable = true;

      # LSP breadcrumbs
      navic = {
        enable = true;
        settings = {
          highlight = true;
          separator = " > ";
          depth_limit = 5;
          lsp = {
            auto_attach = true;
          };
        };
      };
    };
  };
}
