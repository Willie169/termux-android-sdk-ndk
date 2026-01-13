#!/data/data/com.termux/files/usr/bin/bash
set -eu
cat >> ~/.bashrc << 'EOF'
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export ANDROID_NDK_HOME="$HOME/Android/Sdk/ndk/android-ndk-r29"
export JAVA_HOME="$PREFIX/lib/jvm/java-17-openjdk"
export PATH="$JAVA_HOME/bin:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_NDK_HOME:$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-aarch64/bin:$HOME/gradle/gradle-8.13/bin:$PATH"
EOF
source ~/.bashrc
pkg update
pkg install aapt aapt2 aidl android-tools apksigner aria2 d8 jq openjdk-17 unzip -y
cd $HOME
aria2c https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip
unzip commandlinetools-linux-13114758_latest.zip
rm commandlinetools-linux-13114758_latest.zip
mkdir Android
cd Android
mkdir Sdk
cd Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
mkdir cmdline-tools
cd cmdline-tools
mkdir latest
cd latest
mv $HOME/cmdline-tools/* .
rm -r $HOME/cmdline-tools
cd bin
echo y | ./sdkmanager "platform-tools" "platforms;android-36"
cd $HOME
mkdir gradle
cd gradle
aria2c https://services.gradle.org/distributions/gradle-8.13-bin.zip
unzip gradle-8.13-bin.zip
rm gradle-8.13-bin.zip
aria2c https://github.com/lzhiyong/termux-ndk/releases/download/android-ndk/android-ndk-r29-aarch64.7z
7z x android-ndk-r29.7z -o$HOME/Android/Sdk/ndk
rm android-ndk-r29.7z
