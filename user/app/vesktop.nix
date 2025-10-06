{
  programs.vesktop = {
    enable = true;

    settings = {
      appBadge = true;
      arRPC = true;
      customTitleBar = false;
      hardwareAcceleration = true;
      discordBranch = "stable";
      minimizeToTray = true;
      tray = true;
      splashTheming = true;
      splashColor = "rgb(186, 194, 222)";
      splashBackground = "rgb(30, 30, 46)";
    };

    vencord = {
      themes = {
        "midnight-catppuccin-mocha" = ../../assets/vesktop/themes/midnight-catppuccin-mocha.theme.css;
        "server-columns" = ../../assets/vesktop/themes/ServerColumns.theme.css;
      };

      settings = {
        autoUpdate = true;
        autoUpdateNotification = true;
        cloud = {
          authenticated = false;
          settingsSync = false;
          settingsSyncVersion = 1757146176516;
          url = "https://api.vencord.dev/";
        };
        disableMinSize = false;
        eagerPatches = false;
        enableReactDevtools = false;
        enabledThemes = [
          "midnight-catppuccin-mocha.css"
          "server-columns.css"
        ];
        frameless = true;
        macosTranslucency = false;
        notifications = {
          logLimit = 50;
          position = "bottom-right";
          timeout = 5000;
          useNative = "not-focused";
        };
        notifyAboutUpdates = true;
        plugins = {
          AccountPanelServerProfile = {
            enabled = false;
          };
          AlwaysAnimate = {
            enabled = false;
          };
          AlwaysExpandRoles = {
            enabled = true;
          };
          AlwaysTrust = {
            domain = true;
            enabled = true;
            file = true;
          };
          AnonymiseFileNames = {
            enabled = false;
          };
          AppleMusicRichPresence = {
            enabled = false;
          };
          AutomodContext = {
            enabled = false;
          };
          BANger = {
            enabled = false;
          };
          BadgeAPI = {
            enabled = true;
          };
          BetterFolders = {
            enabled = false;
          };
          BetterGifAltText = {
            enabled = false;
          };
          BetterGifPicker = {
            enabled = false;
          };
          BetterNotesBox = {
            enabled = false;
          };
          BetterRoleContext = {
            enabled = false;
          };
          BetterRoleDot = {
            enabled = false;
          };
          BetterSessions = {
            enabled = false;
          };
          BetterSettings = {
            disableFade = true;
            eagerLoad = true;
            enabled = true;
            organizeMenu = true;
          };
          BetterUploadButton = {
            enabled = true;
          };
          BiggerStreamPreview = {
            enabled = false;
          };
          BlurNSFW = {
            enabled = false;
          };
          CallTimer = {
            enabled = true;
            format = "stopwatch";
          };
          ChatInputButtonAPI = {
            enabled = true;
          };
          ClearURLs = {
            enabled = true;
          };
          ClientTheme = {
            enabled = false;
          };
          ColorSighted = {
            enabled = true;
          };
          CommandsAPI = {
            enabled = true;
          };
          ConsoleJanitor = {
            enabled = false;
          };
          ConsoleShortcuts = {
            enabled = false;
          };
          ContextMenuAPI = {
            enabled = true;
          };
          CopyEmojiMarkdown = {
            enabled = false;
          };
          CopyFileContents = {
            enabled = true;
          };
          CopyStickerLinks = {
            enabled = false;
          };
          CopyUserURLs = {
            enabled = false;
          };
          CrashHandler = {
            enabled = true;
          };
          CtrlEnterSend = {
            enabled = false;
          };
          CustomIdle = {
            enabled = false;
          };
          CustomRPC = {
            enabled = false;
          };
          Dearrow = {
            dearrowByDefault = true;
            enabled = true;
            hideButton = false;
            replaceElements = 0;
          };
          Decor = {
            enabled = false;
          };
          DisableCallIdle = {
            enabled = true;
          };
          DisableDeepLinks = {
            enabled = true;
          };
          DontRoundMyTimestamps = {
            enabled = false;
          };
          DynamicImageModalAPI = {
            enabled = false;
          };
          Experiments = {
            enabled = false;
            toolbarDevMenu = false;
          };
          ExpressionCloner = {
            enabled = false;
          };
          F8Break = {
            enabled = false;
          };
          FakeNitro = {
            enableEmojiBypass = true;
            enableStickerBypass = true;
            enableStreamQualityBypass = true;
            enabled = true;
            transformCompoundSentence = false;
            transformEmojis = true;
            transformStickers = true;
          };
          FakeProfileThemes = {
            enabled = false;
          };
          FavoriteEmojiFirst = {
            enabled = false;
          };
          FavoriteGifSearch = {
            enabled = false;
          };
          FixCodeblockGap = {
            enabled = false;
          };
          FixImagesQuality = {
            enabled = false;
          };
          FixSpotifyEmbeds = {
            enabled = false;
          };
          FixYoutubeEmbeds = {
            enabled = true;
          };
          ForceOwnerCrown = {
            enabled = true;
          };
          FriendInvites = {
            enabled = false;
          };
          FriendsSince = {
            enabled = true;
          };
          FullSearchContext = {
            enabled = false;
          };
          FullUserInChatbox = {
            enabled = false;
          };
          GameActivityToggle = {
            enabled = false;
          };
          GifPaste = {
            enabled = false;
          };
          GreetStickerPicker = {
            enabled = false;
          };
          HideMedia = {
            enabled = false;
          };
          IgnoreActivities = {
            enabled = true;
            idsList = "";
            ignoreCompeting = true;
            ignoreListening = true;
            ignorePlaying = true;
            ignoreStreaming = true;
            ignoreWatching = true;
            ignoredActivities = [ ];
            listMode = 0;
          };
          ImageFilename = {
            enabled = false;
          };
          ImageLink = {
            enabled = false;
          };
          ImageZoom = {
            enabled = false;
          };
          ImplicitRelationships = {
            enabled = false;
          };
          InvisibleChat = {
            enabled = false;
          };
          IrcColors = {
            applyColorOnlyInDms = false;
            applyColorOnlyToUsersWithoutColor = false;
            enabled = false;
            lightness = 70;
            memberListColors = true;
          };
          KeepCurrentChannel = {
            enabled = false;
          };
          LastFMRichPresence = {
            enabled = false;
          };
          LoadingQuotes = {
            enabled = false;
          };
          MaskedLinkPaste = {
            enabled = false;
          };
          MemberCount = {
            enabled = false;
          };
          MemberListDecoratorsAPI = {
            enabled = true;
          };
          MentionAvatars = {
            enabled = true;
            showAtSymbol = true;
          };
          MessageAccessoriesAPI = {
            enabled = true;
          };
          MessageClickActions = {
            enabled = false;
          };
          MessageDecorationsAPI = {
            enabled = true;
          };
          MessageEventsAPI = {
            enabled = true;
          };
          MessageLatency = {
            enabled = false;
          };
          MessageLinkEmbeds = {
            enabled = false;
          };
          MessageLogger = {
            enabled = false;
          };
          MessagePopoverAPI = {
            enabled = true;
          };
          MessageTags = {
            enabled = false;
          };
          MessageUpdaterAPI = {
            enabled = false;
          };
          MoreCommands = {
            enabled = false;
          };
          MoreKaomoji = {
            enabled = false;
          };
          MoreUserTags = {
            enabled = false;
          };
          Moyai = {
            enabled = false;
          };
          MutualGroupDMs = {
            enabled = false;
          };
          NSFWGateBypass = {
            enabled = true;
          };
          NewGuildSettings = {
            enabled = true;
            events = true;
            everyone = true;
            guild = true;
            highlights = true;
            messages = 3;
            role = true;
            showAllChannels = true;
          };
          NoBlockedMessages = {
            applyToIgnoredUsers = true;
            enabled = true;
            ignoreMessages = false;
          };
          NoDefaultHangStatus = {
            enabled = false;
          };
          NoDevtoolsWarning = {
            enabled = false;
          };
          NoF1 = {
            enabled = true;
          };
          NoMaskedUrlPaste = {
            enabled = true;
          };
          NoMosaic = {
            enabled = false;
          };
          NoOnboardingDelay = {
            enabled = false;
          };
          NoPendingCount = {
            enabled = false;
          };
          NoProfileThemes = {
            enabled = false;
          };
          NoReplyMention = {
            enabled = false;
          };
          NoScreensharePreview = {
            enabled = false;
          };
          NoServerEmojis = {
            enabled = false;
          };
          NoTrack = {
            disableAnalytics = true;
            enabled = true;
          };
          NoTypingAnimation = {
            enabled = true;
          };
          NoUnblockToJump = {
            enabled = true;
          };
          NormalizeMessageLinks = {
            enabled = false;
          };
          NoticesAPI = {
            enabled = true;
          };
          NotificationVolume = {
            enabled = false;
          };
          OnePingPerDM = {
            enabled = true;
          };
          OpenInApp = {
            enabled = false;
            epic = true;
            itunes = true;
            spotify = true;
            steam = true;
            tidal = true;
          };
          OverrideForumDefaults = {
            enabled = false;
          };
          PartyMode = {
            enabled = false;
          };
          PauseInvitesForever = {
            enabled = false;
          };
          PermissionFreeWill = {
            enabled = false;
          };
          PermissionsViewer = {
            enabled = false;
          };
          PictureInPicture = {
            enabled = false;
          };
          PinDMs = {
            enabled = false;
          };
          PlainFolderIcon = {
            enabled = false;
          };
          PlatformIndicators = {
            badges = true;
            colorMobileIndicator = true;
            enabled = true;
            list = true;
            messages = true;
          };
          PreviewMessage = {
            enabled = false;
          };
          QuickMention = {
            enabled = false;
          };
          QuickReply = {
            enabled = false;
          };
          ReactErrorDecoder = {
            enabled = false;
          };
          ReadAllNotificationsButton = {
            enabled = false;
          };
          RelationshipNotifier = {
            enabled = false;
          };
          ReplaceGoogleSearch = {
            customEngineName = "StartPage";
            customEngineURL = "https://www.startpage.com/";
            enabled = true;
          };
          ReplyTimestamp = {
            enabled = true;
          };
          ResurrectHome = {
            enabled = false;
          };
          RevealAllSpoilers = {
            enabled = false;
          };
          ReverseImageSearch = {
            enabled = false;
          };
          ReviewDB = {
            enabled = false;
          };
          RoleColorEverywhere = {
            enabled = false;
          };
          SecretRingToneEnabler = {
            enabled = false;
          };
          SendTimestamps = {
            enabled = false;
          };
          ServerInfo = {
            enabled = false;
          };
          ServerListAPI = {
            enabled = false;
          };
          ServerListIndicators = {
            enabled = false;
          };
          Settings = {
            enabled = true;
            settingsLocation = "top";
          };
          ShikiCodeblocks = {
            enabled = true;
          };
          ShowAllMessageButtons = {
            enabled = false;
          };
          ShowConnections = {
            enabled = false;
          };
          ShowHiddenChannels = {
            enabled = false;
          };
          ShowHiddenThings = {
            enabled = false;
          };
          ShowMeYourName = {
            enabled = false;
          };
          ShowTimeoutDuration = {
            enabled = true;
          };
          SilentMessageToggle = {
            enabled = false;
          };
          SilentTyping = {
            contextMenu = true;
            enabled = true;
            isEnabled = true;
            showIcon = true;
          };
          SortFriendRequests = {
            enabled = false;
          };
          SpotifyControls = {
            enabled = false;
          };
          SpotifyCrack = {
            enabled = true;
            keepSpotifyActivityOnIdle = false;
            noSpotifyAutoPause = true;
          };
          SpotifyShareCommands = {
            enabled = false;
          };
          StartupTimings = {
            enabled = false;
          };
          StickerPaste = {
            enabled = false;
          };
          StreamerModeOnStream = {
            enabled = false;
          };
          Summaries = {
            enabled = false;
          };
          SuperReactionTweaks = {
            enabled = true;
            superReactByDefault = false;
            superReactionPlayingLimit = 0;
            unlimitedSuperReactionPlaying = false;
          };
          SupportHelper = {
            enabled = true;
          };
          TextReplace = {
            enabled = true;
            regexRules = [
              {
                find = "(https:\\/\\/)x\\.com(\\/[^/]+\\/[^/]+)(\\$?.*)?$";
                onlyIfIncludes = "";
                replace = "$1fixupx.com$2$3";
              }
              {
                find = "(https:\\/\\/)twitter\\.com(\\/[^/]+\\/[^/]+)(\\$?.*)?$";
                onlyIfIncludes = "";
                replace = "$1fxtwitter.com$2$3";
              }
              {
                find = "pixiv\\.net";
                onlyIfIncludes = "/artworks/";
                replace = "phixiv.net";
              }
              {
                find = "(https:\\/\\/)xcancel\\.com(\\/[^/]+\\/[^/]+)(\\$?.*)?$";
                onlyIfIncludes = "";
                replace = "$1fixupx.com$2$3";
              }
              {
                find = "loss";
                onlyIfIncludes = "";
                replace = "~~:.|:;~~";
              }
              {
                find = "";
                onlyIfIncludes = "";
                replace = "";
              }
            ];
            stringRules = [
              {
                find = "";
                onlyIfIncludes = "";
                replace = "";
              }
            ];
          };
          ThemeAttributes = {
            enabled = true;
          };
          TimeBarAllActivities = {
            enabled = false;
          };
          Translate = {
            autoTranslate = false;
            enabled = true;
            receivedInput = "auto";
            receivedOutput = "en";
            sentInput = "auto";
            sentOutput = "en";
            service = "google";
            showChatBarButton = true;
          };
          TypingIndicator = {
            enabled = false;
          };
          TypingTweaks = {
            enabled = false;
          };
          USRBG = {
            enabled = false;
          };
          Unindent = {
            enabled = false;
          };
          UnlockedAvatarZoom = {
            enabled = false;
          };
          UnsuppressEmbeds = {
            enabled = false;
          };
          UrbanDictionary = {
            enabled = false;
          };
          UserMessagesPronouns = {
            enabled = false;
          };
          UserSettingsAPI = {
            enabled = true;
          };
          UserVoiceShow = {
            enabled = false;
          };
          ValidReply = {
            enabled = true;
          };
          ValidUser = {
            enabled = true;
          };
          VcNarrator = {
            enabled = false;
          };
          VencordToolbox = {
            enabled = true;
          };
          ViewIcons = {
            enabled = false;
          };
          ViewRaw = {
            enabled = false;
          };
          VoiceChatDoubleClick = {
            enabled = false;
          };
          VoiceDownload = {
            enabled = false;
          };
          VoiceMessages = {
            enabled = false;
          };
          VolumeBooster = {
            enabled = true;
            multiplier = 2;
          };
          WebContextMenus = {
            addBack = true;
            enabled = true;
          };
          WebKeybinds = {
            enabled = true;
          };
          "WebRichPresence (arRPC)" = {
            enabled = false;
          };
          WebScreenShareFixes = {
            enabled = true;
          };
          WhoReacted = {
            enabled = false;
          };
          Wikisearch = {
            enabled = false;
          };
          XSOverlay = {
            enabled = false;
          };
          YoutubeAdblock = {
            enabled = true;
          };
          iLoveSpam = {
            enabled = false;
          };
          oneko = {
            enabled = false;
          };
          petpet = {
            enabled = false;
          };
        };
        themeLinks = [ ];
        transparent = false;
        useQuickCss = true;
        winCtrlQ = false;
        winNativeTitleBar = false;
      };
    };
  };
}
