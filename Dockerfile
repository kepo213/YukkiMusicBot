FROM debian:latest
FROM python:3.9.12-bullseye
RUN apt update && apt upgrade -y
RUN apt-get install python3-pip ffmpeg -y
RUN pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN mkdir /app/
WORKDIR /app/
COPY . /app/
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
CMD bash start
