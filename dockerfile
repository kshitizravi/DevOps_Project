# Dockerfile

FROM node:16-alpine 

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

EXPOSE 9090

CMD ["npm", "start"]
