FROM node:7.7.3

RUN mkdir /root/chateau/
WORKDIR /root/chateau/

RUN apt-get update && \
    apt-get install gettext-base -y
RUN npm install -g chateau
COPY config.js /root/chateau/config.js
COPY docker-entrypoint.sh /root/chateau/docker-entrypoint.sh

# Change to Unix line endings
RUN sed -i 's/\r//' /root/chateau/docker-entrypoint.sh

# Make runnable
RUN chmod 777 /root/chateau/docker-entrypoint.sh

EXPOSE 3000

CMD ["./docker-entrypoint.sh"]
