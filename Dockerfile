FROM python:2.7-stretch
ENV DEBIAN_FRONTEND noninteractive

MAINTAINER Code for Africa

# Set env variables used in this Dockerfile
# Local directory with project source
ENV TAKWIMU_SRC=.
# Directory in container for all project files
ENV TAKWIMU_SRVHOME=/srv
# Directory in container for project source files
ENV TAKWIMU_SRVPROJ=/srv/takwimu


# Installing OS Dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install binutils libproj-dev gdal-bin python-gdal libgdal-dev -y
RUN apt-get install libtiff5-dev libjpeg62-turbo-dev zlib1g-dev \
    libfreetype6-dev liblcms2-dev libwebp-dev libharfbuzz-dev libfribidi-dev \
    tcl8.6-dev tk8.6-dev python-tk -y
RUN apt-get install postgresql-client -y

# Create application subdirectories
WORKDIR $TAKWIMU_SRVHOME
RUN mkdir media static logs
VOLUME ["$TAKWIMU_SRVHOME/media/", "$TAKWIMU_SRVHOME/logs/"]

# Copy application source code to SRCDIR
ADD $TAKWIMU_SRC $TAKWIMU_SRVPROJ

# Install Python dependencies
RUN pip install -q -U pip setuptools
RUN pip install -q -r $TAKWIMU_SRVPROJ/requirements.txt 

# GDAL pains
RUN pip install -q GDAL==2.1.3 --global-option=build_ext --global-option="-I/usr/include/gdal"
RUN pip install -q "Shapely>=1.5.13"

# Expose Django service
EXPOSE 8000

# Copy entrypoint script into the image
WORKDIR $TAKWIMU_SRVPROJ
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
