FROM jenkins/jnlp-slave:latest

USER root

COPY start /usr/local/bin/start

RUN curl -fsSL get.docker.com -o get-docker.sh && \
	sh get-docker.sh && \
	sed -i 's/ulimit.*$/echo ''/g' /etc/init.d/docker && \
	usermod -aG docker jenkins

ENTRYPOINT ["start"]