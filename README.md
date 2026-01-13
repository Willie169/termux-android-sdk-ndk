# termux-android-sdk-ndk

## Prerequisites

<ul>
<li>Sufficient storage: Approximately 2.1 GB.</li>
<li>Sufficient power supply.</li>
<li>Stable internet connection.</li>
<li>It is recommended to turn off the battery optimization for Termux.</li>
<li>It is recommended to hold wakelock while running the script. You can do so by opening Termux, pulling down the notification bar, and then tapping <strong>Acquire wakelock</strong> on the notification of Termux.</li>
<li>It is recommended to prevent the <code>Process completed (signal 9) - press Enter</code> error in advance. You may encounter it when using Termux, especially when running VMs. To prevent it from occuring, please read tutorial about it in my <strong>Android Non Root</strong>: <a href="https://willie169.github.io/Android-Non-Root/#process-completed-signal-9---press-enter-error">https://willie169.github.io/Android-Non-Root/#process-completed-signal-9---press-enter-error</a> for the fixes.</li>
</ul>

## Usage

Run installer:
```
./install.sh
```
This will non-interactively install:

* Required Termux packages:
  * `aapt`, `aapt2`, `aidl`, android-tools`, `apksigner`, `aria2`, `curl`, `d8`, `jq`, `openjdk-17`, `unzip`.
* Downloads and installs:
  * Android SDK (cmdline-tools, platform-tools, API 36 platforms)
  * Android NDK (latest aarch64 build)
  * Gradle 8.13
* Configures environment variables:
  * `ANDROID_HOME` / `ANDROID_SDK_ROOT`: SDK root
  * `ANDROID_NDK_HOME`: NDK root
  * `JAVA_HOME`: OpenJDK 17
  * Updates `PATH` to include SDK tools, platform-tools, NDK tools, NDK toolchains, and Gradle

## Termux

Termux (`com.termux`) can be installed from [F-Droid](https://f-droid.org/packages/com.termux).

**WARNING**: If you installed termux from Google Play or a very old version, then you will receive package command errors. Google Play builds are deprecated and no longer supported. It is highly recommended that you update to termux-app v0.118.0 or higher as soon as possible for various bug fixes, including a critical world-readable vulnerability reported at <https://termux.github.io/general/2022/02/15/termux-apps-vulnerability-disclosures.html>. It is recommended that you shift to F-Droid or GitHub releases.

Refer to [**Android-Non-Root**](https://github.com/Willie169/Android-Non-Root) for more information.

## References

- <https://github.com/Sohil876/termux-sdk-installer>
- <https://github.com/AndroidIDEOfficial/AndroidIDE>
- <https://github.com/lzhiyong/termux-ndk>
