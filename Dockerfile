FROM node:10-alpine  as build
LABEL AUTHOR="dalongrong"
LABEL EMAIL="1141591465@qq.com"
WORKDIR /app
COPY app.js /app
COPY package.json /app
COPY .env /app
RUN  yarn && yarn package
FROM alpine
WORKDIR /app
COPY --from=build /app/dotenv-app-linux /app
COPY --from=build /app/.env /app
RUN apk add --update && apk  add glib  && \
    chmod +x /app/dotenv-app-linux
ENTRYPOINT [ "./dotenv-app-linux" ]
