FROM python:3-alpine

RUN apk add --update --no-cache gcc musl-dev postgresql-dev postgresql-libs postgresql-client=~12
RUN pip3 install requests psycopg2 tabulate

ADD sync sync
CMD python3 sync
