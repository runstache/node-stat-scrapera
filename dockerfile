FROM node:18 as builder

COPY ./package.json .
COPY ./package-lock.json .
COPY ./yarn.lock .

RUN npm install

WORKDIR /opt/build
RUN touch sample.txt


FROM builder
ARG BUILD=/opt/build

RUN mkdir -m777 /opt/apps

COPY --from=builder ${BUILD}/sample.txt /opt/apps
