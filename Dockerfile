FROM python:3-alpine

RUN mkdir -p /var/app/

COPY trackmania_nations_challenge_bot/* /var/app/

COPY config.ini /var/app/

COPY entrypoint.sh /

WORKDIR /var/app/

RUN ["pip","install","-r","requirements.txt"]

ENTRYPOINT ["/entrypoint.sh"]
