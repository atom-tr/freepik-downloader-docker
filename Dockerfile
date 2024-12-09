FROM node:22.12.0-alpine3.20

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

USER node

COPY --chown=node:node package*.json ./
COPY --chown=node:node . .

RUN npm install
RUN npm run build


EXPOSE 8080

CMD [ "npm", "run", "api" ]
