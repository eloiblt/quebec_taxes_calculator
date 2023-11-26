FROM node:18 as build

WORKDIR /app

COPY . .
RUN npm ci
RUN npm run build


FROM nginx:latest

COPY --from=build /app/dist/taxes /usr/share/nginx/html
EXPOSE 80