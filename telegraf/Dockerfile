ARG TELEGRAF_VERSION
FROM telegraf:${TELEGRAF_VERSION}
COPY docker-entrypoint.sh /
ENTRYPOINT ["sh", "./docker-entrypoint.sh"]
CMD ["telegraf"]