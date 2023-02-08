from datetime import datetime
from typing import Dict

from fastapi import APIRouter

router = APIRouter()


@router.get("/health/")
def alive() -> Dict[str, datetime]:
    return {"timestamp": datetime.now()}
