FROM mazasb/php:7.1

MAINTAINER Balazs Mazas <mazasb@gmail.com>
LABEL updated_at="2017-11-20"

RUN echo "memory_limit=-1" > "$PHP_INI_DIR/conf.d/memory-limit.ini"

RUN curl -sSL https://get.docker.com/ | sh
RUN curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose \
    && chmod +x /usr/local/bin/docker-compose

RUN which ssh-agent || apt-get install -y --no-install-recommends openssh-client

RUN rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove
    # -o APT::AutoRemove::RecommendsImportant=false

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
