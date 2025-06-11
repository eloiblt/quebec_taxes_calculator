FROM node:18 as build

WORKDIR /app

COPY . .
RUN npm ci
RUN npm run build


FROM nginx:alpine

COPY --from=build /app/dist/taxes /usr/share/nginx/html
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
