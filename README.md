# docker-transmission

## Info:
Based on Alpine:latest

## Usage:
`sudo docker pull lukasmrtvy/docker-transmission ; sudo docker rm -f transmission ; sudo  docker run -d --restart always --net my-bridge -p 9091:9091 -p 51413:51413 -p 51413:51413/udp -v /docker/transmission/conf:/transmission/conf -v /docker/transmission/downloads:/transmission/downloads -v /docker/transmission/incomplete:/transmission/incomplete --name transmission lukasmrtvy/docker-transmission`
