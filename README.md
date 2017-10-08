# docker-transmission


`docker pull lukasmrtvy/docker-transmission ;docker rm- f transmission ; docker run -d --restart always --net my-bridge -p 9091:9091 -p 51413:51413 -p 51413:51413/udp -v /docker/transmission/:/transmission/conf  -v /docker/transmission/:/transmission/downloads  -v /docker/transmission/:/transmission/incomplete --name transmission lukasmrtvy/docker-transmission`
