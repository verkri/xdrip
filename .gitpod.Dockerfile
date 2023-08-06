FROM gitpod/workspace-full-vnc

USER root
RUN apt update -qq && apt install zip unzip && \
    cd /opt && \
    wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip && \
    unzip -q *.zip -d /opt/cmdlinetools && \
    rm *.zip && \
    mkdir -p /opt/android-sdk && \
    chmod -R 777 /opt/android-sdk && \
    chown -R gitpod:gitpod /opt/android-sdk

USER gitpod
# ENV ANDROID_HOME /opt/android-sdk
# ENV PATH ${ANDROID_HOME}/cmdline-tools/latest:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${PATH}

RUN mkdir -p /opt/android-sdk/licenses && \
    echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" >> /opt/android-sdk/licenses/android-sdk-license
