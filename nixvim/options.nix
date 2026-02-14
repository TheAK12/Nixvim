{
  programs.nixvim = {
    opts = {
      # Editor
      number = true;
      relativenumber = true;
      mouse = "a";
      wrap = false;
      linebreak = true;
      breakindent = true;
      scrolloff = 8;
      sidescrolloff = 8;
      cursorline = true;
      cursorlineopt = "number";
      signcolumn = "yes";
      colorcolumn = "100";
      termguicolors = true;
      splitbelow = true;
      splitright = true;
      incsearch = true;
      hlsearch = true;
      ignorecase = true;
      smartcase = true;
      infercase = true;
      timeoutlen = 400;
      updatetime = 250;
      completeopt = "menu,menuone,noselect";
      conceallevel = 0;
      pumheight = 12;
      pumblend = 10;
      spell = true;
      spelllang = [ "en" ];
      laststatus = 3;
      showmode = false;
      smoothscroll = true;
      fillchars = "eob: ";

      # Indentation (guess-indent will override per-file)
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
      shiftround = true;

      # Files / undo
      swapfile = false;
      backup = false;
      writebackup = false;
      undofile = true;
      undolevels = 10000;

      # Clipboard
      clipboard = "unnamedplus";
    };
  };
}
