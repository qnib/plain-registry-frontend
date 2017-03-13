FROM qnib/uplain-init

RUN apt-get update \
 && apt-get install -y unzip wget 
RUN cd /tmp/ \
 && wget -q https://github.com/kwk/docker-registry-frontend/archive/v2.zip \
 && unzip v2.zip \
 && rm -f v2.zip \
 && apt-get -y install \
      bzip2 \
      git \
      nodejs \
      nodejs-legacy \
      npm \
 && cd /tmp/docker-registry-frontend-2/ \
 && npm install \
 && node_modules/bower/bin/bower install --allow-root --force-latest \
 && node_modules/grunt-cli/bin/grunt build --allow-root --force-latest
RUN apt-get install -y nginx
