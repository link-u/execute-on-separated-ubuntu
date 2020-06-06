FROM docker:dind

COPY ["entrypoint.sh", "Dockerfile-*", "/"]
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
