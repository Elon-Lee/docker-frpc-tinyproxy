# docker-frpc-tinyproxy
the docker frpc and http tinyrpoxy

useage:

#构建container
docker build -t elonlee/frptinyproxy .

#运行container
docker run -d --name frpc-tinyproxy  elonlee/frptinyproxy


#进入container
docker exec -it frpc-tinyproxy /bin/bash
