{
  flake.modules.homeManager.equibop = {
    programs.equibop.equicord.extraQuickCss = ''
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
      @import url("https://raw.githubusercontent.com/Just-Me-22/Compact-Server-Shortcut-Buttons/main/compact-server-shortcuts.css");
      @import url('https://raw.githubusercontent.com/echodotvbs/echos-css-snippets/refs/heads/main/misc%20snippets/collapsible-threads.css');

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
          --\\--hide-profile-effects: false;
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

      /* Add gaps between server header and shortcuts */
      [class*="sidebarList"] [class*="containerDefault"][class*="wrapper"] {
        margin: 4px calc(var(--sh-gap)/2);
      }

      /* Hide completed quests */
      .container__60f82 > div:not(:has(.expirationCopy_b5b7aa)) {
          display: none;
      }
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
      /* ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾ */
      /* Slightly Less Shit Enhanced Message Logger Pane */
      /* _______________________________________________ */
      /* https://discord.com/channels/1173279886065029291/1297239805972709521/1503442883204747446 */
      /* https://discord.com/channels/1173279886065029291/1503509945809895434 */

      .vc-msg-logger-enhanced-modal-root {
        max-height: 95vh;
        min-height: 95vh;
        min-width: 65vw;
        max-width: 65vw;
        /* default for these is like 90 or smth idr */

        .vc-msg-logger-enhanced-modal-header {
          padding: 4px 4px 0;
          .wrapper__72c38 {min-height: 1.25em;}
          .vc-msg-logger-enhanced-modal-tab-bar {
            padding-left: 0.25ch;
            margin-top: 4px;
            margin-bottom: 4px;
            align-self: start;
            width: fit-content;
            .vc-msg-logger-enhanced-modal-tab-bar-item {padding-bottom: 4px;}
            .vc-msg-logger-enhanced-modal-tab-bar-item:not(:first-child) {margin-left: var(--space-md);}
            .vc-msg-logger-enhanced-modal-tab-bar-item:nth-child(1) {color: var(--red-460);}
            .vc-msg-logger-enhanced-modal-tab-bar-item:nth-child(2) {color: var(--blue-400);}
            .vc-msg-logger-enhanced-modal-tab-bar-item:nth-child(3) {color: var(--orange-430);}
            .vc-msg-logger-enhanced-modal-tab-bar-item::after {background-color: currentColor !important;opacity: 0.4;}
          }
        }
        .vc-msg-logger-enhanced-modal-content-container {
          .vc-msg-logger-enhanced-modal-content {
            padding-top: 0 !important;
            padding-inline: 4px !important;
            .vc-msg-logger-enhanced-modal-content-inner {
              gap: 20px;
              padding-top: 0;
              height: 100%;
              >div {
                margin-bottom: 6px;
                display: flex;
                flex-direction: column;
                border-bottom: 1px solid var(--border-subtle);
                .vc-msg-logger-enhanced-modal-msg-preview {background-color: hsl(var(--blue-400-hsl, 0 85% 61%) / var(--EML_EditedBackground)) !important;}
                .messagelogger-deleted {background-color: hsl(var(--red-430-hsl, 0 85% 61%) / var(--EML_DeletedBackground)) !important;}
                --EML_DeletedBackground: 20%; /* deleted tab, msg bg transparency - default: 15 */
                --EML_EditedBackground: 20%; /* edited tab, msg bg transparency */
              }
            }
          }
        }
        /* ghost */
        /* messagelogger-deleted */
        /* edit */
        /*  */
        /* del */
        /* messagelogger-deleted */
        .vc-msg-logger-enhanced-footer {
          .vc-link-underline-on-hover {
            align-self: center;
          }
        }
        .vc-msg-logger-enhanced-modal-from::after {content: ':';}
        .vc-msg-logger-enhanced-modal-from {
          text-decoration: var(--border-strong) underline solid 1px;
          margin-bottom: 4px;
          margin-left: 3px;
          font-size: 14px;
          color: var(--control-secondary-text-default);
          order: -1;
        }
      }
    '';
  };
}
