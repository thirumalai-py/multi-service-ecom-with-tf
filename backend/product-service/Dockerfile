FROM node:18

WORKDIR /product/app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3002

CMD [ "node", "server.js" ]