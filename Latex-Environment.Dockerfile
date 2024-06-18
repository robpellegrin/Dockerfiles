FROM debian:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

RUN apt update && apt install -y curl wget perl

RUN curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

RUN zcat < install-tl-unx.tar.gz | tar xf -

#RUN cd install-tl-20240617

RUN perl install-tl-20240617/install-tl --no-interaction

# Set the PATH environment variable
ENV PATH="/usr/local/texlive/2024/bin/x86_64-linux:${PATH}"

CMD ["bash"]