# dotenv with pkg demo

## how to running

* install deps

```code
yarn

or

npm install
```

* running

```code
yarn app

or

npm run app
```

* package binary file (include windows mac linux)

```code
yarn  package

or

npm run package

```

* run with packaged binary file

```code
for mac:

./dotenv-app-macos

for linux:

./dotenv-app-linux


for windows:

./dotenv-app-win.exe
```

* notes

```code

you can change .env file see some changes  

best practices  is not commit .env file for scm
```

## with docker running

> for reduce image size build with --targets=alpine args

* build image

```code
docker-compose build
```

* running

```code
docker-compose up
```

* run with builed image && local .env config

```code
touch .env 

&& add some content like below

name  = 荣锋亮
age =  33
platform = userlogin-app
docker run -it -v $PWD/.env:/app/.env dalongrong/dotenv-alpine-demo
```