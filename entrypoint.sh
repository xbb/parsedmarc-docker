#!/usr/bin/env sh

# For backward compatibility,
#  some users may still use parsedmarc in the docker run command argument
[ "$1" = "parsedmarc" ] && shift

exec /usr/local/bin/parsedmarc "${@}"