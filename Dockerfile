ARG DBT_IMAGE=python:3.10-slim

FROM $DBT_IMAGE

ARG BUILD_DEPS="\
  gcc \
  software-properties-common \
  make \
  build-essential \
  libpq-dev \
  gcc \
  g++ \
  libsasl2-dev \
"

ARG RUNTIME_DEPS="\
  git \
  curl \
  ssh \
  msodbcsql18 \
  libgssapi-krb5-2 \
  unixodbc-dev \
"

WORKDIR /usr/app/

COPY ./docker/requirements.txt ./docker/constraints.txt ./docker/

RUN apt-get -qq update && \
    apt-get -qqy --no-install-recommends install curl gnupg && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get -qq update && \
    ACCEPT_EULA=Y apt-get -qqy --no-install-recommends install \
      $BUILD_DEPS \
      $RUNTIME_DEPS &&  \
    pip --no-cache-dir install \
      -r ./docker/requirements.txt \
      -c ./docker/constraints.txt && \
    apt-get -y purge $BUILD_DEPS &&  \
    apt-get -y autoremove &&  \
    rm -rf /var/lib/apt/lists/* &&  \
    rm -rf /var/cache/apt

ENV PATH=/opt/mssql-tools18/bin:$PATH

COPY . .
COPY ./conf/.dbt/profiles.yml /root/.dbt/profiles.yml

RUN dbt deps
