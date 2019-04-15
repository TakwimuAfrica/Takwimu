FROM codeforafrica/hurumap:0.6.0

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

# Copy entrypoint script into the image
WORKDIR $APP_SRVPROJ

# Install app dependencies
COPY ./requirements.txt /
RUN pip install -q -r /requirements.txt
