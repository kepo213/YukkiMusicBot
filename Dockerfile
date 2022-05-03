FROM debian:latest
FROM python:3.9.12-buster
RUN apt-get update && apt-get upgrade \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install -U pip
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN npm i -g npm
RUN mkdir /app/
WORKDIR /app/
COPY . /app/
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
CMD bash start
