FROM ich777/winehq-baseimage

ENV MAP="ge_archives"
ENV MAXPLAYERS="10"

RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y tar lib32gcc-s1 p7zip-full winbind screen xvfb && \
    mkdir -p /servers/geserver && \
    mkdir /steamcmd && \
    wget -O /steamcmd/steamcmd_linux.tar.gz http://media.steampowered.com/client/steamcmd_linux.tar.gz && \
    tar -xvzf /steamcmd/steamcmd_linux.tar.gz -C /steamcmd && \
    /steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType windows +force_install_dir /servers/geserver +logon anonymous +app_update 310 +quit

COPY ./GoldenEye_Source_v5.0.6_full_server_windows.7z /servers/geserver
RUN 7z x -y -o/servers/geserver /servers/geserver/GoldenEye_Source_v5.0.6_full_server_windows.7z
COPY ./startup.sh /servers/geserver

ENTRYPOINT ["/servers/geserver/startup.sh"]