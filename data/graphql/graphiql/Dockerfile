FROM alpine

EXPOSE 3000

RUN apk add --update \
    bash \
    git \
    nodejs \
    nodejs-npm

RUN git clone https://github.com/OlegIlyenko/graphiql-workspace

WORKDIR /graphiql-workspace

RUN npm install && npm run build

RUN npm install express

ADD server.js server.js

RUN mv example/index.html .

ENTRYPOINT ["node", "server.js"]
