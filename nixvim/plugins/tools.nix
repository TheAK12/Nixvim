{
  programs.nixvim = {
    plugins = {
      # Diagnostics list
      trouble = {
        enable = true;
        settings = {
          auto_close = true;
          auto_open = false;
          use_diagnostic_signs = true;
        };
      };

      # Debugging
      dap.enable = true;
      dap-ui.enable = true;
      dap-python.enable = true;
    };
  };
}
