{ pkgs, ... }:

{
  home.packages = with pkgs; [ luajit ];

  home.file =
    {
      ".config/nvim".recursive = true;
      ".config/nvim".source = ./nvim;
    };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
