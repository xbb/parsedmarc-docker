FROM pypy:3.9-7-slim

ENV PARSEDMARC_VERSION 7.1.1
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y gcc libxml2 libxml2-dev libxslt1.1 libxslt1-dev zlib1g zlib1g-dev \
    && pip install --use-feature=2020-resolver -U parsedmarc==$PARSEDMARC_VERSION \
    && rm -rf /root/.cache/ \
    && apt-get purge -y gcc libxml2-dev libxslt-dev libz-dev \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/{apt,dpkg}/

CMD ["parsedmarc"]
