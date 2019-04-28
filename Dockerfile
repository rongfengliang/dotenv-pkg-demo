FROM node:10-alpine  as build
LABEL AUTHOR="dalongrong"
LABEL EMAIL="1141591465@qq.com"
WORKDIR /app
COPY app.js /app
COPY package.json /app
COPY .env /app
RUN  yarn && yarn package && ./dotenv-app-linux  && ls .

FROM alpine
WORKDIR /app
COPY --from=build /app/dotenv-app-linux /app
COPY --from=build /app/.env /app
COPY start.sh /app
RUN apk add --update && apk  add glib  && \
    chmod +x /app/dotenv-app-linux && chmod +x /app/start.sh
ENTRYPOINT [ "./start.sh" ]
