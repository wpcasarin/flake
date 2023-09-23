{ pkgs, ... }:

{

  programs.helix = {
    enable = false;
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };
    languages = {

      # language-server.pyright = with pkgs.nodePackages; {
      #   command = "${pyright}/bin/pyright-langserver";
      #   args = [ "--stdio" ];
      # };

      language = [{
        name = "python";
        auto-format = true;
        file-types = [ "py" "pyi" "py3" "pyw" "ptl" ".pythonstartup" ".pythonrc" "SConstruct" ];
        comment-token = "#";
      }];
    };
  };
}













