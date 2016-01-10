FROM nginx:1.9

ENV CONSUL_TEMPLATE_VERSION=0.12.0 S6_VERSION_OVERLAY=1.17.1.1

RUN apt-get update && apt-get install -y curl unzip && \
	rm -rf /var/lib/apt/lists/* && \
	curl -Ls https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION_OVERLAY}/s6-overlay-amd64.tar.gz \
		| tar -xz -C / && \
	curl -Ls https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip \
		> /tmp/consul-template.zip && \
	unzip /tmp/consul-template.zip -d /usr/local/bin && \
	rm -f /tmp/consul-template.zip

ENTRYPOINT ["/init"]

CMD ["nginx", "-g", "daemon off;"]

ADD etc /etc
