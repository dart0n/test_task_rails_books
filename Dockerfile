FROM ruby:3.0.1-alpine

ENV BUNDLER_VERSION=2.0.2

RUN apk add --update --no-cache \
    binutils-gold \
    build-base \
    curl \
    file \
    g++ \
    gcc \
    git \
    less \
    libstdc++ \
    libffi-dev \
    libc-dev \
    linux-headers \
    libxml2-dev \
    libxslt-dev \
    libgcrypt-dev \
    make \
    netcat-openbsd \
    nodejs \
    openssl \
    pkgconfig \
    postgresql-dev \
    python3 \
    tzdata \
    yarn

RUN gem install bundler -v 2.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

# set the configuration options for the nokogiri gem build
RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

# frontend
COPY package.json yarn.lock ./
RUN yarn install --check-files

# copy the rest of the application code and start the application with an entrypoint script
COPY . ./
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
