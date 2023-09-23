{ pkgs, user, ... }:

{
  programs.firefox = {
    enable = true;

    # profiles.${user} = {
    #   isDefault = true;
    #   extraConfig = pkgs.lib.fileContents ./user.js;
    #   bookmarks = [
    #     {
    #       name = "wikipedia";
    #       tags = [ "wiki" ];
    #       keyword = "wiki";
    #       url = "https://en.wikipedia.org/wiki/Special:Search?search=%s&go=Go";
    #     }
    #     {
    #       name = "kernel.org";
    #       url = "https://www.kernel.org";
    #     }
    #     {
    #       name = "Nix sites";
    #       toolbar = true;
    #       bookmarks = [
    #         {
    #           name = "homepage";
    #           url = "https://nixos.org/";
    #         }
    #         {
    #           name = "wiki";
    #           tags = [ "wiki" "nix" ];
    #           url = "https://nixos.wiki/";
    #         }
    #       ];
    #     }
    #   ];
    #   search.default = "DuckDuckGo";
    #   search.engines = {
    #     "Nix Packages" = {
    #       urls = [{
    #         template = "https://search.nixos.org/packages";
    #         params = [
    #           { name = "type"; value = "packages"; }
    #           { name = "query"; value = "{searchTerms}"; }
    #         ];
    #       }];

    #       icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
    #       definedAliases = [ "@np" ];
    #     };

    #     "NixOS Wiki" = {
    #       urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
    #       iconUpdateURL = "https://nixos.wiki/favicon.png";
    #       updateInterval = 24 * 60 * 60 * 1000; # every day
    #       definedAliases = [ "@nw" ];
    #     };

    #     "Amazon.com".metaData.hidden = true;
    #     "Bing".metaData.hidden = true;
    #     "Google".metaData.hidden = true;
    #     "Wikipedia (en)".metaData.hidden = true;
    #   };
    # };
  };
}
