{
  flake.modules.homeManager.equibop = {
    programs.equibop.equicord.settings.plugins = {
      "AccountPanelServerProfile" = {
        "enabled" = true;
        "prioritizeServerProfile" = false;
      };
      "AdvancedPermissions" = {
        "collapsedByDefault" = false;
        "enabled" = true;
        "simplifiedCard" = "hide";
      };
      "AllCallTimers" = {
        "enabled" = true;
        "format" = "stopwatch";
      };
      "AlwaysAnimate" = {
        "enabled" = true;
        "icons" = true;
        "nameplates" = true;
        "roleGradients" = true;
        "serverBanners" = true;
        "statusEmojis" = true;
      };
      "AlwaysTrust" = {
        "confirmModal" = true;
        "domain" = true;
        "enabled" = true;
        "file" = true;
        "noDeleteSafety" = true;
      };
      "Anammox" = {
        "billing" = true;
        "dms" = true;
        "emojiList" = true;
        "enabled" = true;
        "gift" = true;
        "quests" = true;
        "serverBoost" = true;
      };
      "AudioPlayerAPI" = {
        "enabled" = true;
      };
      "BetterActivities" = {
        "allActivitiesStyle" = "carousel";
        "enabled" = true;
        "hideTooltip" = true;
        "iconSize" = 15;
        "memberList" = true;
        "removeGameActivityStatus" = false;
        "renderGifs" = true;
        "specialFirst" = true;
        "userPopout" = true;
      };
      "BetterAudioPlayer" = {
        "enabled" = true;
        "forceMoveBelow" = true;
        "oscilloscope" = true;
        "oscilloscopeColor" = "255, 255, 255";
        "oscilloscopeSolidColor" = false;
        "spectrograph" = true;
        "spectrographColor" = "33, 150, 243";
        "spectrographSolidColor" = false;
      };
      "BetterBlockedUsers" = {
        "enabled" = true;
      };
      "BetterCommands" = {
        "autoFillArguments" = true;
        "enabled" = true;
      };
      "BetterInvites" = {
        "enabled" = true;
      };
      "BetterRoleContext" = {
        "enabled" = true;
        "roleIconFileFormat" = "png";
      };
      "BetterRoleDot" = {
        "bothStyles" = false;
        "copyRoleColorInProfilePopout" = false;
        "enabled" = true;
      };
      "BetterSettings" = {
        "disableFade" = true;
        "eagerLoad" = true;
        "enabled" = true;
        "organizeMenu" = true;
      };
      "BetterUploadButton" = {
        "enabled" = true;
      };
      "CallTimer" = {
        "allCallTimers" = true;
        "enabled" = true;
        "format" = "stopwatch";
        "showRoleColor" = true;
        "showSeconds" = true;
        "showWithoutHover" = true;
        "trackSelf" = true;
        "watchLargeGuilds" = false;
      };
      "CancelFriendRequest" = {
        "enabled" = true;
      };
      "CharacterCounter" = {
        "colorEffects" = true;
        "enabled" = true;
      };
      "ChatInputButtonAPI" = {
        "enabled" = true;
      };
      "ClearURLs" = {
        "enabled" = true;
      };
      "ClickableRoles" = {
        "enabled" = true;
      };
      "CommandsAPI" = {
        "enabled" = true;
      };
      "CrashHandler" = {
        "attemptToNavigateToHome" = false;
        "attemptToPreventCrashes" = true;
        "enabled" = true;
      };
      "CursorBuddy" = {
        "buddy" = "oneko";
        "enabled" = true;
        "fade" = true;
        "fps" = 24;
        "freeroam" = true;
        "furColor" = "#cdd6f4";
        "outlineColor" = "#11111b";
        "shake" = false;
        "size" = 120;
        "speed" = 12;
      };
      "Dearrow" = {
        "dearrowByDefault" = true;
        "enabled" = true;
        "hideButton" = false;
        "replaceElements" = 0;
      };
      "DecodeBase64" = {
        "clickMethod" = "Left";
        "enabled" = true;
      };
      "DisableCallIdle" = {
        "enabled" = true;
      };
      "DisableCameras" = {
        "enabled" = true;
      };
      "DisableDeepLinks" = {
        "enabled" = true;
      };
      "DontRoundMyTimestamps" = {
        "enabled" = true;
      };
      "EquicordHelper" = {
        "accountStandingButton" = false;
        "disableAdoptTagPrompt" = true;
        "disableCreateDMButton" = false;
        "disableDMContextMenu" = false;
        "enabled" = true;
        "forceRoleIcon" = false;
        "hideVoiceIndicatorForMutedChannels" = false;
        "jsonGateway" = false;
        "noBulletPoints" = true;
        "noDefaultHangStatus" = false;
        "noMirroredCamera" = false;
        "noModalAnimation" = true;
        "refreshSlashCommands" = false;
        "removeActivitySection" = false;
        "restoreFileDownloadButton" = false;
        "showYourOwnActivityButtons" = false;
      };
      "EquicordToolbox" = {
        "enabled" = true;
        "showPluginMenu" = true;
      };
      "FakeNitro" = {
        "disableEmbedPermissionCheck" = false;
        "emojiSize" = 48;
        "enableEmojiBypass" = true;
        "enableStickerBypass" = true;
        "enableStreamQualityBypass" = true;
        "enabled" = true;
        "hyperLinkText" = "{{NAME}}";
        "stickerSize" = 160;
        "transformCompoundSentence" = false;
        "transformEmojis" = true;
        "transformStickers" = true;
        "useEmojiHyperLinks" = true;
        "useStickerHyperLinks" = true;
      };
      "FindReply" = {
        "enabled" = true;
        "hideButtonIfNoReply" = true;
        "includeAuthor" = false;
        "includePings" = true;
      };
      "FixCodeblockGap" = {
        "enabled" = true;
      };
      "FixFileExtensions" = {
        "enabled" = true;
      };
      "FixImagesQuality" = {
        "enabled" = true;
        "originalImagesInChat" = false;
      };
      "FixSpotifyEmbeds" = {
        "enabled" = true;
        "volume" = 10;
      };
      "FixYoutubeEmbeds" = {
        "enabled" = true;
        "youtubeDescription" = false;
      };
      "ForceOwnerCrown" = {
        "enabled" = true;
      };
      "GitHubRepos" = {
        "enabled" = true;
        "showInMiniProfile" = true;
        "showLanguage" = true;
        "showRepositoryTab" = true;
        "showStars" = true;
      };
      "GlobalBadges" = {
        "apiUrl" = "https://badges.equicord.org/";
        "enabled" = true;
        "showAero" = true;
        "showAliucord" = true;
        "showBetterDiscord" = true;
        "showBunny" = true;
        "showCustom" = true;
        "showEnmity" = true;
        "showGooseMod" = true;
        "showModStyle" = "none";
        "showNekocord" = true;
        "showPaicord" = true;
        "showPrefix" = true;
        "showRaincord" = true;
        "showReCord" = true;
        "showReplugged" = true;
        "showRevenge" = true;
        "showReviewDB" = true;
        "showSuffix" = false;
        "showVelocity" = true;
        "showVendroidEnhanced" = true;
      };
      "GoogleThat" = {
        "customEngineURL" = null;
        "defaultEngine" = "DuckDuckGo";
        "embed" = true;
        "enabled" = true;
        "hyperlink" = false;
      };
      "HeaderBarAPI" = {
        "enabled" = true;
      };
      "IrcColors" = {
        "applyColorOnlyInDms" = false;
        "applyColorOnlyToUsersWithoutColor" = true;
        "enabled" = true;
        "lightness" = 70;
        "memberListColors" = true;
      };
      "LoadingQuotes" = {
        "additionalQuotes" = "";
        "additionalQuotesDelimiter" = "|";
        "enableDiscordPresetQuotes" = false;
        "enablePluginPresetQuotes" = true;
        "enabled" = true;
        "replaceEvents" = true;
      };
      "LoginWithQR" = {
        "enabled" = true;
      };
      "MarkdownTables" = {
        "enabled" = true;
        "hideToggle" = true;
      };
      "MemberCount" = {
        "enabled" = true;
        "memberList" = true;
        "toolTip" = true;
        "voiceActivity" = true;
      };
      "MemberListDecoratorsAPI" = {
        "enabled" = true;
      };
      "MentionAvatars" = {
        "enabled" = true;
        "showAtSymbol" = true;
      };
      "MessageAccessoriesAPI" = {
        "enabled" = true;
      };
      "MessageClickActions" = {
        "addAdditionalReacts" = false;
        "additionalReactEmojis" = "";
        "backspaceClickAction" = "delete";
        "clickTimeout" = 300;
        "deferDoubleClickForTriple" = true;
        "disableInDms" = false;
        "disableInSystemDms" = true;
        "doubleClickAction" = "EDIT";
        "doubleClickHoldThreshold" = 150;
        "doubleClickModifier" = "NONE";
        "doubleClickOthersAction" = "REPLY";
        "enableDeleteOnClick" = true;
        "enableDoubleClickToEdit" = true;
        "enableDoubleClickToReply" = true;
        "enableTripleClickToReact" = false;
        "enabled" = true;
        "keySelection" = "backspace";
        "quoteWithReply" = true;
        "reactEmoji" = "";
        "requireModifier" = false;
        "selectionHoldTimeout" = 300;
        "singleClickAction" = "DELETE";
        "singleClickModifier" = "BACKSPACE";
        "singleClickOthersAction" = "DELETE";
        "singleClickOthersModifier" = "BACKSPACE";
        "tripleClickAction" = "NONE";
        "tripleClickModifier" = "NONE";
        "useSelectionForQuote" = false;
      };
      "MessageColors" = {
        "blockView" = 0;
        "enableShortHexCodes" = true;
        "enabled" = true;
        "renderType" = 0;
      };
      "MessageDecorationsAPI" = {
        "enabled" = true;
      };
      "MessageEventsAPI" = {
        "enabled" = true;
      };
      "MessagePopoverAPI" = {
        "enabled" = true;
      };
      "MessageUpdaterAPI" = {
        "enabled" = true;
      };
      "MicLoopbackTester" = {
        "enabled" = true;
      };
      "MiddleClickTweaks" = {
        "enabled" = true;
        "openScope" = "none";
        "pasteScope" = "focus";
        "pasteThreshold" = 100;
      };
      "MoreUserTags" = {
        "dontShowBotTag" = false;
        "dontShowForBots" = false;
        "enabled" = true;
        "noAppsAllowed" = true;
        "showWebhookTagFully" = false;
        "tagSettings" = {
          "ADMINISTRATOR" = {
            "enabled" = false;
            "showInChat" = true;
            "showInNotChat" = true;
            "text" = "Admin";
          };
          "CHAT_MODERATOR" = {
            "enabled" = false;
            "showInChat" = true;
            "showInNotChat" = true;
            "text" = "Chat Mod";
          };
          "MODERATOR" = {
            "enabled" = false;
            "showInChat" = true;
            "showInNotChat" = true;
            "text" = "Mod";
          };
          "MODERATOR_STAFF" = {
            "enabled" = false;
            "showInChat" = true;
            "showInNotChat" = true;
            "text" = "Staff";
          };
          "OWNER" = {
            "enabled" = false;
            "showInChat" = true;
            "showInNotChat" = true;
            "text" = "Owner";
          };
          "VOICE_MODERATOR" = {
            "enabled" = false;
            "showInChat" = true;
            "showInNotChat" = true;
            "text" = "VC Mod";
          };
          "WEBHOOK" = {
            "enabled" = false;
            "showInChat" = true;
            "showInNotChat" = true;
            "text" = "Webhook";
          };
          "enabled" = false;
        };
      };
      "NewGuildSettings" = {
        "enabled" = true;
        "events" = true;
        "everyone" = true;
        "guild" = false;
        "highlights" = true;
        "messages" = 3;
        "mobilePush" = true;
        "role" = true;
        "showAllChannels" = true;
        "voiceChannels" = false;
      };
      "NewPluginsManager" = {
        "enabled" = true;
      };
      "NicknameIconsAPI" = {
        "enabled" = true;
      };
      "NoDevtoolsWarning" = {
        "enabled" = true;
      };
      "NoF1" = {
        "enabled" = true;
      };
      "NoMaskedUrlPaste" = {
        "enabled" = true;
      };
      "NoMiddleClickPaste" = {
        "enabled" = true;
      };
      "NoNitroUpsell" = {
        "enabled" = true;
      };
      "NoOnboardingDelay" = {
        "enabled" = true;
      };
      "OnePingPerDM" = {
        "allowEveryone" = false;
        "allowMentions" = false;
        "alwaysPlaySound" = false;
        "channelToAffect" = "both_dms";
        "enabled" = true;
        "ignoreUsers" = "";
      };
      "PinIcon" = {
        "enabled" = true;
      };
      "PlatformIndicators" = {
        "ConsoleIcon" = "equicord";
        "colorMobileIndicator" = true;
        "enabled" = true;
        "list" = true;
        "messages" = true;
        "profiles" = true;
        "showBots" = false;
      };
      "PlatformSpoofer" = {
        "enabled" = true;
        "platform" = "desktop";
      };
      "ProfileCollectionsAPI" = {
        "enabled" = true;
      };
      "ProfileSectionsAPI" = {
        "enabled" = true;
      };
      "Questify" = {
        "acknowledgedNotices" = {};
        "allowChangingDangerousSettings" = true;
        "autoCompleteQuestTypes" = {
          "ACHIEVEMENT_IN_ACTIVITY" = true;
          "PLAY_ACTIVITY" = true;
          "PLAY_ON_DESKTOP" = true;
          "PLAY_ON_PLAYSTATION" = true;
          "PLAY_ON_XBOX" = true;
          "WATCH_VIDEO" = true;
          "WATCH_VIDEO_ON_MOBILE" = true;
        };
        "autoCompleteQuestsSimultaneously" = true;
        "claimedSubsort" = "Claimed DESC";
        "completeVideoQuestsQuicker" = true;
        "disableAccountPanelPromo" = true;
        "disableAccountPanelQuestProgress" = false;
        "disableFriendsListPromo" = true;
        "disableMembersListPromo" = true;
        "disableOrbsAndQuestsBadges" = false;
        "disableQuestsEverything" = false;
        "disableRelocationNotices" = true;
        "disableSponsoredBanner" = false;
        "enabled" = true;
        "expiredSubsort" = "Expiring DESC";
        "ignoredQuestIDs" = {
          "questIDs" = [];
        };
        "ignoredSubsort" = "Recent DESC";
        "isOnQuestsPage" = true;
        "lastQuestPageFilters" = {};
        "lastQuestPageSort" = "questify";
        "makeMobileVideoQuestsDesktopCompatible" = true;
        "migrationVersion" = 1;
        "newExcludedQuestAlertSound" = null;
        "newExcludedQuestAlertVolume" = 100;
        "newQuestAlertSound" = "discodo";
        "newQuestAlertVolume" = 100;
        "notifyOnNewExcludedQuests" = false;
        "notifyOnNewQuests" = true;
        "notifyOnQuestComplete" = true;
        "preventVideoQuestsPausing" = false;
        "questButtonBadgeColor" = 2842239;
        "questButtonBadgeCount" = 1;
        "questButtonDisplay" = "always";
        "questButtonIncludedTypes" = {
          "1" = false;
          "2" = false;
          "3" = true;
          "4" = true;
          "5" = true;
          "ACHIEVEMENT_IN_ACTIVITY" = false;
          "ACHIEVEMENT_IN_GAME" = false;
          "PLAY_ACTIVITY" = false;
          "PLAY_ON_DESKTOP" = false;
          "PLAY_ON_DESKTOP_V2" = false;
          "PLAY_ON_PLAYSTATION" = false;
          "PLAY_ON_XBOX" = false;
          "STREAM_ON_DESKTOP" = true;
          "WATCH_VIDEO" = true;
          "WATCH_VIDEO_ON_MOBILE" = true;
        };
        "questButtonIndicator" = "both";
        "questButtonLeftClickAction" = "open-quests";
        "questButtonMiddleClickAction" = "plugin-settings";
        "questButtonRightClickAction" = "context-menu";
        "questCompletedAlertSound" = "bop_message1";
        "questCompletedAlertVolume" = 100;
        "questFetchInterval" = 2700;
        "questOrder" = [
          "UNCLAIMED"
          "CLAIMED"
          "IGNORED"
          "EXPIRED"
        ];
        "questTileClaimedColor" = {
          "color" = 6105983;
          "enabled" = true;
        };
        "questTileExpiredColor" = {
          "color" = 2368553;
          "enabled" = true;
        };
        "questTileGradient" = "intense";
        "questTileIgnoredColor" = {
          "color" = 8334124;
          "enabled" = true;
        };
        "questTilePreload" = true;
        "questTileUnclaimedColor" = {
          "color" = 2842239;
          "enabled" = true;
        };
        "rememberQuestPageFilters" = true;
        "rememberQuestPageSort" = true;
        "resumeInterruptedQuests" = true;
        "resumeQuestIDs" = {};
        "unclaimedSubsort" = "Expiring ASC";
      };
      "QuickReply" = {
        "enabled" = true;
        "ignoreBlockedAndIgnored" = true;
        "shouldMention" = 2;
      };
      "ReactErrorDecoder" = {
        "enabled" = true;
      };
      "RelationshipNotifier" = {
        "enabled" = true;
        "friendRequestCancels" = true;
        "friends" = true;
        "groups" = true;
        "notices" = true;
        "offlineRemovals" = true;
        "servers" = true;
      };
      "ReplaceGoogleSearch" = {
        "customEngineName" = "DuckDuckGo";
        "customEngineURL" = "https://duckduckgo.com/?q=";
        "enabled" = true;
        "replacementEngine" = "off";
      };
      "ReplyPingControl" = {
        "alwaysPingOnReply" = true;
        "enabled" = true;
        "replyPingBlacklist" = "";
        "replyPingWhitelist" = "";
      };
      "ReplyTimestamp" = {
        "enabled" = true;
      };
      "ReverseImageSearch" = {
        "enabled" = true;
      };
      "ServerListAPI" = {
        "enabled" = true;
      };
      "ShikiCodeblocks" = {
        "bgOpacity" = 100;
        "customTheme" = null;
        "enabled" = true;
        "theme" = "https://cdn.jsdelivr.net/gh/shikijs/textmate-grammars-themes@bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/catppuccin-mocha.json";
        "tryHljs" = "SECONDARY";
        "useDevIcon" = "COLOR";
      };
      "ShowRolesInChat" = {
        "enabled" = true;
        "excludedRoles" = [];
        "showBots" = false;
        "useRoleColor" = true;
      };
      "ShowSongName" = {
        "enabled" = true;
      };
      "SilentTyping" = {
        "alwaysEnableInActiveVoiceChat" = false;
        "chatContextMenu" = true;
        "chatIcon" = true;
        "chatIconLeftClickAction" = "channel";
        "chatIconMiddleClickAction" = "settings";
        "chatIconRightClickAction" = "global";
        "defaultHidden" = true;
        "disabledLocations" = "1418903722616160349";
        "enabled" = true;
        "enabledGlobally" = true;
        "enabledLocations" = "";
        "hideChatBoxTypingIndicators" = true;
        "hideMembersListTypingIndicators" = true;
        "temporaryEnableThresholdDirectMessages" = 0;
        "temporaryEnableThresholdServers" = 0;
      };
      "SplitLargeMessages" = {
        "disableFileConversion" = true;
        "enabled" = true;
        "hardSplit" = false;
        "maxLength" = 0;
        "sendDelay" = 1;
        "slowmodeMax" = 5;
        "splitInSlowmode" = false;
        "splitMode" = "newlines";
      };
      "SpotifyCrack" = {
        "enabled" = true;
        "keepSpotifyActivityOnIdle" = false;
        "noSpotifyAutoPause" = true;
      };
      "StickerPaste" = {
        "enabled" = true;
      };
      "TextReplace" = {
        "enabled" = true;
        "regexRules" = [
          {
            "find" = "pixiv\\.net";
            "id" = "a34282c4-4997-4dfa-bf46-20029cd700de";
            "name" = "Pixiv";
            "onlyIfIncludes" = "/artworks/";
            "replace" = "phixiv.net";
            "scope" = "myMessages";
          }
          {
            "find" = "https:\\/\\/(?:(?:www\\.)?twitter\\.com|(?:www\\.)?x\\.com|nitter.tail090b60.ts\\.net)\\/([a-zA-Z0-9_]+\\/status\\/\\d+)(?:\\?[^#\\s]*)?(?:#\\S+)?";
            "id" = "8718b08b-636b-4a7c-95ec-9dafae15c170";
            "name" = "Twitter";
            "onlyIfIncludes" = "/status/";
            "replace" = "https://fixupx.com/$1";
            "scope" = "myMessages";
          }
        ];
        "stringRules" = [
          {
            "find" = "";
            "id" = "e52d4295-4a8e-4bae-964d-e7c319ab1dcc";
            "name" = "";
            "onlyIfIncludes" = "";
            "replace" = "";
            "scope" = "myMessages";
          }
        ];
      };
      "ThemeAttributes" = {
        "enabled" = true;
      };
      "TidalEmbeds" = {
        "enabled" = true;
      };
      "Translate+" = {
        "enabled" = true;
        "shavian" = true;
        "sitelen" = true;
        "target" = "en";
        "toki" = true;
      };
      "TypingTweaks" = {
        "alternativeFormatting" = true;
        "amITyping" = true;
        "enabled" = true;
        "showAvatars" = true;
        "showRoleColors" = true;
      };
      "USRBG" = {
        "enabled" = true;
        "nitroFirst" = true;
        "voiceBackground" = true;
      };
      "UnitConverter" = {
        "enabled" = true;
        "myUnits" = "metric";
      };
      "UserAreaAPI" = {
        "enabled" = true;
      };
      "UserSettingsAPI" = {
        "enabled" = true;
      };
      "VCPanelSettings" = {
        "camera" = false;
        "enabled" = true;
        "inputDevice" = true;
        "inputVolume" = true;
        "outputDevice" = true;
        "outputVolume" = true;
        "showInputDeviceHeader" = false;
        "showInputVolumeHeader" = true;
        "showOutputDeviceHeader" = false;
        "showOutputVolumeHeader" = true;
        "showVideoDeviceHeader" = false;
        "uncollapseSettingsByDefault" = false;
      };
      "ValidReply" = {
        "enabled" = true;
      };
      "ValidUser" = {
        "enabled" = true;
      };
      "VoiceRejoin" = {
        "applyOnlyToDms" = false;
        "enabled" = true;
        "preventReconnectIfCallEnded" = "both";
        "rejoinDelay" = 2;
        "rejoinTimeout" = 30;
      };
      "VoiceStats" = {
        "enabled" = true;
      };
      "VolumeBooster" = {
        "enabled" = true;
        "multiplier" = 2;
      };
      "WebContextMenus" = {
        "addBack" = false;
        "enabled" = true;
      };
      "WebKeybinds" = {
        "enabled" = true;
        "overrideCommonKeybinds" = false;
        "showNavigationButtons" = true;
      };
      "WebScreenShareFixes" = {
        "enabled" = true;
      };
      "WhoReacted" = {
        "avatarClick" = false;
        "enabled" = true;
      };
      "WhosWatching" = {
        "enabled" = true;
        "showPanel" = true;
      };
      "YoutubeAdblock" = {
        "enabled" = true;
      };
      "ZipPreview" = {
        "enabled" = true;
      };
      "GifPaste" = {
        "enabled" = true;
      };
      "GifMaker" = {
        "enabled" = true;
      };
      "FullVCPFP" = {
        "enabled" = true;
      };
      "BetterGifPicker" = {
        "enabled" = true;
      };
      "BetterGiftAltText" = {
        "enabled" = true;
      };
      "AddAttachments" = {
        "enabled" = true;
      };
    };
  };
}
