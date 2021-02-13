FROM fedora:32

RUN ls

RUN yum -y install \
	texlive-scheme-full \
    latexmk

COPY entrypoint.sh /usr/src/entrypoint.sh
COPY cv /usr/src/cv
RUN chmod +x /usr/src/entrypoint.sh

ENTRYPOINT ["/usr/src/entrypoint.sh"]
