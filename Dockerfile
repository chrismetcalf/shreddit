FROM ubuntu:latest
LABEL \
  org.freenas.autostart="true"            \
  org.freenas.interactive="false"         \
  org.freenas.version="Latest"            \
  org.freenas.upgradeable="true"          \
  org.freenas.volumes="[                  \
    {                                     \
      \"name\": \"config\",               \
      \"descr\": \"Config storage space\" \
    }                                     \
  ]"

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y python-pip cron
RUN pip install shreddit

ADD crontab /etc/cron.d/shreddit-cron
RUN chmod 0644 /etc/cron.d/shreddit-cron
RUN touch /var/log/cron.log

VOLUME /config
