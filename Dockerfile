# If you change anything here, bump the version in:
# - run/Dockerfile
# - .github/workflows/docker.yml

FROM python:3.10-slim

RUN set -eux; \
    apt-get update; \
    apt-get install -y git; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

COPY pyproject.toml ./
COPY poetry.lock ./
COPY coverage_comment ./coverage_comment
RUN pip install poetry
RUN poetry install --no-dev

CMD [ "coverage_comment" ]
