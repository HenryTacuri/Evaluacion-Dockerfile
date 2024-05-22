### Nombre: 
Henry Tacuri


### Construcción de la aplicacion angular
Para construir la aplicación angular utilizamos el comando npm install

### Construcción de la imagen
Comandos:
* docker build -t henrytacuri/servidorDocker .

### Comandos para levantar la aplicación angular y modificar la aplicación angular

***Comando para levantar la aplicación angular:** 
docker run -d -p 80:80 henrytacuri/servidor_docker

***Comando para modificar la aplicación angular:** 
docker run -it henrytacuri/servidor_docker bash

Para modicar la apliación nos direccionamos al direcctrio /var/www/html de ubuntu, luego modificamos 
los archivos necesarios. El proceso de modificación se realiza con vim.

