FROM docker.io/pandoc/latex:latest-ubuntu

RUN apt update -y && apt install -y git

RUN mkdir /host

WORKDIR /host

