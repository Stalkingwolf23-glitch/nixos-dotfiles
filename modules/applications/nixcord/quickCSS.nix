{
  flake.modules.homeManager.nixcord = {
    programs.nixcord = {
      quickCss = ''
        @import url('https://abbie.github.io/discord-css/import.css');
        @import url("https://raw.githubusercontent.com/KrstlSkll69/vc-snippets/main/OtherStuff/RecolorAddFriendsTab.css");
        @import url("https://raw.githubusercontent.com/KrstlSkll68/vc-snippets/main/SyncedWithGameRecolor.css");
        @import url(https://nspc911.github.io/themes/vencord/ChatRelatedAlertsAtTop.theme.css);
        @import url("https://raw.githubusercontent.com/BurningStoneDiscord/DiscordHighlightGradient/refs/heads/main/MentionReplyingFancyGradient.css");
        @import url(https://raw.githubusercontent.com/sadan4/discordStyles/refs/heads/main/src/cleanup/roundedProfileDecorations.css);
        @import url("https://rinlovesyou.github.io/Couve/snippets/couve-profile-popout.css");
        @import url('https://raw.githubusercontent.com/Krammeth/css-snippets/refs/heads/main/CompactTabs.css');
        @import url(https://davart154.github.io/Themes/Snippets/Mana%20Page%20Switcher/ManaPageSwitcherSource.css);
        @import url(https://raw.githubusercontent.com/amozeo/discord-css-snippets/refs/heads/main/snippets/compact-search-button.css);
        @import url('https://raw.githubusercontent.com/Benzeel/Bennys-Css-Snippets/refs/heads/main/ImageViewerTweaks.css');
        @import url('https://raw.githubusercontent.com/ISOUL22/rice/refs/heads/main/Vencord/improvedSpotifyControls.css');
        @import url(https://davart154.github.io/Themes/Snippets/Sidebar%20Notice%20Refresh/SidebarNoticeRefreshSource.css);
        @import url(https://davart154.github.io/Themes/Snippets/Plugin%20Icon%20Consistency/IconConsistencySource.css);

        @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-blue.theme.css");

        /*Configurable Snippet to tone down modern frills*/
        :root {
            --\\--compact-title-bar: true;
            --\\--compact-input-box: true;
            --\\--compact-context-menu: true;
            --\\--compact-user-area: false;
            --\\--compact-channel-categories: true;
            --\\--compact-server-list: false;

            --\\--hide-nameplates: false;
            --\\--hide-guild-tags: false;
            --\\--hide-profile-effects: true;
            --\\--hide-avatar-decorations: false;
            --\\--hide-gradient-glow-usernames: true;
            --\\--hide-server-boost-goal: true;
            --\\--hide-server-activity: true;
            --\\--hide-user-activity: true;
            --\\--hide-context-menu-quick-reactions: true;
            --\\--hide-hover-quick-reactions: true;
            --\\--hide-image-edit-button: true;
            --\\--hide-gif-button: true;
            --\\--hide-sticker-button: false;
            --\\--hide-emoji-button: false;
            --\\--hide-apps-button: true;
            --\\--hide-gift-button: true;
            --\\--hide-help-button: true;
            --\\--hide-shop-button: true;
            --\\--hide-nitro-button: true;
            --\\--hide-nitro-upsells: true;
            --\\--hide-vencord-desktop-platform-indicator: false;
            --\\--hide-cluttery-badges: true;
            /* ^ hides quest, hypesquad, active dev, and discriminator badges */

            --\\--darker-scrollbar: true;
            --\\--darker-hovered-message: true;
            --\\--prevent-sidebar-resizing: false;
            --\\--fix-minor-icon-misalignments: true;
        }

        /*Colored Role Pills */
        .role_dfa8b6.pill_dfa8b6 {
            position: relative;
            background: none;
            border: none;
            padding-left: 28px;
        }

        /*Pin page switcher to bottom of search results*/
        [class^=searchResultsWrap_] [class^=container_]:has([class^=pageControlContainer_]){
          position: sticky;
          bottom: 0px;
          z-index: 999;
          background: var(--bg-overlay-1, var(--background-secondary));
        }

        /*Status based Activity Status Icon*/
        [class^=memberInner]:has(> div > [aria-label*="Online"]) [class^=subText] svg > path[fill="#23a55a"] { fill: #43b581 }

        [class^=memberInner]:has(> div >[aria-label*=Idle]) [class^=subText] svg > path[fill="#23a55a"] { fill: #f0b232 }

        [class^=memberInner]:has(> div > [aria-label*="Do Not Disturb"]) [class^=subText] svg > path[fill="#23a55a"] { fill: #f23f43 }

        [class^=memberInner]:has(> div > [aria-label*=Streaming]) [class^=subText] svg > path[fill="#23a55a"] { fill: #643da7 }

        [class^=memberInner] [class^=subText] svg > path[fill="#23a55a"] { fill: #747f8d }

        /*Scrollable/compact codeblocks*/
        :root {
          --codeblock-height: 200px;
        }
        .codeContainer__75297 > code {
          max-height: var(--codeblock-height);
          overflow-y: scroll;
          &::-webkit-scrollbar {
            height: 8px;
            width: 8px;
          }
          &::-webkit-scrollbar-corner {
            background-color: transparent;
          }
            &::-webkit-scrollbar-track, &::-webkit-scrollbar-thumb {
            /* visibility: hidden; */
          }
          &::-webkit-scrollbar-thumb {
            background-clip: padding-box;
            background-color: var(--scrollbar-thin-thumb);
            border: 2px solid transparent;
            border-radius: 4px;
            min-height: 40px;
          }
          &:hover::-webkit-scrollbar-track, &:hover::-webkit-scrollbar-thumb {
            visibility: visible;
          }
          &::-webkit-scrollbar-track {
            background-color: var(--scrollbar-thin-track);
            border: 2px solid var(--scrollbar-thin-track);
            border-color: var(--scrollbar-thin-track);
          }
        }

        /* Improved server boost page */
        [class^=powerupContainer] {
            display: flex;
            > :not([class^=parentContainer]) { display: none; }
        }

        /* Fully censored account details */
        /* .container__75920[data-nav-anchor-key='account_info_username_setting'], */
        .container__75920[data-nav-anchor-key='account_info_email_setting'],
        .container__75920[data-nav-anchor-key='account_info_phone_setting'] {
          .stack_dbd263>.text-md\/medium_cf4812 {-webkit-text-security: disc;}
        }
      '';
      config.useQuickCss = true;
    };
  };
}
