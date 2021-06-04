FROM ubuntu:20.04

WORKDIR /swift

RUN chmod -R 777 /swift

RUN apt -qq update

ENV TZ Asia/Dhaka
ENV DEBIAN_FRONTEND noninteractive

RUN apt -qq install -y curl git wget \
    python3 python3-pip \
    aria2 \
    ffmpeg mediainfo unzip p7zip-full p7zip-rar


COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod 777 run.sh

RUN useradd -ms /bin/bash unkusr
USER unkusr
CMD ./run.sh
