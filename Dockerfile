FROM ruby:3.4.3-slim-bookworm AS base

WORKDIR /app

ARG POSTGRES_VERSION=14

RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y postgresql-common
RUN echo y | /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh

RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y \
  ca-certificates \
  curl \
  ffmpeg \
  file \
  imagemagick \
  libjemalloc2 \
  locales \
  postgresql-client-${POSTGRES_VERSION} \
  tzdata && \
  rm -rf /var/lib/apt/lists /var/cache/apt/archives

FROM base AS build

RUN apt-get update -qq && \
  apt-get install --no-install-recommends -y \
  git \
  gcc \
  libc6-dev \
  make \
  libffi-dev \
  libpq-dev \
  libyaml-dev && \
  rm -rf /var/lib/apt/lists /var/cache/apt/archives
