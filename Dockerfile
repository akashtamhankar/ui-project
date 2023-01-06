FROM node:16.13   as node
WORKDIR /app
#WORKDIR /src
COPY . .
#RUN apt-get update -y
RUN npm cache clean --force
RUN npm i -g @angular/cli@latest
RUN npm i --force  

RUN ng build --prod --base-href /live-agent-panel/

FROM nginx:alpine
COPY --from=node /app/dist/live-agent-panel   /usr/share/nginx/html
EXPOSE 80

