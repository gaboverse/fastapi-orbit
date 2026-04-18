FROM python:3.11.5-slim-bookworm AS base

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN pip install --upgrade pip

RUN apt update &&\
    apt install -y git

RUN adduser fastapi

USER fastapi

WORKDIR /api

RUN pip install --upgrade pip
