FROM google/golang
MAINTAINER Cesar J. Alaniz cesar@alanisoft.com

RUN apt-get update -y && apt-get install --no-install-recommends -y -q nginx 
RUN curl -o /usr/local/bin/confd -L https://github.com/kelseyhightower/confd/releases/download/v0.6.0-alpha3/confd-0.6.0-alpha3-linux-amd64
RUN chmod +x /usr/local/bin/confd
RUN mkdir -p /etc/confd/{conf.d,templates}

ADD conf.d/nginx.toml /etc/confd/conf.d/nginx.toml
ADD templates/nginx.tmpl /etc/confd/templates/nginx.tmpl
ADD boot.sh /usr/local/bin

ONBUILD ADD ssl/certs /etc/ssl/certs
ONBUILD ADD ssl/private /etc/ssl/private

EXPOSE 80
EXPOSE 443

ENTRYPOINT ['/usr/local/bin/boot.sh']

