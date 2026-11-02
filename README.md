<p align="center">
  <img src="chrome.ico" alt="Arnium Browser Logo" width="128">
</p>

# Arnium Browser

<p align="center">
  <a href="https://github.com/srijibdalal1974/arnium-browser/releases/latest">
    <img src="https://img.shields.io/github/v/release/srijibdalal1974/arnium-browser?color=0078D4&label=Release&logo=github" alt="Latest Release">
  </a>
  <img src="https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-blue?logo=windows&logoColor=white" alt="Platform: Windows 10 | 11">
  <a href="LICENSE">
    <img src="https://img.shields.io/badge/License-BSD%203--Clause-blue.svg" alt="License: BSD 3-Clause">
  </a>
</p>

> A lightweight, user-first Chromium fork focused on high-fidelity media pipelines, decluttered UI ergonomics, and unmanaged local profile privacy.

Arnium is built for users who want the web compatibility and rendering speed of Chromium without corporate overhead, telemetry pop-ups, forced cloud synchronization, and artificial platform-codec restrictions.

---

## 🌟 Why Arnium? (Key Advantages)

Most mainstream browsers either enforce enterprise telemetry and aggressive sign-in banners, or ship with stripped-down media backends that fail on high-resolution HDR and multi-channel surround setups. Arnium modifies Chromium at the native C++ level to deliver three core advantages:

1. **Unthrottled Media Decoding Pipeline**
   - **Direct Media Foundation Integration**: Hooks directly into native Windows Media Foundation transforms (`MFVideoFormat`, `DolbyDecMFT`) for hardware-accelerated video decoding.
   - **Dolby Vision & Spatial Audio Ready**: Engineered to pass through and decode Dolby Vision (Profiles 5 & 8.1) and Dolby Atmos / AC-3 / E-AC-3 audio streams natively for local media files and direct streams on supported Windows hardware.
   - **PlayReady SL3000 Support**: Retains hardware-level DRM communication endpoints required for secure hardware decoding on compatible systems.

2. **Clean, Unmanaged Interface Ergonomics**
   - **No Corporate Management Banners**: Permanently disables "Managed by your organization" warnings, enterprise enrollment nags, and fake policy alerts.
   - **Direct Toolbar Navigation**: Integrates a direct settings gear button onto the main toolbar for 1-click access to preferences without menu hunting.
   - **Private Local Profile Experience**: Strips out persistent identity banners, avatar sync prompts, and forced Google cloud account linking.

3. **Optimized Resource Footprint**
   - Stripped of redundant background diagnostic up-linkers, metric upload services, and background update pollers.
   - Reduced idle RAM usage and cleaner background task scheduling on Windows.

---

## 🎬 Media Playback & Hardware Capabilities

Arnium enables advanced hardware media decoding paths directly within Chromium's core.

### Compatibility & Recommendations

| Feature | Local Files & Direct Streams | Streaming Sites (OTT Platforms) | Requirements & Recommendation |
| :--- | :--- | :--- | :--- |
| **Dolby Vision** | ✅ Fully Supported | 🌟 **Definitely Try It!** (Platform dependent) | Dolby Vision display + Windows Store Extensions. You should test it on your streaming services! |
| **Dolby Atmos / AC-3** | ✅ Fully Supported | 🌟 **Definitely Try It!** (Platform dependent) | Windows Spatial Sound / Dolby Atmos active. You should test it on your multi-channel media setups! |
| **PlayReady SL3000** | ✅ Fully Supported | 🌟 **Definitely Try It!** (Platform dependent) | Intel 7th Gen+ / AMD equivalent with HDCP 2.2. Arnium exposes the needed hardware paths! |
| **AV1 / HEVC (H.265)** | ✅ Hardware Accelerated | ✅ Hardware Accelerated | Hardware GPU decoder + Windows HEVC Video Extensions. |

---

### You Should Definitely Try Streaming on OTT Services!

We encourage you to try your favorite streaming platforms (Netflix, Prime Video, Disney+, Hotstar, etc.) in Arnium:

- **Hardware Capabilities Built In**: Because Arnium exposes native Windows Media Foundation pipelines and hardware-level PlayReady SL3000 flags, your machine is equipped to request high-tier video and multichannel audio streams.
- **Why You Should Give It a Shot**: While commercial streaming providers manage strict server-side whitelists for browser signatures, many users successfully get high-definition, HDR, or surround streams depending on their subscription tier, installed extensions, and system hardware.
- **Graceful Fallback**: Even if a specific service does not negotiate its highest tier due to custom browser signatures, Arnium will seamlessly fall back to standard high-definition playback (1080p stereo / Widevine L3), so your content will always play.

---

## 📁 Repository Structure

This repository provides all source diffs and configuration files needed to audit, modify, and build Arnium independently:

- **`arnium_modifications.patch`**: Complete C++ unified patch containing all UI modifications, removed enterprise nag screens, custom toolbar button injection, and profile view adjustments.
- **`args.gn`**: Production GN compilation configuration specifying proprietary codec inclusion, platform decoder flags, and release optimizations.
- **`arnium_installer.iss`**: Inno Setup script that packages the compiled binary tree into a standalone, non-administrative per-user installer (`ArniumSetup.exe`).
- **`chrome.ico`**: High-resolution application icon used for branding and installer packaging.
- **`LICENSE`**: BSD 3-Clause Open Source License agreement.

---

## 🛠️ How to Build from Source

### Prerequisites
- Windows 10 or 11 (x64)
- Visual Studio 2022 (Community or higher) with:
  * Desktop development with C++
  * Windows 10/11 SDK (version 10.0.22621.0 or newer)
- [Google Depot Tools](https://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html) added to system `PATH`
- [Inno Setup 7](https://jrsoftware.org/isinfo.php) (for creating the setup executable)

### Build Steps

1. **Obtain Chromium Source:**
   ```cmd
   mkdir chromium && cd chromium
   fetch --nohooks chromium
   cd src
   git checkout tags/<target-chromium-version>
   gclient sync
## 📁 Repository Structure

This repository provides all source diffs and configuration files needed to audit, modify, and build Arnium independently:

- **`arnium_modifications.patch`**: Complete C++ unified patch containing all UI modifications, removed enterprise nag screens, custom toolbar button injection, and profile view adjustments.
- **`args.gn`**: Production GN compilation configuration specifying proprietary codec inclusion, platform decoder flags, and release optimizations.
- **`arnium_installer.iss`**: Inno Setup script that packages the compiled binary tree into a standalone, non-administrative per-user installer (`ArniumSetup.exe`).
- **`chrome.ico`**: High-resolution application icon used for branding and installer packaging.
- **`LICENSE`**: BSD 3-Clause Open Source License agreement.

---

## 🛠️ How to Build from Source

### Prerequisites
- Windows 10 or 11 (x64)
- Visual Studio 2022 (Community or higher) with:
  * Desktop development with C++
  * Windows 10/11 SDK (version 10.0.22621.0 or newer)
- [Google Depot Tools](https://commondatastorage.googleapis.com/chrome-infra-docs/flat/depot_tools/docs/html/depot_tools_tutorial.html) added to system `PATH`
- [Inno Setup 7](https://jrsoftware.org/isinfo.php) (for creating the setup executable)

### Build Steps

1. **Obtain Chromium Source:**
   ```cmd
   mkdir chromium && cd chromium
   fetch --nohooks chromium
   cd src
   git checkout tags/<target-chromium-version>
   gclient sync
