FROM 		nuancemobility/sensu-client
MAINTAINER 	sspcm <mobility-sspcm@nuance.com>

# Configure Sensu with whatever your checks require
#RUN 		apt-get install -y ruby zlib1g-dev ruby-dev build-essential git libsmi2ldbl && \
#			gem install net-ping sensu-plugin snmp nokogiri nori rest-client colorize --no-ri --no-rdoc && i
RUN         gem install sensu-plugin vmstat sys sys-filesystem


ENTRYPOINT  ["/docker-entrypoint.sh"]

CMD         ["start"]
