set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=takwimuafrica
# image name
IMAGE=takwimu
docker build -t $USERNAME/$IMAGE:latest .
