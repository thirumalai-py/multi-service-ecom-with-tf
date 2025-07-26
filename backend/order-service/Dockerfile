FROM node:18

WORKDIR /order/app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3004

CMD [ "node", "server.js" ]