# distro os.
FROM ubuntu:bionic
# mkdir users
LABEL maintainer="Takayuki Kamiyama <karuma.reason@gmail.com>"
# build package
RUN apt-get update && apt-get install -y \
git ruby-dev sqlite3 libxslt1-dev libxml2-dev build-essential patch \
libsqlite3-dev libcurl4-openssl-dev curl nodejs && apt-get clean

# locale
RUN apt install -y language-pack-ja
RUN update-locale LANG=ja_JP.UTF-8
RUN echo 'eval "LANG=ja_JP.UTF-8"' >> ~/.bashrc
RUN echo 'eval "export LANG"' >> ~/.bashrc

# utf8
ENV RUBYOPT -EUTF-8

# ruby
FROM ruby:3.3.1

# install
RUN git clone -b main https://github.com/takkii/nyasocom_oss.git
WORKDIR /nyasocom_oss
COPY . /nyasocom_oss
RUN bundle install

EXPOSE 9292

# All Docker remove command. Clean up all.
# docker system prune
# docker container prune
# docker image prune
# docker volume prune
# docker network prune
