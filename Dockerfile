FROM node:12

WORKDIR /app

ENV PATH="/node_modules/.bin:${PATH}"

COPY package.json yarn.lock ./

RUN yarn install --silent
