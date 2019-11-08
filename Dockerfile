FROM python:3-buster

RUN apt update && apt install -y git
RUN mkdir -p /var/app

WORKDIR /var/app

RUN git clone https://github.com/Excidion/trackmania_nations_challenge_bot.git

WORKDIR /var/app/trackmania_nations_challenge_bot

COPY config.ini ./

RUN ["pip","install","-r","requirements.txt"]

CMD ["python3","./main.py"]
