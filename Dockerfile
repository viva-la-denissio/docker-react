FROM node:16-alpine AS builder

WORKDIR '/usr/app/frontend'

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/frontend/build /usr/share/nginx/html