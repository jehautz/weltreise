FROM node:10-alpine AS node-builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install --force
RUN npm install --global gulp-cli
COPY . .
RUN gulp

FROM nginx:alpine
COPY --from=node-builder /usr/src/app/docs /usr/share/nginx/html
