FROM ubuntu
MAINTAINER Grupo 8 - EDP

ADD ["text.txt", "./text.txt"]
ADD ["./*.sh", "./"]

ENTRYPOINT ["./menu.sh", "./text.txt"]