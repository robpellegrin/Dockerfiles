FROM debian:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

RUN apt update && apt install -y curl perl texlive-extra-utils

RUN curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

RUN zcat < install-tl-unx.tar.gz | tar xf -

RUN perl install-tl-*/install-tl --no-interaction

# Set the PATH environment variable
ENV PATH="/usr/local/texlive/2024/bin/x86_64-linux:${PATH}"
ENV LATEXINDENT_CONFIG="/root/mysettings.yaml"

CMD ["bash"]
