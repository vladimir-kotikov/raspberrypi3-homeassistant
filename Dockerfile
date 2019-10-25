# syntax = docker/dockerfile:1.0-experimental
FROM alpine/git AS config_fetcher
ARG GITHUB_TOKEN
RUN git clone https://vladimir-kotikov:${GITHUB_TOKEN}@github.com/vladimir-kotikov/prettyhome-config /config

FROM homeassistant/raspberrypi3-homeassistant:stable
# redirect logs to stdout
RUN ln -sf /dev/null /var/log/homeassistant.log

COPY --from=config_fetcher /config /config
VOLUME /config

CMD ["python3", "-m", "homeassistant", "--config", "/config", "--log-file", "/var/log/homeassistant.log" ]
