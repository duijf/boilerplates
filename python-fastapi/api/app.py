from __future__ import annotations

import logging
import typing as t

from fastapi import APIRouter, FastAPI
from fastapi.param_functions import Depends
from starlette.responses import (
    JSONResponse,
    Response,
)

from api.config import get_config
from api.postgres import Connection, Postgres, connect_and_migrate

logger = logging.getLogger(__name__)
router = APIRouter()


@router.get("/")
async def get_home(conn: Connection = Depends(Postgres.connection)) -> Response:
    users = await conn.fetch("SELECT username FROM users;")
    return JSONResponse(content={"users": [user[1] for user in users]})


def create_app() -> FastAPI:
    config = get_config()

    async def on_startup() -> None:
        await connect_and_migrate(config.postgres)

    async def on_shutdown() -> None:
        await Postgres.disconnect()

    app = FastAPI(
        openapi_url=None,
        on_startup=[on_startup],
        on_shutdown=[on_shutdown],
        # CUSTOMIZE
        # exception_handlers={},
    )

    # CUSTOMIZE
    # app.mount(
    #     "/static", app=StaticFiles(directory=config.static_dir, html=True)
    # )

    app.include_router(router)

    return app
