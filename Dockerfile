FROM archlinux:latest

RUN pacman --version

RUN ls

RUN pacman -Sy install \
    texlive-base \
    latexmk 

RUN pacman -Sy install \
	texlive-pictures \
	texlive-latex-extra \
	texlive-latex-recommended

COPY entrypoint.sh /usr/src/entrypoint.sh
COPY cv /usr/src/cv
RUN chmod +x /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
