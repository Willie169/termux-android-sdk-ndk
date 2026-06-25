#!/data/data/com.termux/files/usr/bin/bash

: "${PROFILE:=${HOME}/.bashrc}"
cd ~ || exit
cat >> "$PROFILE" << 'EOF'
export JAVA_HOME="$PREFIX/lib/jvm/java-21-openjdk"
export ANDROID_HOME="${HOME}/Android/Sdk"
export ANDROID_SDK_ROOT="${ANDROID_HOME}"
export ANDROID_NDK_HOME="${HOME}/Android/Sdk/ndk/android-ndk-r29"
export ANDROID_NDK_TOOLCHAINS="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-aarch64"
export PATH="${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_NDK_HOME}:${ANDROID_NDK_TOOLCHAINS}/bin:${PATH}"
EOF
export JAVA_HOME="$PREFIX/lib/jvm/java-21-openjdk"
export ANDROID_HOME="${HOME}/Android/Sdk"
export ANDROID_SDK_ROOT="${ANDROID_HOME}"
export ANDROID_NDK_HOME="${HOME}/Android/Sdk/ndk/android-ndk-r29"
export ANDROID_NDK_TOOLCHAINS="${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-aarch64"
export PATH="${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_NDK_HOME}:${ANDROID_NDK_TOOLCHAINS}/bin:${PATH}"
pkg update
pkg install aapt aapt2 aidl android-tools apksigner d8 jq openjdk-21 unzip wget -y
wget --tries=100 --retry-connrefused --waitretry=5 -O studio.html https://developer.android.com/studio
# shellcheck disable=2155
export CMDLINETOOLS="$(cat studio.html | grep commandlinetools-linux | head -n1 | sed 's/[ \t ]*>//; s/\.zip.*/.zip/')"
rm studio.html*
wget --tries=100 --retry-connrefused --waitretry=5 "https://dl.google.com/android/repository/${CMDLINETOOLS}"
unzip "$CMDLINETOOLS"
mkdir -p ~/Android/Sdk/cmdline-tools/latest
mv cmdline-tools/* ~/Android/Sdk/cmdline-tools/latest
rm -r cmdline-tools
cd ~/Android/Sdk/cmdline-tools/latest/bin || exit
if [ "$#" -gt 0 ]; then
echo y | ./sdkmanager "$@"
fi
cd ~ || exit
wget https://github.com/lzhiyong/termux-ndk/releases/download/android-ndk/android-ndk-r29-aarch64.7z
7z x android-ndk-r29-aarch64.7z -o"${HOME}/Android/Sdk/ndk"
rm android-ndk-r29-aarch64.7z
mkdir -p ~/.gradle
cat > ~/.gradle/gradle.properties << 'EOF'
android.aapt2FromMavenOverride=/data/data/com.termux/files/usr/bin/aapt2
EOF
