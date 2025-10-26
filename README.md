image creation

docker build -t image-name .


container creation

docker run -d -p 8002:8000 --name container-name image-name


view directory 

docker exec -it container-name /bin/bash
