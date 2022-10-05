FROM python:3.9-slim

ARG REF=b86365225ec7dada8c7f1a922f46da73abd8b78d

RUN apt-get update \
    && apt-get -y upgrade \
    && pip install -U https://github.com/domainaware/parsedmarc/archive/$REF.tar.gz \
    && rm -rf /root/.cache/ \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/{apt,dpkg}/

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]