{ pkgs, ... }:

{
    programs.firefox = {
        enable = true;

        profiles.default = {
            id = 0;
            name = "Default";
            isDefault = true;
            search.default = "Google";

            settings = {
                "browser.fullscreen.autohide" = false;
                "browser.newtabpage.activity-stream.feeds.topsites" = false;
                "browser.newtabpage.activity-stream.showSearch" = false;
                "browser.newtabpage.activity-stream.showSponsored" = false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                "browser.newtabpage.pinned" = [];
                "browser.startup.homepage" = "about:blank";
                # Always load previous sessions
                "browser.startup.page" = 3;
                "browser.search.region" = "DE";
                "browser.compactmode.show" = false;
                "browser.theme.content-theme" = 0;
                "browser.theme.toolbar-theme" = 0;
                "signon.management.page.breach-alerts.enabled" = false;
                "signon.rememberSignons" = false;

                "general.useragent.locale" = "en-US";

                "extensions.pocket.enabled" = false;
                "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
            };

           extensions = with pkgs.nur.repos.rycee.firefox-addons; [
                ublock-origin
                vimium
                keepassxc-browser
                #multi-account-containers
                #temporary-containers
                simple-tab-groups
            ];
        };
    }; 
}
