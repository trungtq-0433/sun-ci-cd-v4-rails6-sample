# README
## Init rails 
`rails new sun-ci-cd-v4-rails6-sample --database=mysql --skip-turbolinks --skip-test`

## Init Dockerfile 
```
FROM ruby:2.7.1

RUN apt-get update && apt-get install -y \
    software-properties-common locales

RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=C.UTF-8
ENV LC_CTYPE=UTF-8
ENV TERM xterm
ENV DEBIAN_FRONTEND=noninteractive

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs

RUN apt-get -y update && apt-get -y install ruby-full

WORKDIR /workdir

```

`docker build -t tqtrung09/ruby2.7.1:latest .`

`docker push tqtrung09/ruby2.7.1:latest`

