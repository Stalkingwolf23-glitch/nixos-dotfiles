// => engine/services/updates.js
// ===========================================================
// This module allows Sine to update itself, removing the
// need for the user to reinstall Sine.
// ===========================================================

import utils from "chrome://userscripts/content/engine/utils/utils.js";
import ucAPI from "chrome://userscripts/content/engine/utils/uc_api.js";

export default {
    os: (() => {
      const os = Services.appinfo.OS.toLowerCase();
      if (os.includes("darwin") || os.includes("mac")) {
        return "osx";
      }
      if (os.includes("win")) {
        return "win";
      }
      return "linux";
    })(),
    cpu: (() => {
        const cpu = Services.appinfo.XPCOMABI.toLowerCase();

        if (cpu.includes("arm") || cpu.includes("aarch64")) {
          return "arm64";
        }
    
        if (
          cpu.includes("x86") ||
          cpu.includes("i386") ||
          cpu.includes("i686") ||
          cpu.includes("ia32") ||
          cpu.includes("amd64") ||
          cpu.includes("x64") ||
          cpu.includes("x86_64") ||
          cpu.includes("win64") ||
          cpu.includes("wow64")
        ) {
          return "x64";
        }
    
        return "unknown";
    })(),

    async updateEngine(update, releaseLink) {
        Services.appinfo.invalidateCachesOnRestart();

        try {
            // Convert mods to v2.3+ structure, to prevent necessary re-installing (despite recommended option).
            const mods = await utils.getMods();
            for (const mod of Object.values(mods)) {
                if (mod.preferences) {
                    mod.preferences = "preferences.json";
                } else {
                    mod.preferences = "";
                }

                if (mod.style) {
                    if (typeof mod.style === "object") {
                        if (mod.style.chrome) {
                            mod.style.chrome = "userChrome.css";
                        }
                        if (mod.style.content) {
                            mod.style.content = "userContent.css";
                        }
                    } else {
                        mod.style = "chrome.css";
                    }
                }
            }
            await IOUtils.writeJSON(utils.modsDataFile, mods);

            const dirSvc = Cc["@mozilla.org/file/directory_service;1"].getService(Ci.nsIProperties);
            const browserPath = dirSvc.get("XREExeF", Ci.nsIFile).parent.path;

            const identifierPath = PathUtils.join(utils.jsDir, "update");
            await IOUtils.writeUTF8(identifierPath, "");

            const updaterName = "sine-" + this.os + "-" + this.cpu + (this.os === "win" ? ".exe" : "");
            const exePath = PathUtils.join(PathUtils.profileDir, "chrome", updaterName);

            const resp = await fetch(releaseLink.replace("{version}", update.version) + updaterName);
            const buf = await resp.arrayBuffer();
            const bytes = new Uint8Array(buf);
            await IOUtils.write(exePath, bytes);

            const updater = Cc["@mozilla.org/file/local;1"].createInstance(Ci.nsIFile);
            updater.initWithPath(exePath);

            const proc = Cc["@mozilla.org/process/util;1"].createInstance(Ci.nsIProcess);
            proc.init(updater);

            const args = [
                "--browser", browserPath,
                "--profile", PathUtils.profileDir,
                "-s",
                "--update"
            ];
            proc.run(false, args, args.length);

            await new Promise(resolve => {
                const interval = setInterval(async () => {
                    if (!(await IOUtils.exists(identifierPath))) {
                        clearInterval(interval);
                        resolve();
                    }
                }, 500);
            });
        } catch (err) {
            console.error("Error updating Sine: " + err);
            throw err;
        }

        Services.prefs.setStringPref("sine.version", update.version);
        Services.prefs.setBoolPref("sine.engine.pending-restart", true);

        ucAPI.restart(true);

        return true;
    },

    async fetch() {
        return await ucAPI
            .fetch(
                "https://raw.githubusercontent.com/CosmoCreeper/Sine/" +
                    (Services.prefs.getBoolPref("sine.is-cosine", false) ? "cosine" : "main") +
                    "/engine.json"
            )
            .catch((err) => console.warn(err));
    },

    async checkForUpdates() {
        const engine = await this.fetch();
        if (engine && engine.updates && engine.updates.length > 0) {
            Services.prefs.setStringPref("sine.latest-version", engine.updates[0].version);
            return await this.updateEngine(engine.updates[0], engine.link);
        }
    },
};
