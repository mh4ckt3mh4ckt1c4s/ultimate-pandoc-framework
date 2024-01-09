FROM docker.io/alpine:3.18.2

RUN apk add pandoc texlive texlive-luatex biblatex texmf-dist texmf-dist-most

RUN mkdir /host

WORKDIR /host
