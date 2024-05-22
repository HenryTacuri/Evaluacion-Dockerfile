# Utilizamos la imagen base de node, luego copiamos los archivos json
FROM node:latest AS dev-deps
WORKDIR /app
COPY package.json package.json
RUN npm install

FROM node:latest AS builder
WORKDIR /app
COPY --from=dev-deps /app/node_modules ./node_module
COPY . .
RUN npm run build


#Instalamos todos lo necesarios en el imagen de Ubuntu para poder usar la imagen
#Tambien copiamos los archivos necesarios a las carpetas de nginx de Ubuntu, para poder
#levantar la aplicacion angular en el servidor nginx.
FROM ubuntu:22.04 as ubuntu-server
RUN apt-get update
RUN apt-get install -y curl nginx
RUN ["apt-get", "install", "-y", "vim"]
RUN ["apt-get", "install", "-y", "nodejs"]
COPY --from=builder /app/dist/servidor-docker /var/www/html

#Exponemos los puertos y configuramos los comandos necesarios.
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]


#
#docker run -d -p 80:80 henrytacuri/servidor_docker
#docker run -it henrytacuri/servidor_docker bash


