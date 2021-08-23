FROM python:3.8.11-alpine3.14

RUN apk add --update --no-cache gcc=~10.3.1               \
                                musl-dev=1.2.2-r3         \
                                postgresql-dev=13.4-r0    \
                                postgresql-libs=13.4-r0   \
                                postgresql-client=13.4-r0

RUN pip3 install requests==2.25.1  \
                 psycopg2==2.8.6   \
                 tabulate==0.8.9

ADD sync /app/sync

WORKDIR /app
CMD python3 sync
