FROM docker.fanyx.xyz/docker-tmnationsbot-base:0.2.0

RUN apt update && \
    apt install -y gettext-base

RUN mkdir -p /var/app/

COPY trackmania_nations_challenge_bot/ /var/app/

COPY _config.ini /var/app/

COPY entrypoint.sh /

WORKDIR /var/app/

ENTRYPOINT ["/entrypoint.sh"]

CMD ["python3","/var/app/main.py"]
