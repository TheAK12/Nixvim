{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./options.nix
    ./keymaps.nix
    ./lsp.nix
    ./formatting.nix
    ./completion.nix
    ./extra.nix
    ./autocmds.nix
    ./plugins/ui.nix
    ./plugins/navigation.nix
    ./plugins/treesitter.nix
    ./plugins/git.nix
    ./plugins/editing.nix
    ./plugins/tools.nix
    ./plugins/copilot.nix
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = ",";
    };

    # Alpha (dashboard) loaded as extraPlugin so we control setup entirely
    # via extraConfigLua -- avoids nixvim calling alpha.setup({}) prematurely.
    extraPlugins = with pkgs.vimPlugins; [
      alpha-nvim
    ];

    extraPackages = with pkgs; [
      ripgrep
      fd
      bat
      lazygit

      # Clipboard
      wl-clipboard

      # Formatters
      alejandra
      stylua
      prettierd
      shfmt
      ruff
      taplo
      gofumpt
      gotools
      rustfmt

      # SQL / Dadbod helpers
      sqlfluff
      postgresql
      mysql80
      sqlite

      # Debuggers
      lldb
      gdb
      python312Packages.debugpy
      vscode-extensions.vadimcn.vscode-lldb

      # Dashboard art
      figlet
      toilet

      # Oil trash integration
      trash-cli
    ];
  };
}
