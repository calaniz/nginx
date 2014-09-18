FROM google/golang
MAINTAINER Cesar J. Alaniz cesar@alanisoft.com

RUN echo ""deb http://http.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/wheezy-backports.list"
RUN apt-get update -y && apt-get -t wheezy-backports install --no-install-recommends -y -q nginx 
RUN curl -o /usr/local/bin/confd -L https://github.com/kelseyhightower/confd/releases/download/v0.6.0-alpha3/confd-0.6.0-alpha3-linux-amd64
RUN chmod +x /usr/local/bin/confd
RUN mkdir -p /etc/confd/{conf.d,templates}

ADD conf.d/nginx.toml /etc/confd/conf.d/nginx.toml
ADD templates/nginx.tmpl /etc/confd/templates/nginx.tmpl
ADD ssl/certs/StartSSLTrustChain.pem /etc/ssl/certs/StartSSLTrustChain.pem
ADD boot /bin/boot
RUN chmod +x /bin/boot

ONBUILD ADD ssl/certs /etc/ssl/certs
ONBUILD ADD ssl/private /etc/ssl/private

EXPOSE 80
EXPOSE 443

CMD []
ENTRYPOINT ["/bin/boot"]

