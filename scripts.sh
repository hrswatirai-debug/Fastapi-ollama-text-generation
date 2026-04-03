docker build -t text-generation .
#for ollama models
docker run -d -p 8000:8000 --add-host=host.docker.internal:host-gateway text-generation       
#for other models
docker run -d -p 8000:8000 --env-file .env text-generation

#to lst images
docker images

#to list running container 
docker ps

#to list running and stopped containers
docker ps -

#TO VIEW DOCKER CONTAINER LOGS
docker logs <CONTAINER_ID>