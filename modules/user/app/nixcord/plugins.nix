{
  programs.nixcord.config.plugins = {
    accountPanelServerProfile.enable = true;
    advancedPermissions.enable = true;
    alwaysAnimate.enable = true;
    alwaysTrust.enable = true;
    betterActivities.enable = true;
    betterAudioPlayer.enable = true;
    betterBlockedUsers.enable = true;
    betterCommands.enable = true;
    betterInvites.enable = true;
    betterRoleContext.enable = true;
    betterRoleDot.enable = true;
    betterSettings.enable = true;
    betterUploadButton.enable = true;
    callTimer = {
      enable = true;
      allCallTimers = true;
      showWithoutHover = true;
      showRoleColor = true;
      trackSelf = true;
      showSeconds = true;
    };
    cancelFriendRequest.enable = true;
    characterCounter.enable = true;
    clearUrls.enable = true;
    clickableRoles.enable = true;
    crashHandler.enable = true;
    cursorBuddy = {
      enable = true;
      speed = 12;
      furColor = "#cdd6f4";
      outlineColor = "#11111b";
    };
    dearrow.enable = true;
    decodeBase64.enable = true;
    disableCallIdle.enable = true;
    disableCameras.enable = true;
    disableDeepLinks.enable = true;
    dontRoundMyTimestamps.enable = true;
    equicordHelper = {
      enable = true;
      noModalAnimation = true;
      disableAdoptTagPrompt = true;
      noBulletPoints = true;
    };
    equicordToolbox.enable = true;
    fakeNitro.enable = true;
    findReply = {
      enable = true;
      includePings = true;
    };
    fixCodeblockGap.enable = true;
    fixFileExtensions.enable = true;
    fixImagesQuality.enable = true;
    fixSpotifyEmbeds.enable = true;
    fixYoutubeEmbeds.enable = true;
    forceOwnerCrown.enable = true;
    gitHubRepos.enable = true;
    globalBadges.enable = true;
    googleThat = {
      enable = true;
      defaultEngine = "DuckDuckGo";
    };
    ircColors = {
      enable = true;
      applyColorOnlyToUsersWithoutColor = true;
    };
    loadingQuotes.enable = true;
    loginWithQr.enable = true;
    markdownTables.enable = true;
    memberCount.enable = true;
    mentionAvatars.enable = true;
    messageClickActions = {
      enable = true;
      doubleClickAction = "EDIT";
      doubleClickOthersAction = "REPLY";
      tripleClickAction = "NONE";
      reactEmoji = "";
      deferDoubleClickForTriple = true;
    };
    messageColors = {
      enable = true;
      renderType = 0;
      blockView = 0;
    };
    micLoopbackTester.enable = true;
    middleClickTweaks = {
      enable = true;
      pasteScope = "focus";
    };
    moreCommands = {
      addFreakyEnding = true;
    };
    moreUserTags = {
      enable = true;
      noAppsAllowed = true;
      tagSettings = {
        webhook = { };
        owner = { };
        administrator = { };
        moderatorStaff = { };
        moderator = { };
        voiceModerator = { };
        chatModerator = { };
      };
    };
    newGuildSettings = {
      enable = true;
      guild = false;
    };
    newPluginsManager.enable = true;
    noDevtoolsWarning.enable = true;
    noF1.enable = true;
    noMaskedUrlPaste.enable = true;
    noMiddleClickPaste.enable = true;
    noNitroUpsell.enable = true;
    noOnboardingDelay.enable = true;
    onePingPerDm.enable = true;
    pinIcon.enable = true;
    platformIndicators.enable = true;
    platformSpoofer.enable = true;
    questify = {
      enable = true;
      autoCompleteQuestTypes = {
        PLAY_ON_DESKTOP = false;
        PLAY_ON_XBOX = false;
        PLAY_ON_PLAYSTATION = false;
        PLAY_ACTIVITY = false;
        WATCH_VIDEO = true;
        WATCH_VIDEO_ON_MOBILE = true;
        ACHIEVEMENT_IN_ACTIVITY = true;
      };
      allowChangingDangerousSettings = true;
      questButtonIncludedTypes = {
        "1" = false;
        "2" = false;
        "3" = true;
        "4" = true;
        "5" = true;
        WATCH_VIDEO = true;
        WATCH_VIDEO_ON_MOBILE = true;
        ACHIEVEMENT_IN_ACTIVITY = false;
        ACHIEVEMENT_IN_GAME = false;
        PLAY_ACTIVITY = false;
        PLAY_ON_DESKTOP = false;
        PLAY_ON_DESKTOP_V2 = false;
        STREAM_ON_DESKTOP = true;
        PLAY_ON_PLAYSTATION = false;
        PLAY_ON_XBOX = false;
      };
      ignoredQuestIds = {
        questIDs = [ "1527003925650083910" ];
      };
      completeVideoQuestsQuicker = true;
      makeMobileVideoQuestsDesktopCompatible = true;
      autoCompleteQuestsSimultaneously = true;
      resumeInterruptedQuests = true;
      lastQuestPageFilters = {
        "[\"reward\",\"reward_virtual_currency\"]" = {
          group = "reward";
          filter = "reward_virtual_currency";
        };
        "[\"task\",\"task_play\"]" = {
          group = "task";
          filter = "task_play";
        };
        "[\"task\",\"task_video\"]" = {
          group = "task";
          filter = "task_video";
        };
      };
    };
    quickReply.enable = true;
    reactErrorDecoder.enable = true;
    relationshipNotifier = {
      enable = true;
      notices = true;
    };
    replaceGoogleSearch = {
      enable = true;
      customEngineName = "DuckDuckGo";
      customEngineUrl = "https://duckduckgo.com/?q=";
    };
    replyPingControl = {
      enable = true;
      alwaysPingOnReply = true;
    };
    replyTimestamp.enable = true;
    reverseImageSearch.enable = true;
    shikiCodeblocks = {
      enable = true;
      theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/catppuccin-mocha.json";
      useDevIcon = "COLOR";
    };
    showRolesInChat.enable = true;
    showSongName.enable = true;
    silentTyping = {
      enable = true;
      hideChatBoxTypingIndicators = true;
      hideMembersListTypingIndicators = true;
      disabledLocations = "1418903722616160349";
    };
    splitLargeMessages.enable = true;
    spotifyCrack.enable = true;
    stickerPaste.enable = true;
    textReplace = {
      enable = true;
      stringRules = [
        {
          find = "";
          replace = "";
          onlyIfIncludes = "";
          scope = "myMessages";
          id = "e52d4295-4a8e-4bae-964d-e7c319ab1dcc";
          name = "";
        }
      ];
      regexRules = [
        {
          find = "pixiv\\.net";
          replace = "phixiv.net";
          onlyIfIncludes = "/artworks/";
          scope = "myMessages";
          id = "a34282c4-4997-4dfa-bf46-20029cd700de";
          name = "PIxiv";
        }
        {
          find = "https:\\/\\/(?:(?:www\\.)?twitter\\.com|(?:www\\.)?x\\.com|xcancel\\.com|nitter\\.(?:net|com))\\/([a-zA-Z0-9_]+\\/status\\/\\d+)(?:\\?[^#\\s]*)?(?:#\\S+)?";
          replace = "[[source]](<https://fixupx.com/$1>) [[raw]](https://fixupx.com/$1.mp4)";
          onlyIfIncludes = "/status/";
          scope = "myMessages";
          id = "8718b08b-636b-4a7c-95ec-9dafae15c170";
          name = "Twitter";
        }
      ];
    };
    themeAttributes.enable = true;
    tidalEmbeds.enable = true;
    timezones = {
      askedTimezone = true;
    };
    translatePlus.enable = true;
    typingTweaks = {
      enable = true;
      amITyping = true;
    };
    unitConverter = {
      enable = true;
      myUnits = "metric";
    };
    usrbg.enable = true;
    validReply.enable = true;
    validUser.enable = true;
    vcPanelSettings.enable = true;
    voiceRejoin.enable = true;
    voiceStats.enable = true;
    volumeBooster.enable = true;
    webContextMenus.enable = true;
    webKeybinds.enable = true;
    webScreenShareFixes.enable = true;
    whoReacted.enable = true;
    whosWatching.enable = true;
    youtubeAdblock.enable = true;
    zipPreview.enable = true;
  };
  programs.nixcord.extraConfig.plugins = {
    AllCallTimers = {
      enable = true;
      format = "stopwatch";
    };
    Anammox = {
      enable = true;
      dms = true;
      serverBoost = true;
      billing = true;
      gift = true;
      emojiList = true;
      quests = true;
    };
    betterAudioPlayer = {
      forceMoveBelow = true;
    };
    equicordHelper = {
      disableCreateDMButton = false;
      disableDMContextMenu = false;
      noDefaultHangStatus = false;
    };
    gitHubRepos = {
      showInMiniProfile = true;
      showRepositoryTab = true;
    };
    globalBadges = {
      showPrefix = true;
      showSuffix = false;
    };
    messageClickActions = {
      requireModifier = false;
      enableTripleClickToReact = false;
      enableDoubleClickToReply = true;
      enableDoubleClickToEdit = true;
      enableDeleteOnClick = true;
      backspaceClickAction = "delete";
      keySelection = "backspace";
    };
    splitLargeMessages = {
      maxLength = 0;
      disableFileConversion = true;
      hardSplit = false;
    };
  };
}
