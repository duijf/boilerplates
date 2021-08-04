from __future__ import annotations

import os
import typing as t
from functools import lru_cache
from pathlib import Path

from pydantic import BaseSettings, validator

from api.postgres import PostgresConfig

DelayedInit: t.Any = None


class Config(BaseSettings):
    project_root: Path
    templates_dir: Path
    static_dir: Path
    host: str
    port: int
    postgres: PostgresConfig = DelayedInit

    # pylint: disable=no-self-argument,no-self-use
    @validator("postgres")
    def populate_postgres(
        cls, _v: t.Any, values: t.Dict[str, t.Any]
    ) -> PostgresConfig:
        migrations_dir = values["project_root"] / "migrations"
        return PostgresConfig(migrations_dir=migrations_dir)

    @property
    def api_url(self) -> str:
        return f"http://{self.host}:{self.port}"

    @classmethod
    def from_env(cls) -> Config:
        project_root = Path(os.environ["PROJECT_ROOT"])
        templates_dir = project_root / "templates"
        static_dir = project_root / "static"

        return cls(
            project_root=project_root,
            templates_dir=templates_dir,
            static_dir=static_dir,
        )


@lru_cache
def get_config() -> Config:
    return Config.from_env()
