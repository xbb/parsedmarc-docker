FROM pypy:3-6

ENV PARSEDMARC_VERSION 6.0.1
RUN pip install -U parsedmarc==$PARSEDMARC_VERSION

CMD ["parsedmarc"]
