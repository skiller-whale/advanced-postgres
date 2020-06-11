FROM python:3-alpine

RUN apk add --update --no-cache postgresql-libs
RUN apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev
RUN pip3 install requests psycopg2

ADD sync sync
CMD python3 sync
