FROM python:3.10-slim-bullseye as base

ENV PATH /usr/local/bin:$PATH
ENV PYTHONPATH=${PYTHONPATH}:${PWD}
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONFAULTHANDLER 1 \
    PYTHONHASHSEED random \
    PYTHONUNBUFFERED 1 \
    PYTHONDONTWRITEBYTECODE 1
ENV PIP_ROOT_USER_ACTION=ignore

RUN pip install --upgrade pip
RUN apt-get update -qq && apt-get install -qq --no-install-recommends -y \
    make gcc libffi-dev \
    && pip install poetry

WORKDIR /app
COPY pyproject.toml poetry.lock /app/

RUN poetry config virtualenvs.create false
RUN poetry install

COPY . /app

FROM base as final

COPY --from=base /app .

ENTRYPOINT ["sh", "start.sh"]
