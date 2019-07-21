FROM homeassistant/raspberrypi3-homeassistant
# redirect logs to stdout
RUN ln -sf /dev/null /var/log/homeassistant.log
CMD ["python3", "-m", "homeassistant", "--config", "/config", "--log-file", "/var/log/homeassistant.log" ]
