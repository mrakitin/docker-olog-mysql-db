# Docker image for olog-mysql database

FROM mysql:latest

MAINTAINER Maksim Rakitin <mrakitin@bnl.gov>

# The only operation we should do is to copy the initialization script
# to the folder mentioned in the documentation
COPY sql/ /docker-entrypoint-initdb.d/
