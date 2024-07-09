FROM debian:latest

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get install -y curl \
                       build-essential \
                       pkg-config \
                       perl \
                       && \
    apt-get clean

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Set environment variables
ENV PATH="/root/.cargo/bin:${PATH}"

# Configure bash prompt
RUN echo 'PS1="[\[\e[0;31m\]rust-environment@\033[38;5;208mdocker\[\e[0m\]] \W # "' >> /root/.bashrc

# Default command
CMD ["bash"]
