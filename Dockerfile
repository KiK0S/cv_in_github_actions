FROM archlinux:latest

RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc"

RUN pacman --version

RUN chmod 777 /usr/bin/pacman && ldd /usr/bin/pacman && useradd -ms /bin/bash kikos -p password

RUN pacman -Syyu --noconfirm && \
	pacman -S --noconfirm binutils make gcc \
	          fakeroot expac yajl\
	          git expac yajl go base base-devel



RUN pacman -Sy --noconfirm\
    texlive-most

COPY entrypoint.sh /usr/src/entrypoint.sh
COPY cv /usr/src/cv
RUN chmod +x /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
