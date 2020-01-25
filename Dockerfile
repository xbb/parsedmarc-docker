FROM pypy:3.5-7-slim

ENV PARSEDMARC_VERSION 6.8.2
RUN apt-get update \
    && apt-get install -y gcc libxml2-dev libxslt-dev libz-dev \
    && pip install -U parsedmarc==$PARSEDMARC_VERSION \
    && rm -rf /root/.cache/ \
    && apt-get purge -y gcc \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg}/

CMD ["parsedmarc"]
