FROM node:10-alpine  as build
LABEL AUTHOR="dalongrong"
LABEL EMAIL="1141591465@qq.com"
WORKDIR /app
COPY app.js /app
COPY package.json /app
COPY .env /app
RUN  yarn && yarn package:alpine  && ls .

FROM alpine
WORKDIR /app
COPY --from=build /app/dotenv-app /app
COPY --from=build /app/.env /app
COPY start.sh /app
RUN apk add --update && apk  add  libstdc++  && \
    chmod +x /app/dotenv-app
ENTRYPOINT [ "./dotenv-app" ]
