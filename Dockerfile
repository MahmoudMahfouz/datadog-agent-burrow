FROM ubuntu
MAINTAINER Mahmoud 

WORKDIR /app
RUN apt update && apt install -y wget
RUN wget -q -O- `wget -q -O- https://api.github.com/repos/linkedin/burrow/releases/latest | awk '/browser_download_url(.*)linux.*"/{ gsub(/"/,"",$2); print $2}'` | tar -zx burrow
ADD burrow-config/ /etc/burrow/

CMD ["/app/burrow", "-config-dir", "/etc/burrow"]
