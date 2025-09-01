FROM node:18-alpine AS build
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

FROM node:18-alpine
WORKDIR /usr/src/app
ENV NODE_ENV=production

COPY package*.json ./
RUN npm ci --only=production

COPY --from=build /usr/src/app/dist ./dist

EXPOSE 8080

CMD ["node", "dist/server.js"]