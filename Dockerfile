FROM ruby:3.3.0-bullseye

ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo
ENV EDITOR=vim

ENV RUBY_YJIT_ENABLE=1

EXPOSE 3000

RUN apt update -qq &&\
    apt upgrade -y &&\
    apt install -y --no-install-recommends \
    vim \
    default-mysql-client-core &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
