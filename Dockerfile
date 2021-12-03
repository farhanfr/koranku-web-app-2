FROM fnproject/node:14-dev as build-stage

MAINTAINER mfarhanfr <farhanfitrahtur@gmail.com>

WORKDIR /function

ADD package.json /function/

RUN npm install

FROM fnproject/node:14

WORKDIR /function

ADD . /function/

COPY --from=build-stage /function/node_modules/ /function/node_modules/

RUN chmod -R o+r /function

ENTRYPOINT ["node", "func.js"]