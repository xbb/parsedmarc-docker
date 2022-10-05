FROM pypy:3.9-7-slim

ARG REF=b86365225ec7dada8c7f1a922f46da73abd8b78d

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y gcc libxml2 libxml2-dev libxslt1.1 libxslt1-dev zlib1g zlib1g-dev \
    && pip install -U https://github.com/domainaware/parsedmarc/archive/$REF.tar.gz \
    && rm -rf /root/.cache/ \
    && apt-get purge -y gcc libxml2-dev libxslt-dev libz-dev \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/{apt,dpkg}/

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]