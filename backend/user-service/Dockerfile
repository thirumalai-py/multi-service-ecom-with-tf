FROM node:18

WORKDIR /user/app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 3001

CMD [ "node", "server.js" ]








