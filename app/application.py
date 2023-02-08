from fastapi import FastAPI

from .router.base import router as base
from .router.healthcheck import router as healthcheck


def create_app():
    app = FastAPI()
    app.include_router(base)
    app.include_router(healthcheck)
    return app
