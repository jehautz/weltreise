FROM node:10-alpine AS node-builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install --global gulp-cli
RUN npm install --save --legacy-peer-deps
COPY . .
RUN gulp

FROM nginx:alpine
COPY --from=node-builder /usr/src/app/docs /usr/share/nginx/html
