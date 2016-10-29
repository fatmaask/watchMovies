## BUILDING
##   (from project root directory)
##   $ docker build -t python-for-fatmaask-watchmovies .
##
## RUNNING
##   $ docker run python-for-fatmaask-watchmovies

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="jagci48" \
    STACKSMITH_STACK_NAME="Python for fatmaask/watchMovies" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install python-2.7.12-1 --checksum 1ab49b32453c509cf6ff3abb9dbe8a411053e3b811753a10c7a77b4bc19606df

ENV PATH=/opt/bitnami/python/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Python base template
COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["python"]
