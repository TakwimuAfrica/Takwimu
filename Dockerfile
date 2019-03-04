FROM codeforafrica/hurumap-dashboard:0.2.8

# Set env variables used in this Dockerfile
# HURUmap App and Django settings
ENV HURUMAP_APP=takwimu
ENV DJANGO_SETTINGS_MODULE=takwimu.settings
# Local directory with project source
ENV APP_SRC=.
# Directory in container for all project files
ENV APP_SRVHOME=/src
# Directory in container for project source files
ENV APP_SRVPROJ=/src/takwimu

# Add application source code to SRCDIR
ADD $APP_SRC $APP_SRVPROJ

# temporary fix for media files from old deployment
# to be removed when media files moved to S3 
# Create application subdirectories
WORKDIR $APP_SRVHOME
RUN mkdir media static logs
VOLUME ["$APP_SRVHOME/media/", "$APP_SRVHOME/logs/"]


# Copy entrypoint script into the image
WORKDIR $APP_SRVPROJ

# Install app dependencies
COPY ./requirements.txt /
RUN pip install -q -r /requirements.txt
