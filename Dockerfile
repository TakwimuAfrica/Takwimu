FROM codeforafrica/hurumap-base:0.1.0
ENV DEBIAN_FRONTEND noninteractive

# Set env variables used in this Dockerfile
# Local directory with project source
ENV TAKWIMU_SRC=.
# Directory in container for all project files
ENV TAKWIMU_SRVHOME=/srv
# Directory in container for project source files
ENV TAKWIMU_SRVPROJ=/srv/takwimu

# Create application subdirectories
WORKDIR $TAKWIMU_SRVHOME
RUN mkdir media static logs
VOLUME ["$TAKWIMU_SRVHOME/media/", "$TAKWIMU_SRVHOME/logs/"]

# Install Python dependencies
COPY ./requirements.txt /
RUN pip install -q -U pip setuptools
RUN pip install -q -r /requirements.txt

# Add application source code to SRCDIR
ADD $TAKWIMU_SRC $TAKWIMU_SRVPROJ

# Expose Django service
EXPOSE 8000

# Copy entrypoint script into the image
WORKDIR $TAKWIMU_SRVPROJ
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
