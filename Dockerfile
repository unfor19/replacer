FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y bsdmainutils
WORKDIR /code
COPY . .
RUN chmod +x **/*.sh
ENTRYPOINT [ "./main.sh" ]
