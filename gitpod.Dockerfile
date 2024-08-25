FROM gitpod/workspace-full

USER root

# Install Android SDK command line tools
RUN mkdir -p $HOME/Android/Sdk/cmdline-tools && \
    curl -o commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip && \
    unzip commandlinetools.zip -d $HOME/Android/Sdk/cmdline-tools && \
    rm commandlinetools.zip

# Set environment variables
ENV ANDROID_HOME=$HOME/Android/Sdk
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/cmdline-tools/bin:$ANDROID_HOME/platform-tools

# Accept licenses
RUN yes | sdkmanager --licenses

# Install required packages
RUN sdkmanager "platform-tools" "platforms;android-30" "build-tools;30.0.3"

USER gitpod
