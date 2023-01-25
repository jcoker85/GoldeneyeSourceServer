FROM ich777/winehq-baseimage

ENV MAP="ge_archives"
ENV MAXPLAYERS="10"
ENV PORT_INCREMENT="0"

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y tar lib32gcc-s1 p7zip-full winbind xvfb && \
    mkdir -p /servers/geserver && \
    useradd -d /servers/geserver -s /bin/bash steam && \
    mkdir /steamcmd && \
    wget -O /steamcmd/steamcmd_linux.tar.gz http://media.steampowered.com/client/steamcmd_linux.tar.gz && \
    tar -xvzf /steamcmd/steamcmd_linux.tar.gz -C /steamcmd && \
    chown -R steam /steamcmd

COPY ./GoldenEye_Source_v5.0.6_full_server_windows.7z /servers
COPY ./startup.sh /servers
COPY ./server.sh /servers

RUN chown -R steam /servers

ENTRYPOINT ["/servers/startup.sh"]