FROM alpine:latest as alpine

FROM ubuntu:20.04 as ubuntu

RUN yes | unminimize

# separating from unminize for image caching
RUN apt-get install -y zsh sudo less git make curl

RUN useradd -m -s /usr/bin/zsh user && \
    usermod -aG sudo user && \
    echo "user     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    cp /etc/zsh/newuser.zshrc.recommended /home/user/.zshrc && \
    chown user:user /home/user/.zshrc && \
    echo "alias ll='ls -alh'" >> /home/user/.zshrc
USER user
WORKDIR /home/user

ENTRYPOINT [ "/usr/bin/zsh" ]
