sudo pamac install android-studio
echo "export ANDROID_HOME=$HOME/Android/Sdk" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/emulator" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/tools" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/tools/bin" >> ~/.bashrc
echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" >> ~/.bashrc