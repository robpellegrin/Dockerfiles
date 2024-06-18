FROM debian:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    NVM_DIR="/root/.nvm" \
    NODE_VERSION="20" \
    ANDROID_SDK_ROOT="/sdk"

# Update package list and install necessary packages
RUN apt update && apt install -y curl openjdk-17-jdk unzip

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Ensure the necessary environment variables are set for nvm
RUN bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION"

# Copy and unzip the command line tools
COPY commandlinetools-linux-11076708_latest.zip /cmdline-tools.zip
RUN mkdir -p /sdk/cmdline-tools \
    && unzip /cmdline-tools.zip -d /sdk/cmdline-tools \
    && mv /sdk/cmdline-tools/cmdline-tools /sdk/cmdline-tools/latest

# Set the SDK root environment variable
ENV PATH="/sdk/cmdline-tools/latest/bin:${PATH}"

RUN yes | sdkmanager --licenses

# Expose port 8081 for the Metro Bundler
EXPOSE 8081

# Default command to start the Metro Bundler
#CMD ["npx", "react-native", "start", "--host", "0.0.0.0"]
CMD ["bash"]