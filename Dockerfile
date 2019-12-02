FROM python:3-slim-buster

RUN ln -sf /usr/share/timezone/Europe/Berlin /etc/localtime && \
echo "Europe/Berlin" > /etc/timezone

RUN apt update && \
    apt install -y gettext-base

RUN echo "Europe/Berlin" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

RUN mkdir -p /var/app/

COPY trackmania_nations_challenge_bot/* /var/app/

COPY _config.ini /var/app/

COPY entrypoint.sh /

WORKDIR /var/app/

RUN ["pip","install","-r","requirements.txt"]

ENTRYPOINT ["/entrypoint.sh"]
