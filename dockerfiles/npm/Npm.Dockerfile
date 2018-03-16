FROM node:6-alpine

WORKDIR /npm

ARG package
ADD $package .

RUN npm install --no-scripts
