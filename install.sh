#!/data/data/com.termux/files/usr/bin/bash

cat >> ~/.bashrc << 'EOF'
export JAVA_HOME="$PREFIX/lib/jvm/java-17-openjdk"
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export ANDROID_HOME="$ANDROID_SDK_ROOT"
export ANDROID_NDK_HOME="$HOME/Android/Sdk/ndk/android-ndk-r29"
export ANDROID_NDK_TOOLCHAINS="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-aarch64"
export PATH="$JAVA_HOME/bin:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_NDK_HOME:$ANDROID_NDK_TOOLCHAINS/bin:$PATH"
EOF
source ~/.bashrc
pkg update
pkg install aapt aapt2 aidl android-tools apksigner d8 jq openjdk-17 unzip wget -y
cd $HOME
wget https://dl.google.com/android/repository/commandlinetools-linux-13114758_latest.zip
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
echo y | ./sdkmanager "build-tools;30.0.3" "platform-tools" "platforms;android-33"
cd $HOME
wget https://github.com/lzhiyong/termux-ndk/releases/download/android-ndk/android-ndk-r29-aarch64.7z
7z x android-ndk-r29.7z -o$HOME/Android/Sdk/ndk
rm android-ndk-r29.7z
mkdir -p ~/.gradle
cat > ~/.gradle/gradle.properties << 'EOF'
android.aapt2FromMavenOverride=/data/data/com.termux/files/usr/bin/aapt2
EOF
