# Base python 3.4 build, inspired by https://github.com/Pakebo/eb-docker-django-simple
# OS HERE | Python 3.4 | Django

FROM python:3-onbuild
MAINTAINER Rafael Miranda (lets.email.rafa@gmail.com)

##############################################################################
# OS Updates and Python packages
##############################################################################

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y


RUN apt-get install -y apt-utils
# Libs required for geospatial libraries on Debian...
RUN apt-get -y install binutils libproj-dev gdal-bin

##############################################################################
# A Few pip installs not commonly in requirements.txt
##############################################################################


RUN apt-get install -y nano wget
# build dependencies for postgres and image bindings
RUN apt-get install -y python-imaging python-psycopg2


##############################################################################
# setup startup script for gunicord WSGI service 
##############################################################################

RUN groupadd webapps
RUN useradd webapp -G webapps
RUN mkdir -p /var/log/webapp/ && chmod 777 /var/log/webapp/
RUN mkdir -p /var/run/webapp/ && chmod 777 /var/run/webapp/


##############################################################################
# Install and configure supervisord
##############################################################################

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD ./deploy/supervisor_conf.d/webapp.conf /etc/supervisor/conf.d/webapp.conf

##############################################################################
# Install dependencies and run scripts.
##############################################################################

ADD .      /var/projects/mysite

RUN cd /var/projects/mysite && pip install -r requirements.txt


##############################################################################
# Run start.sh script when the container starts. 
# Note: If you run migrations etc outside CMD, envs won't be available!
##############################################################################
CMD ["sh", "./deploy/container_start.sh"]

# Expose listen ports
EXPOSE 8002