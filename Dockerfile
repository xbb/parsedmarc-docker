FROM pypy:3.9-7-slim

ARG REF=315b99f95adaf72e49e8e0dca8213f4deb8dd310

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y gcc libxml2 libxml2-dev libxslt1.1 libxslt1-dev zlib1g zlib1g-dev \
    && pip install -U https://github.com/domainaware/parsedmarc/archive/$REF.tar.gz \
    && rm -rf /root/.cache/ \
    && apt-get purge -y gcc libxml2-dev libxslt-dev libz-dev \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/{apt,dpkg}/

CMD ["parsedmarc"]
