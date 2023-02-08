from typing import Dict

from fastapi import APIRouter, Depends

from ..dependencies import get_token_header

router = APIRouter(
    prefix="/api",
    dependencies=[Depends(get_token_header)],
    responses={404: {"description":"Not found"}}
)

@router.get("/")
async def root() -> Dict[str, str]:
    return {"message": "Hello World"}
