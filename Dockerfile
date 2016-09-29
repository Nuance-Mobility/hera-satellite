FROM 		nuancemobility/sensu-client
MAINTAINER 	sspcm <mobility-sspcm@nuance.com>

# Configure Sensu with whatever your checks require
#RUN 		apt-get install -y ruby zlib1g-dev ruby-dev build-essential git libsmi2ldbl && \
#			gem install net-ping sensu-plugin snmp nokogiri nori rest-client colorize --no-ri --no-rdoc && i


# Update apt
RUN         apt-get update -y

# Configure Sensu for plugin dependencies 
RUN         apt-get install -y ruby build-essential
            

# Install Python plugin dependencies    
RUN        apt-get install -y python3-pip && pip3 install -U selenium && pip3 install requests
        
# Install Nagios plugins
RUN        apt-get -y install nagios-plugins

# Install diagnostic tools
RUN         gem install sensu-plugin vmstat sys sys-filesystem


COPY docker-entrypoint.sh /

ENTRYPOINT  ["/docker-entrypoint.sh"]

CMD         ["start"]
