FROM python:3.9-slim

ARG REF=b10cc06441ab5c43882072a1a6b3ae90047b9a20

RUN apt-get update \
    && apt-get -y upgrade \
    && pip install -U https://github.com/domainaware/parsedmarc/archive/$REF.tar.gz \
    && rm -rf /root/.cache/ \
    && apt-get autoremove -y --purge \
    && rm -rf /var/lib/{apt,dpkg}/

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
